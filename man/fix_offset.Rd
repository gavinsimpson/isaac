% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utililties.R
\name{fix_offset}
\alias{fix_offset}
\title{Fix the names of a data frame containing an offset variable.}
\usage{
fix_offset(model, newdata, offset_value = NULL)
}
\arguments{
\item{model}{a fitted GAM.}

\item{newdata}{data frame; new values at which to predict at.}

\item{offset_value}{numeric, optional; if provided, then the offset variable in \code{newdata} is set to this constant value before returning \code{newdata}}
}
\value{
The original \code{newdata} is returned with fixed names and possibly modified offset variable.
}
\description{
Identifies which variable, if any, is the model offset, and fixed the name
such that \code{"offset(foo(var))" is converted}"var"\code{, and possibly sets that data to}offset_value`.
}
\examples{
##\\testonly{set.seed(2)}
library("mgcv")
set.seed(2)
df <- gamSim(1, n = 400, dist = "normal")
m <- gam(y ~ s(x0) + s(x1) + offset(x0), data = df, method = "REML")
names(model.frame(m))
names(fix_offset(m, model.frame(m), offset_value = 1L))
}
\author{
Gavin L. Simpson
}
