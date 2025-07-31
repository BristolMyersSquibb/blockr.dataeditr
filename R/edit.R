#' Edit cells in a data frame
#'
#' @param ... Forwarded to [blockr.core::new_block()]
#'
#' @export
#'
#' @examples
#' \dontrun{
#' serve(new_data_edit_block(), data = list(.data = head(mtcars)))
#' serve(
#'   new_data_edit_block(),
#'   data = list(
#'     .data = data.frame(stat = c("30", "40 (50)"),
#'     pattern = c("{mean}", {"{n} ({%})"}))
#'   )
#' )
#' }
new_data_edit_block <- function(...) {
  ui <- function(id) {
    tagList(dataEditUI(NS(id, "edit-ui")))
  }

  server <- function(id, .data) {
    moduleServer(id, function(input, output, session) {
      edited_data <- dataEditServer(
        "edit-ui",
        data = .data,
        col_edit = TRUE,
        col_stretch = TRUE,
        row_edit = TRUE
      )
      list(
        expr = reactive({
          edited_data()
        }),
        state = list()
      )
    })
  }

  new_dataeditr_block(
    ui = ui,
    server = server,
    class = "data_edit",
    allow_empty_state = TRUE
  )
}
