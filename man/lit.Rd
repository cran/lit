% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lit.R
\name{lit}
\alias{lit}
\title{Latent Interaction Testing}
\usage{
lit(y, x, adjustment = NULL, pop_struct = NULL)
}
\arguments{
\item{y}{matrix of traits (n observations by k traits)}

\item{x}{matrix of SNPs (n observations by m SNPs)}

\item{adjustment}{matrix of covariates to adjust traits}

\item{pop_struct}{matrix of PCs that captures population structure}
}
\value{
A data frame of p-values where the columns are
 \itemize{
 \item \code{wlit}: LIT using a linear kernel
 \item \code{ulit}: LIT using a projection kernel
 \item \code{alit}: Cauchy combination test of the above two LIT implementations
}
}
\description{
\code{lit} performs a kernel-based testing procedure, Latent Interaction Testing (LIT), using a set of traits and SNPs.
LIT tests whether the squared residuals (SQ) and cross products (CP) are statistically independent of the genotypes.
In particular, we construct a kernel matrix for the SQ/CP terms to measure the pairwise
similarity between individuals, and also construct an analogous one for the genotypes.
We then test whether these two matrices are independent.
Currently, we implement the linear and projection kernel functions to measure pairwise similarity between individuals.
We then combine the p-values of these implementations using a Cauchy combination test to maximize the number of discoveries.
}
\examples{
# set seed
set.seed(123)

# Generate SNPs and traits
X <- matrix(rbinom(10*2, size = 2, prob = 0.25), ncol = 2)
Y <- matrix(rnorm(10*4), ncol = 4)

out <- lit(Y, X)

}
\seealso{
\code{\link{lit_plink}}
}
