#' Deprecated functions
#'
#' \Sexpr[results=rd, stage=render]{lifecycle::badge("deprecated")}
#' Some functions have been deprecated and are no longer being actively
#' supported.
#'
#' @name deprecated
#' @keywords internal
NULL

# v1.1.0 -----------------------------------------------------------------------
#' @rdname deprecated
#' @export
add_comparison <- function(...) {
  lifecycle::deprecate_stop("1.1.0", "gtsummary::add_comparison()", "add_p()")
}

#' @rdname deprecated
#' @export
add_global <- function(...) {
  lifecycle::deprecate_stop("1.1.0", "gtsummary::add_global()", "add_global_p()")
}

# v1.2.0 -----------------------------------------------------------------------
#' @rdname deprecated
#' @export

tab_style_bold_p <- function(...) {
  lifecycle::deprecate_stop("1.2.0", "gtsummary::tab_style_bold_p()", "bold_p()")
}

#' @rdname deprecated
#' @export
tab_style_bold_labels <- function(...) {
  lifecycle::deprecate_stop("1.2.0", "gtsummary::tab_style_bold_labels()", "bold_labels()")
}

#' @rdname deprecated
#' @export
tab_style_italicize_levels <- function(...) {
  lifecycle::deprecate_stop("1.2.0", "gtsummary::tab_style_italicize_levels()", "italicize_levels()")
}

#' @rdname deprecated
#' @export
tab_style_italicize_labels <- function(...) {
  lifecycle::deprecate_stop("1.2.0", "gtsummary::tab_style_italicize_labels()", "italicize_labels()")
}

#' @rdname deprecated
#' @export
tab_style_bold_levels <- function(...) {
  lifecycle::deprecate_stop("1.2.0", "gtsummary::tab_style_bold_levels()", "bold_levels()")
}

# v1.2.5 -----------------------------------------------------------------------
#' @rdname deprecated
#' @export
tbl_summary_ <- function(...) {
  lifecycle::deprecate_warn("1.2.5", "gtsummary::tbl_summary_()", "tbl_summary()")
  tbl_summary(...)
}

#' @rdname deprecated
#' @export
add_p_ <- function(...) {
  lifecycle::deprecate_warn("1.2.5", "gtsummary::add_p_()", "add_p()")
  add_p(...)
}

# v1.3.3 -----------------------------------------------------------------------
#' @rdname deprecated
#' @export
as_flextable <- function(...) {
  lifecycle::deprecate_warn(
    "1.3.3", "gtsummary::as_flextable()", "as_flex_table()",
    details = paste(
      "The `as_flextable()` function graduated",
      "from 'Experimental' status in v1.3.3. The function's name was changed",
      "to avoid a name conflict with `flextable::as_flextable()`.",
      "If you are trying to use the function",
      "from {flextable}, for the time being, use the double colon notation",
      "when both {gtsummary} and {flextable}",
      "are loaded, e.g. `flextable::as_flextable(...)`."
    ) %>%
      stringr::str_wrap()
  )

  # passing args to `as_flex_table()` ------------------------------------------
  as_flex_table(...)
}

