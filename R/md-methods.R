#' Methods for class `md`
#' 
#' These are pretty basic, but should be useful.
#' @name md-methods
#' @param x An object of class `md`
#' @param n (integer) The number of rows of content to print. Defaults to 10.
#' @param ... Arguments passed to other methods. Currently ignored.
#' @importFrom cli cli
#' @importFrom cli cli_h1
#' @importFrom cli cli_text
#' @exportS3Method base::print
print.md <- function(x, n = 10, ...){
  early_text <- glue_collapse(x[seq_len(n)], sep = "\n")
  cli({
    cli_h1("An object of class `md`")
    cli_text(early_text)
  })
}

#' @rdname md-methods
#' @param object An `.md` object to summarize
#' @importFrom cli cli
#' @importFrom cli cli_h1
#' @importFrom cli cli_bullets
#' @exportS3Method base::summary
summary.md <- function(object, ...){
  n_lines <- length(object)
  n_headings <- length(which(grepl("^#|^<h", object)))
  cli({
    cli_h1("An object of class `md` containing:")
    cli_bullets(c(
      "*" = "{n_lines} lines",
      "*" = "{n_headings} headings"
    ))
  })
}