
#' IOFLOW
#'
#' This package contains the IOFLOW data exported from Maya,
#' formatted to be convenient for the analysis.
#' @docType package
#' @name IOFLOW
NULL

#' palette_IOFLOW
#'
#' The color palette used to plot the figure of the IOFLOW analysis
#'#' @format A \code{vector} of length 13 with colors hex code
"palette_IOFLOW"
NULL

#' Density_Data
#'
#' A nested list with the density tested water tracer tracking
#' @format A \code{list} of 19 lists corresponding to each tested water tracer
#' \describe{
#'   \item{Frame}{frames of the trial}
#'   \item{Time}{time of the trial}
#'   \item{X}{the x trajectory of the water tracer}
#'   \item{Y}{the y trajectory of the water tracer}
#' }
"Density_Data"
NULL

#' Maya_WF
#'
#' A large nested list with the water and food (WF) data exported from Maya
#' @format A \code{list} of 13 lists corresponding to each analysed trial of carp and tilapia, containing
#' the water and food tracers data (F for fluid, A for food...)
#' \describe{
#'   \item{frame}{frames of the trial}
#'   \item{A01.data.tx}{the x trajectory of the food tracer "A01"}
#'   \item{A01.data.ty}{the y trajectory of the food tracer "A01"}
#'   \item{A01.data.tz}{the z trajectory of the food tracer "A01"}
#'   \item{F01.data.tx}{the x trajectory of the water tracer "F01"}
#'   \item{F01.data.ty}{the y trajectory of the water tracer "F01"}
#'   \item{F01.data.tz}{the z trajectory of the water tracer "F01"}
#' }
"Maya_WF"
NULL

#' Maya_RB
#'
#' A large nested list with the rigid body (RB) data exported from Maya
#' @format A \code{list} of 10 lists corresponding to each analysed trial of carp and tilapia, containing
#' the rigid body data:
#' \describe{
#'   \item{hyoid}{"hyoid" rigid body data}
#'       \item{hyoid.data.tx}{the x trajectory of the rigid body "hyoid"}
#'       \item{hyoid.data.ty}{the y trajectory of the rigid body "hyoid"}
#'       \item{hyoid.data.tz}{the z trajectory of the rigid body "hyoid"}
#'       \item{hyoid.data.rx}{the x rotation of the rigid body "hyoid"}
#'       \item{hyoid.data.ry}{the y rotation of the rigid body "hyoid"}
#'       \item{hyoid.data.rz}{the z rotation of the rigid body "hyoid"}
#'   \item{inf}{"lower jaw" rigid body data}
#'   \item{sup}{"upper jaw" rigid body data}
#'   \item{ope}{"operculum" rigid body data}
#'   ...
#' }
"Maya_RB"
NULL

#' Maya_Loc
#'
#' A large nested list with the Locator (Loc) data exported from Maya
#' @format A \code{list} of 10 lists corresponding to each analysed trial of carp and tilapia, containing
#' the locator data:
#' \describe{
#'   \item{BonesLocators_relative}{"Locators" data}
#'       \item{ope_tip_data.tx}{the x trajectory of the locator attached to the tip of the "opercula"}
#'       \item{ope_tip_data.ty}{the y trajectory of the locator attached to the tip of the "opercula"}
#'       \item{ope_tip_data.tz}{the z trajectory of the locator attached to the tip of the "opercula"}
#'       \item{hyoid_tip_data.tx}{the x trajectory of the locator attached to the tip of the "hyoid"}
#'       \item{hyoid_tip_data.ty}{the y trajectory of the locator attached to the tip of the "hyoid"}
#'       \item{hyoid_tip_data.tz}{the z trajectory of the locator attached to the tip of the "hyoid"}.
#'       \item{lower_jaw__data.tx}{the x trajectory of the locator attached to the tip of the "lower_jaw"}
#'       \item{lower_jaw__data.ty}{the y trajectory of the locator attached to the tip of the "lower_jaw"}
#'       \item{lower_jaw_data.tz}{the z trajectory of the locator attached to the tip of the "lower_jaw"}
#'       \item{upper_jaw_tip_data.tx}{the x trajectory of the locator attached to the tip of the "upper_jaw"}
#'       \item{upper_jaw_tip_data.ty}{the y trajectory of the locator attached to the tip of the "upper_jaw"}
#'       \item{upper_jaw_tip_data.tz}{the z trajectory of the locator attached to the tip of the "upper_jaw"}
#'   ...
#' }
"Maya_Loc"
NULL

#' Timing
#'
#' A  nested list with the timing data exported from Maya
#' @format A \code{list} of 13 lists corresponding to timing information:
#' \describe{
#'   \item{frame}{frames of the trial}
#'   \item{timing}{time of the trial (750 fps)}
#'   \item{seq}{color code corresponding to phase (1st strike or reverse flow)}
#' }
"Timing"
NULL

#' Sequence
#'
#' A dataframe with timing information gathered from the trial observation
#' @format A \code{dataframe} of 15 rows  corresponding to each analysed trial of carp and tilapia and 5 columns:
#' \describe{
#'   \item{name}{name of the trial}
#'   \item{beg_FS}{beginning of the first strike}
#'   \item{end_FS}{end of the first strike}
#'   \item{beg_RF}{beginning of the first reverse flow} # tag:useless?
#'   \item{end_EF}{end of the first reverse flow}
#' }
"Sequence"
NULL

#' Trials
#' A sequence number of the length of the analysed trials
#'#' @format A \code{vector} of length 13
"Trials"
NULL

#' WF_tx
#'
#' A  nested list with the water and food (WF) tx data exported from Maya
#' @format A \code{list} of 13 lists corresponding to each analysed trial of carp and tilapia, containing
#' the water and food tracers tx data (F for fluid, A for food...)
#' \describe{
#'   \item{A01.data.tx}{the x trajectory of the food tracer "A01"}
#' }
"WF_tx"
NULL

#' WF_ty
#'
#' A  nested list with the water and food (WF) ty data exported from Maya
#' @format A \code{list} of 13 lists corresponding to each analysed trial of carp and tilapia, containing
#' the water and food tracers ty data (F for fluid, A for food...)
#' \describe{
#'   \item{A01.data.ty}{the y trajectory of the food tracer "A01"}
#' }
"WF_ty"
NULL

#' WF_tz
#'
#' A  nested list with the water and food (WF) z data exported from Maya
#' @format A \code{list} of 13 lists corresponding to each analysed trial of carp and tilapia, containing
#' the water and food tracers tz data (F for fluid, A for food...)
#' \describe{
#'   \item{A01.data.tz}{the z trajectory of the food tracer "A01"}
#' }
"WF_tz"
NULL

#' WF_vx
#'
#' A  nested list with the water and food (WF) vx data exported from Maya
#' @format A \code{list} of 13 lists corresponding to each analysed trial of carp and tilapia, containing
#' the water and food tracers vx data (F for fluid, A for food...)
#' \describe{
#'   \item{A01.data.vx}{the x velocity of the food tracer "A01"}
#' }
"WF_vx"
NULL

#' WF_vy
#'
#' A  nested list with the water and food (WF) vy data exported from Maya
#' @format A \code{list} of 13 lists corresponding to each analysed trial of carp and tilapia, containing
#' the water and food tracers vy data (F for fluid, A for food...)
#' \describe{
#'   \item{A01.data.vy}{the y velocity of the food tracer "A01"}
#' }
"WF_vy"
NULL

#' WF_vz
#'
#' A  nested list with the water and food (WF) vz data exported from Maya
#' @format A \code{list} of 13 lists corresponding to each analysed trial of carp and tilapia, containing
#' the water and food tracers vz data (F for fluid, A for food...)
#' \describe{
#'   \item{A01.data.vz}{the z velocity of the food tracer "A01"}
#' }
"WF_vz"
NULL

#' Mean_tx_W
#'
#' A  nested list with the mean, minimum, maximum and standard deviation of tx data over the water tracers
#' @format A \code{list} of 13 lists corresponding to each analysed trial of carp and tilapia, containing:
#' \describe{
#'   \item{item}{character "F" for Water}
#'   \item{average}{the mean of x trajectory over all the water tracers on each frame of the trial}
#'   \item{std}{the standard deviation of x trajectory over all the water tracers on each frame of the trial}
#'   \item{min}{the minimum of x trajectory over all the water tracers on each frame of the trial}
#'   \item{max}{the maximum of x trajectory over all the water tracers on each frame of the trial}
#' }
"Mean_tx_W"
NULL

#' Mean_ty_W
#'
#' A  nested list with the mean, minimum, maximum and standard deviation of ty data over the water tracers
#' @format A \code{list} of 13 lists corresponding to each analysed trial of carp and tilapia, containing:
#' \describe{
#'   \item{item}{character "F" for Water}
#'   \item{average}{the mean of y trajectory over all the water tracers on each frame of the trial}
#'   \item{std}{the standard deviation of y trajectory over all the water tracers on each frame of the trial}
#'   \item{min}{the minimum of y trajectory over all the water tracers on each frame of the trial}
#'   \item{max}{the maximum of y trajectory over all the water tracers on each frame of the trial}
#' }
"Mean_ty_W"
NULL

#' Mean_tz_W
#'
#' A  nested list with the mean, minimum, maximum and standard deviation of tz data over the water tracers
#' @format A \code{list} of 13 lists corresponding to each analysed trial of carp and tilapia, containing:
#' \describe{
#'   \item{item}{character "F" for Water}
#'   \item{average}{the mean of z trajectory over all the water tracers on each frame of the trial}
#'   \item{std}{the standard deviation of z trajectory over all the water tracers on each frame of the trial}
#'   \item{min}{the minimum of z trajectory over all the water tracers on each frame of the trial}
#'   \item{max}{the maximum of z trajectory over all the water tracers on each frame of the trial}
#' }
"Mean_tz_W"
NULL

#' Mean_tx_F
#'
#' A  nested list with the mean, minimum, maximum and standard deviation of tx data over the food tracers
#' @format A \code{list} of 13 lists corresponding to each analysed trial of carp and tilapia, containing:
#' \describe{
#'   \item{item}{character "F" for Food}
#'   \item{average}{the mean of x trajectory over all the food tracers on each frame of the trial}
#'   \item{std}{the standard deviation of x trajectory over all the food tracers on each frame of the trial}
#'   \item{min}{the minimum of x trajectory over all the food tracers on each frame of the trial}
#'   \item{max}{the maximum of x trajectory over all the food tracers on each frame of the trial}
#' }
"Mean_tx_F"
NULL

#' Mean_ty_F
#'
#' A  nested list with the mean, minimum, maximum and standard deviation of ty data over the food tracers
#' @format A \code{list} of 13 lists corresponding to each analysed trial of carp and tilapia, containing:
#' \describe{
#'   \item{item}{character "F" for Food}
#'   \item{average}{the mean of y trajectory over all the food tracers on each frame of the trial}
#'   \item{std}{the standard deviation of y trajectory over all the food tracers on each frame of the trial}
#'   \item{min}{the minimum of y trajectory over all the food tracers on each frame of the trial}
#'   \item{max}{the maximum of y trajectory over all the food tracers on each frame of the trial}
#' }
"Mean_ty_F"
NULL

#' Mean_tz_F
#'
#' A  nested list with the mean, minimum, maximum and standard deviation of tz data over the food tracers
#' @format A \code{list} of 13 lists corresponding to each analysed trial of carp and tilapia, containing:
#' \describe{
#'   \item{item}{character "F" for Food}
#'   \item{average}{the mean of z trajectory over all the food tracers on each frame of the trial}
#'   \item{std}{the standard deviation of z trajectory over all the food tracers on each frame of the trial}
#'   \item{min}{the minimum of z trajectory over all the food tracers on each frame of the trial}
#'   \item{max}{the maximum of z trajectory over all the food tracers on each frame of the trial}
#' }
"Mean_tz_F"
NULL

#' Mean_vx_W
#'
#' A  nested list with the mean, minimum, maximum and standard deviation of tx data over the water tracers
#' @format A \code{list} of 13 lists corresponding to each analysed trial of carp and tilapia, containing:
#' \describe{
#'   \item{item}{character "F" for Water}
#'   \item{average}{the mean of x velocity over all the water tracers on each frame of the trial}
#'   \item{std}{the standard deviation of x velocity over all the water tracers on each frame of the trial}
#'   \item{min}{the minimum of x velocity over all the water tracers on each frame of the trial}
#'   \item{max}{the maximum of x velocity over all the water tracers on each frame of the trial}
#' }
"Mean_vx_W"
NULL

#' Mean_vy_W
#'
#' A  nested list with the mean, minimum, maximum and standard deviation of ty data over the water tracers
#' @format A \code{list} of 13 lists corresponding to each analysed trial of carp and tilapia, containing:
#' \describe{
#'   \item{item}{character "F" for Water}
#'   \item{average}{the mean of y velocity over all the water tracers on each frame of the trial}
#'   \item{std}{the standard deviation of y velocity over all the water tracers on each frame of the trial}
#'   \item{min}{the minimum of y velocity over all the water tracers on each frame of the trial}
#'   \item{max}{the maximum of y velocity over all the water tracers on each frame of the trial}
#' }
"Mean_vy_W"
NULL

#' Mean_vz_W
#'
#' A  nested list with the mean, minimum, maximum and standard deviation of tz data over the water tracers
#' @format A \code{list} of 13 lists corresponding to each analysed trial of carp and tilapia, containing:
#' \describe{
#'   \item{item}{character "F" for Water}
#'   \item{average}{the mean of z velocity over all the water tracers on each frame of the trial}
#'   \item{std}{the standard deviation of z velocity over all the water tracers on each frame of the trial}
#'   \item{min}{the minimum of z velocity over all the water tracers on each frame of the trial}
#'   \item{max}{the maximum of z velocity over all the water tracers on each frame of the trial}
#' }
"Mean_vz_W"
NULL

#' Mean_vx_F
#'
#' A  nested list with the mean, minimum, maximum and standard deviation of tx data over the food tracers
#' @format A \code{list} of 13 lists corresponding to each analysed trial of carp and tilapia, containing:
#' \describe{
#'   \item{item}{character "F" for Food}
#'   \item{average}{the mean of x velocity over all the food tracers on each frame of the trial}
#'   \item{std}{the standard deviation of x velocity over all the food tracers on each frame of the trial}
#'   \item{min}{the minimum of x velocity over all the food tracers on each frame of the trial}
#'   \item{max}{the maximum of x velocity over all the food tracers on each frame of the trial}
#' }
"Mean_vx_F"
NULL

#' Mean_vy_F
#'
#' A  nested list with the mean, minimum, maximum and standard deviation of ty data over the food tracers
#' @format A \code{list} of 13 lists corresponding to each analysed trial of carp and tilapia, containing:
#' \describe{
#'   \item{item}{character "F" for Food}
#'   \item{average}{the mean of y velocity over all the food tracers on each frame of the trial}
#'   \item{std}{the standard deviation of y velocity over all the food tracers on each frame of the trial}
#'   \item{min}{the minimum of y velocity over all the food tracers on each frame of the trial}
#'   \item{max}{the maximum of y velocity over all the food tracers on each frame of the trial}
#' }
"Mean_vy_F"
NULL

#' Mean_vz_F
#'
#' A  nested list with the mean, minimum, maximum and standard deviation of tz data over the food tracers
#' @format A \code{list} of 13 lists corresponding to each analysed trial of carp and tilapia, containing:
#' \describe{
#'   \item{item}{character "F" for Food}
#'   \item{average}{the mean of z velocity over all the food tracers on each frame of the trial}
#'   \item{std}{the standard deviation of z velocity over all the food tracers on each frame of the trial}
#'   \item{min}{the minimum of z velocity over all the food tracers on each frame of the trial}
#'   \item{max}{the maximum of z velocity over all the food tracers on each frame of the trial}
#' }
"Mean_vz_F"
NULL

#' Particle
#'
#' A  nested list with all the Particle trajectory (tx, ty, and tz) for each Trial
#' @format A \code{list} of 13 lists corresponding to each analysed trial of carp and tilapia, containing
#' the trajectory of each particle analyzed in this trial :
#' \describe{
#'   \item{A01}{Particle "A01"}
#'      \item{A01.data.tx}{the x trajectory of the food tracer "A01"}
#'      \item{A01.data.ty}{the y trajectory of the food tracer "A01"}
#'      \item{A01.data.tz}{the z trajectory of the food tracer "A01"}
#'   ...
#' }
"Particle"
NULL
