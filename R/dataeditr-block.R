#' @keywords internal
#' @noRd
new_dataeditr_block <- function(server, ui, class, ctor = sys.parent(), ...) {
  new_block(server, ui, c(class, "dataeditr_block"), ctor, ...)
}
