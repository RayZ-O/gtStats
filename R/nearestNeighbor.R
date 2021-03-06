NearestNeighbor <- function(data, state, inputs, outputs, normalization = TRUE) {
  inputs <- substitute(inputs)
  check.exprs(inputs, FALSE)
  inputs <- convert.exprs(inputs)

  outputs <- substitute(outputs)
  check.atts(outputs, FALSE)
  outputs <- convert.atts(outputs)

  if (length(outputs) != 1)
    stop("There must be exactly one output specified.")
  if (length(inputs) != 1)
    stop("There must be exactly one input specified.")

  gt <- GT(statistics::Nearest_Neighbor,
           normalization = normalization)

  Transform(data, gt, inputs, outputs, list(state))
}
