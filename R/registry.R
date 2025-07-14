register_dataeditr_blocks <- function() {
  blockr.core::register_blocks(
    ctor = c("new_data_edit_block"),
    name = c("Data Edit Block"),
    description = c("Edit a data frame"),
    package = utils::packageName(),
    overwrite = TRUE
  )
}
