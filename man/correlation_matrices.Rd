% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/corr_matrix.R, R/methods.R
\name{corr.matrix}
\alias{corr.matrix}
\alias{Extract.corr_mats}
\alias{[.corr_mats}
\alias{plot.corr_mats}
\alias{region.names.corr_mats}
\alias{nregions.corr_mats}
\title{Calculate correlation matrix and threshold}
\usage{
corr.matrix(resids, densities, thresholds = NULL, what = c("resids",
  "raw"), exclude.reg = NULL, type = c("pearson", "spearman"),
  rand = FALSE)

\method{[}{corr_mats}(x, i, g = NULL)

\method{plot}{corr_mats}(x, mat.type = c("thresholded", "raw"),
  thresh.num = 1L, ordered = TRUE, order.by = "lobe",
  graphs = NULL, grp.names = NULL, legend.title = NULL, ...)

\method{region.names}{corr_mats}(object)

\method{nregions}{corr_mats}(object)
}
\arguments{
\item{resids}{An object of class \code{brainGraph_resids} (the output from
\code{\link{get.resid}})}

\item{densities}{Numeric vector indicating the resultant network
densities; keeps the top \emph{X}\% of correlations}

\item{thresholds}{Numeric; absolute correlation value to threshold by
(default: \code{NULL})}

\item{what}{Character string indicating whether to correlate the residuals or
the raw structural MRI values (default: \code{'resids'})}

\item{exclude.reg}{Character vector of regions to exclude (default:
\code{NULL})}

\item{type}{Character string indicating which type of correlation coefficient
to calculate (default: \code{'pearson'})}

\item{rand}{Logical indicating whether the function is being called for
permutation testing; not intended for general use (default: \code{FALSE})}

\item{x, object}{A \code{corr_mats} object}

\item{i}{Integer for subsetting by density/threshold}

\item{g}{Integer, character, or logical for subsetting by group}

\item{mat.type}{Character string indicating whether to plot raw or thresholded
(binarized) matrices. Default: \code{'raw'}}

\item{thresh.num}{Integer specifying which threshold to plot (if
\code{mat.type='thresholded'}). Default: \code{1L}}

\item{ordered}{Logical indicating whether to order the vertices by some
grouping. Default: \code{TRUE}}

\item{order.by}{Character string indicating how to group vertices. Default:
\code{'lobe'}}

\item{graphs}{A \code{brainGraphList} object containing graphs with the
vertex-level attribute of interest. Default: \code{NULL}}

\item{grp.names}{Character vector specifying the names of each group of
vertices. Default: \code{NULL}}

\item{legend.title}{Character string for the legend title. Default is to
leave blank}

\item{...}{Unused}
}
\value{
A \code{corr_mats} object containing the following components:
  \item{R,P}{Numeric arrays of correlation coefficients and P-values. The
    length of the 3rd dimension equals the number of groups}
  \item{r.thresh}{A list of 3-d binary arrays indicating correlations that
    are above a certain threshold. The length of the list equals the number
    of groups, and the length of the 3rd dimension equals the number of
    thresholds/densities.}
  \item{thresholds}{Numeric matrix of the thresholds supplied. The number of
    columns equals the number of groups.}
  \item{what}{Residuals or raw values}
  \item{exclude.reg}{Excluded regions (if any)}
  \item{type}{Pearson or Spearman}
  \item{atlas}{The brain atlas used}
  \item{densities}{Numeric vector; the densities of the resulting graphs, if
    you chose to threshold each group to have equal densities.}
}
\description{
\code{corr.matrix} calculates the correlation between all column pairs of a
given data frame, and thresholds the resultant correlation matrix based on a
given density (e.g., \code{0.1} if you want to keep only the 10\% strongest
correlations). If you want to threshold by a specific correlation coefficient
(via the \code{thresholds} argument), then the \code{densities} argument is
ignored.

The \code{plot} method will plot \dQuote{heat maps} of the correlation
matrices.
}
\details{
If you wish to exclude regions from your analysis, you can give the indices
of their columns with the \code{exclude.reg} argument.

By default, the Pearson correlation coefficients are calculated, but you can
return Spearman by changing the \code{type} argument.
}
\section{Plotting correlation matrices}{

There are several ways to control the plot appearance. First, you may plot
the \dQuote{raw} correlations, or only those of the thresholded (binarized)
matrices. Second, you may order the vertices by a given vertex attribute; by
default, they will be ordered by \emph{lobe}, but you may also choose to
order by, e.g., \emph{network} (for the \code{dosenbach160} atlas) or by
\emph{community membership}. In the latter case, you need to pass a
\code{brainGraphList} object to the \code{graphs} argument; each graph in the
object must have a vertex attribute specified in \code{order.by}. Finally,
you can control the legend text with \code{grp.names}.
}

\examples{
\dontrun{
myResids <- get.resid(lhrh, covars)
corrs <- corr.matrix(myResids, densities=densities)))
}
\dontrun{
corrs <- corr.matrix(myResids, densities)
plot(corrs, order.by='comm', graphs=g.list, grp.names='Community')
}
}
\seealso{
\code{\link[Hmisc]{rcorr}}

Other Structural covariance network functions: \code{\link{Bootstrapping}},
  \code{\link{IndividualContributions}},
  \code{\link{Residuals}},
  \code{\link{brainGraph_permute}},
  \code{\link{import_scn}}, \code{\link{plot_volumetric}}
}
\author{
Christopher G. Watson, \email{cgwatson@bu.edu}
}
\concept{Structural covariance network functions}
