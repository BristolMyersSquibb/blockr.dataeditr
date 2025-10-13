#' Edit cells in a data frame
#'
#' This block allows users to interactively edit data and download the output
#' to disk.
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
    tagList(
      dataEditUI(NS(id, "edit-ui"))
    )
  }

  server <- function(id, .data) {
    moduleServer(id, function(input, output, session) {
      col_options <- isolate({
        opts <- list()
        if (".bold" %in% colnames(.data())) {
          opts$.bold <- TRUE
        }
        if (".indent" %in% colnames(.data())) {
          opts$.indent <- unique(.data()$.indent)
        }
        opts
      })

      edited_data <- dataEditServer(
        "edit-ui",
        data = .data,
        col_edit = TRUE,
        col_stretch = TRUE,
        row_edit = TRUE,
        col_options = col_options
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
