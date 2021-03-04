# data-raw/process.R
# Data import and processing pipeline


# 1. IMPORTS #############################################


## Libraries -----------------------
library(here)
library(dplyr)
library(purrr)
library(stringr)

## Source functions -----------------------
# source(file = here("R", "name_nested.R"))
# source(file = here("R", "to_nested_colnames.R"))
# source(file = here("R", "sublist.R"))
# source(file = here("R", "compute_velocity.R"))
# source(file = here("R", "build_vel.R"))
# source(file = here("R", "mean_particles.R"))
# source(file = here("R", "build_particle.R"))
# source(file = here("R", "build_mean.R"))

devtools::load_all()


# 2. SETTINGS #############################################

#' Color palette
palette_IOFLOW <-  c("#8DD3C7", "#FFE7B3", "#BEBADA" ,"#FB8072" ,"#80B1D3",
         "#FDB462", "#B3DE69" ,"#FCCDE5" ,"#D9D9D9", "#BC80BD",
         "#CCEBC5", "#FFD66F", "#5e5d5d")
palette(palette_IOFLOW)


# 3. RAW DATA IMPORT #############################################

## Density data -----------------

files_density <- list.files(path = here("data-raw"), pattern = "tracking.txt", full.names = TRUE)

Density_Data <- map(.x = files_density,
               .f = ~read.table(file=., sep=",", dec=".", skip=10, col.names = c("Frame", "Time", "X", "Y"))) %>%
  set_names(map_chr(.x = files_density,
                    .f = ~paste0(substr(x=.,
                                        start= (nchar(.)- nchar("NR01_tracking.txt")+1),
                                        stop= (nchar(.)- nchar("_tracking.txt"))))))

## Water and Food tracers data ---------------

# Collect the .csv files with water and food tracers data exported from Maya #tag!:document the Maya export
files_WF <- list.files(path = here("data-raw"), pattern = "3D_relative_phar.csv", full.names = TRUE)

# Build Maya_WF: Food and Water tracers data (frame, tx, ty, tz) exported from Maya

Maya_WF <- map(.x = files_WF,
            .f = ~read.csv2(file=., header = TRUE, sep = ",", dec = ".", na.strings = "NaN")) %>%
  set_names(map_chr(.x = files_WF,
                    .f = ~paste0(substr(x=.,
                                        start= (nchar(.)- nchar("C1P1T08_3D_relative_phar.csv")+1),
                                        stop= (nchar(.)- nchar("_3D_relative_phar.csv"))))))

Trials <-  1:length(Maya_WF)



## Rigid Body data ---------------------------
# Collect the .csv files with rigid body data exported from Maya #tag!:document the Maya export

files_RB <- list.files(path = here("data-raw"), pattern = "data.csv", full.names = TRUE)

for(i in Trials[1:10]){
  A <-  unlist(map(files_RB, ~.[contains(match = names(Maya_WF)[i], vars = .)]))
  assign (value = map(.x = unlist(map(files_RB, ~.[contains(match = names(Maya_WF)[i], vars = .)])),
                      .f = ~read.csv2(file=., header = TRUE,
                                      sep = ",", dec = ".", na.strings = "NaN")) %>%
            set_names(  substr(x=A,
                               start= nchar(here("data-raw"))+10,
                               stop= (nchar(A)- nchar("_data.csv")))), x = noquote(names(Maya_WF)[i]))

}


# Build Maya_RB: Rigid Body data (tx, ty, tz, rx, ry, rz) exported from Maya

Maya_RB <- map(Trials[1:10], ~get(noquote(names(Maya_WF)[.]))) %>% set_names(names(Maya_WF[1:10]))


## Locators exported from Maya ---------------------------
# Collect the .csv files with locator data exported from Maya #tag!:document the Maya export

files_Loc <- list.files(path  = here("data-raw"), pattern = "BonesLocators_relative_phar.csv", full.names = TRUE)

for(i in Trials[1:10]){
  A <-  unlist(map(files_Loc, ~.[contains(match = names(Maya_WF)[i], vars = .)]))
  assign (value = map(.x = unlist(map(files_Loc, ~.[contains(match = names(Maya_WF)[i], vars = .)])),
                      .f = ~read.csv2(file=., header = TRUE,
                                      sep = ",", dec = ".", na.strings = "NaN")) %>%
            set_names(substr(x=A,
                             start=  nchar(here("data-raw"))+10,
                             stop= (nchar(A)- nchar("_data.csv")))), x = noquote(names(Maya_WF)[i]))

}

# Build Maya_Loc: Locator tx, ty and tz exported from Maya

Maya_Loc <- map(Trials[1:10], ~get(noquote(names(Maya_WF)[.]))) %>% set_names(names(Maya_WF)[Trials[1:10]])



## Timing data ------------------------------
# Import the Sequence.txt file with timing information for each trial


Sequence <- read.table(file = here("data-raw", "Sequence.txt"), header = TRUE) #

Sequence <- Sequence[! Sequence$name %in% setdiff(Sequence$name, names(Maya_WF)),]

Trials <-  1:length(Maya_WF)

Frame <- lapply(Maya_WF, subset, select=1)

Time <- map(.x = Frame, .f = ~./750) %>% name_nested(x = 1, name = "timing")


Seq <- lapply(Maya_WF, subset, select=1) %>%
  name_nested(x = 1, name = "seq") %>%
  modify(modify_at, "seq", ~palette()[2])

for (i in Trials){
  j <- which(Sequence$name == names(Maya_WF)[i])
  Seq[[i]][Sequence$beg_FS[j]:Sequence$end_FS[j],] <- palette()[1] # First strike
  Seq[[i]][Sequence$beg_RF[j]:Sequence$end_RF[j],] <- palette()[3] # Reverse flow
}

Timing <- mapply(FUN = c, Frame, Time, Seq,  SIMPLIFY=FALSE)


# 4. DATA PROCESSING #############################################

## Water and Food tracers data ---------------

# Elimination of one prey item over 2 for trials with "P2"

Maya_WF[[3]] <- Maya_WF[[3]] %>% select(!starts_with("A0"))
Maya_WF[[4]] <- Maya_WF[[4]] %>% select(!starts_with("A0"))
Maya_WF[[7]] <- Maya_WF[[7]] %>% select(!starts_with("AA0"))

# Trajectory: Extract all the tx, ty and tz data from Maya_WF

Traj <- lapply(Maya_WF, subset, select=-1)

WF_tx <- sublist(Traj, "tx")
WF_ty <- sublist(Traj, "ty")
WF_tz <- sublist(Traj, "tz")

# Velocity: Compute the velocity: vx, vy and vz data from Maya_WF

WF_vx <- build_vel(Trials, WF_tx, 1/750)
WF_vy <- build_vel(Trials, WF_ty, 1/750)
WF_vz <- build_vel(Trials, WF_tz, 1/750)

# Mean Trajectory over the Water tracers
Mean_tx_W <- build_mean(Trials, WF_tx, item="F") # "F" refers to "fluid"... so means Water tracer
Mean_ty_W <- build_mean(Trials, WF_ty, item="F")
Mean_tz_W <- build_mean(Trials, WF_tz, item="F")

# Mean Trajectory over the Food tracers
Mean_tx_F <- build_mean(Trials, WF_tx, item="A") # "A" refers to "alimentation"... so means Food tracer
Mean_ty_F <- build_mean(Trials, WF_ty, item="A")
Mean_tz_F <- build_mean(Trials, WF_tz, item="A")


# Mean Velocity over the Water tracers ##########################################################################

# Mean Velocity over the Water tracers
Mean_vx_W <- build_mean(Trials, WF_vx, item="F") # "F" refers to "fluid"... so means Water tracer
Mean_vy_W <- build_mean(Trials, WF_vy, item="F")
Mean_vz_W <- build_mean(Trials, WF_vz, item="F")

# Mean Velocity over the Food tracers
Mean_vx_F <- build_mean(Trials, WF_vx, item="A") # "A" refers to "alimentation" (French)... so it means Food tracer
Mean_vy_F <- build_mean(Trials, WF_vy, item="A")
Mean_vz_F <- build_mean(Trials, WF_vz, item="A")


# Organized by particles

n_particles <- map(.x = Trials, .f = ~length(names(Traj[[.]])))
sequ <- map(.x = Trials, .f = ~seq(from= 1, to = n_particles[[.]] ,by=3))


Particle <- map(.x = Trials,
                .f = ~build_particle(data = Traj[[.]], sequ = sequ[[.]]))%>% set_names(names(Maya_WF))


# 5. ADD DATA TO PROJECT #############################################

# Export the processed data to /data folder

usethis::use_data(palette_IOFLOW, Density_Data, Trials, Maya_WF, Maya_RB, Maya_Loc, Timing, Sequence,
                  WF_tx, WF_ty, WF_tz,
                  WF_vx, WF_vy, WF_vz,
                  Mean_tx_W, Mean_ty_W, Mean_tz_W,
                  Mean_tx_F, Mean_ty_F, Mean_tz_F,
                  Mean_vx_W, Mean_vy_W, Mean_vz_W,
                  Mean_vx_F, Mean_vy_F, Mean_vz_F, Particle, overwrite = T)

rm(list = c("xlab", "ylab"))
