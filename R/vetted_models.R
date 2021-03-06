#' @title Vetted tidy models
#'
#' @description Below is a list of models vetted for use
#' in [tbl_regression] and [tbl_uvregression].  If a model is passed to these
#' functions and the model is not listed below and  a `tidy()` function is
#' not specified in the `tidy_fun=` argument, the model object will be passed
#' to `broom::tidy` or `broom.mixed::tidy`.
#'
#' \itemize{
#'  \item{[stats::lm]}
#'  \item{[stats::glm]}
#'  \item{[survival::coxph]}
#'  \item{[survival::clogit]}
#'  \item{[survival::survreg]}
#'  \item{[lme4::glmer]}
#'  \item{[lme4::lmer]}
#'  \item{[geepack::geeglm]}
#' }
#' @name vetted_models
#' @keywords internal
#' @section model support:
#' If `broom::tidy` or `broom.mixed::tidy` supports a class of model not listed
#' above, please submit a [GitHub Issue](https://github.com/ddsjoberg/gtsummary/issues).
#' The model can be added to the list of vetted models. Unit tests will be
#' put in place to ensure continued support for the model.
#'
#' @section custom tidiers:
#' In some cases you may need to use a custom function to tidy regression model
#' results. A user may pass a custom tidier function to [tbl_regression] and
#' [tbl_uvregression] in the `tidy_fun=` argument.  The function passed, however,
#' must be a proper tidier.  For example, it must return a tibble that is one
#' line per variable in the regression model; it must accept arguments
#' `exponentiate=`, `conf.level=`, and `conf.int=` since these arguments will
#' be passed to the function internally (we recommend including `...` to
#' capture any arguments you may not need). See below for an example where the
#' confidence limits for a linear regression model are calculated using Wald's method.
#' @examples
#' my_tidy <- function(x, exponentiate = FALSE, conf.level = 0.95, ...) {
#'   tidy <-
#'     dplyr::bind_cols(
#'       broom::tidy(x, conf.int = FALSE),
#'       # calculate the confidence intervals, and save them in a tibble
#'       stats::confint.default(x) %>%
#'         tibble::as_tibble() %>%
#'         rlang::set_names(c("conf.low", "conf.high"))
#'     )
#'   # exponentiating, if requested
#'   if (exponentiate == TRUE)
#'     tidy <- dplyr::mutate_at(vars(estimate, conf.low, conf.high), exp)
#'   tidy
#' }
#'
#' lm(age ~ grade + response, trial) %>%
#'   my_tidy()
NULL
