test_that("basic block constructor", {
  expect_s3_class(new_data_edit_block(), "data_edit")
})

test_that("block state correctly returns an empty list", {
  testServer(
    app = new_data_edit_block()$expr_server,
    args = list(.data = reactive(mtcars)),
    expr = {
      expect_equal(session$returned$state, list())
    }
  )
})

test_that("expr evaluates correctly", {
  testServer(
    app = new_data_edit_block()$expr_server,
    args = list(.data = reactive(head(mtcars))),
    expr = {
      # Why does `evaulated_expr` return NULL? It seems the data isn't being
      # initialised without running the GUI.
      evaluated_expr <- eval(session$returned$expr())
      expect_equal(evaluated_expr, head(mtcars))
    }
  )
})
