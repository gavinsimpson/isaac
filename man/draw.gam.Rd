% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/draw-methods.R
\name{draw.gam}
\alias{draw.gam}
\title{Plot estimated smooths from a fitted GAM}
\usage{
\method{draw}{gam}(object, select, scales = c("free", "fixed"),
  align = "hv", n = 100, unconditional = FALSE, inc.mean = FALSE,
  dist = 0.1, ...)
}
\arguments{
\item{object}{a fitted GAM, the result of a call to \code{\link[mgcv:gam]{mgcv::gam()}}.}

\item{select}{character;}

\item{scales}{character; should all univariate smooths be plotted with the
same y-axis scale? The default, \code{scales = "fixed"}, ensures this is done.
If \code{scales = "free"} each univariate smooth has its own y-axis scale.}

\item{align}{characer; see argument \code{align} in \code{cowplot::plot_grid()}.
Defaults to \code{"hv"} so that plots are nicely aligned.}

\item{n}{numeric; the number of points over the range of the covariate at which to evaluate the smooth.}

\item{unconditional}{logical; should confidence intervals include the uncertainty due to smoothness selection? If \code{TRUE}, the corrected Bayesian covariance matrix will be used.}

\item{inc.mean}{logical; should the uncertainty in the model constant term be
included in the standard error of the evaluate values of the smooth?
Currently not implemented.}

\item{dist}{numeric; if greater than 0, this is used to determine when
a location is too far from data to be plotted when plotting 2-D smooths.
The data are scaled into the unit square before deciding what to exclude,
and \code{dist} is a distance within the unit square. See
\code{\link[mgcv:exclude.too.far]{mgcv::exclude.too.far()}} for further details.}

\item{...}{arguments passed to \code{cowplot::plot_grid()}. Any arguments to
\code{plot_grid()} may be supplied, except for: \code{plotlist} and \code{align}.}
}
\value{
A \code{\link[ggplot2:ggplot]{ggplot2::ggplot()}} object.
}
\description{
Plots estimated smooths from a fitted GAM model in a similar way to
\code{mgcv::plot.gam()} but instead of using base graphics, \code{\link[ggplot2:ggplot]{ggplot2::ggplot()}}
is used instead.
}
\examples{
library("mgcv")

set.seed(2)
dat <- gamSim(1, n = 400, dist = "normal", scale = 2)
m1 <- gam(y ~ s(x0) + s(x1) + s(x2) + s(x3), data = dat, method = "REML")

draw(m1)

set.seed(2)
dat <- gamSim(2, n = 4000, dist = "normal", scale = 1)
m2 <- gam(y ~ s(x, z, k = 30), data = dat$data, method = "REML")

draw(m2)

dat <- gamSim(4)
m3 <- gam(y ~ fac + s(x2, by = fac) + s(x0), data = dat)

draw(m3, scales = "fixed")
}
\author{
Gavin L. Simpson
}
