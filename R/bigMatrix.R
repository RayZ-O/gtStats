BigMatrix <- function(data, inputs, outputs, block = 40, scale = 2, diag = TRUE) {
  if (missing(inputs))
    inputs <- convert.schema(data$schema)
  else
    inputs <- substitute(inputs)
  inputs <- convert.exprs(inputs)

  if (length(inputs) != 2)
    stop("2 inputs expected.");

  outputs <- substitute(outputs)
  check.atts(outputs)
  outputs <- convert.atts(outputs)
  if (length(outputs) != 3)
    stop("3 outputs expected.")

  gla <- GLA(statistics::Big_Matrix, block = block, scale = scale, diag = diag)

  Aggregate(data, gla, inputs, outputs)
}
