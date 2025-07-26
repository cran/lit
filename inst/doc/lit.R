## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval = FALSE-------------------------------------------------------------
# # install development version of package
# install.packages("devtools")
# library("devtools")
# devtools::install_github("ajbass/lit")

## -----------------------------------------------------------------------------
library(lit)
# set seed
set.seed(123)

# generate SNPs and traits
X <- matrix(rbinom(10 * 10, size = 2, prob = 0.25), ncol = 10)
Y <- matrix(rnorm(10 * 4), ncol = 4)

# test for latent genetic interactions
out <- lit(Y, X)
head(out)

## -----------------------------------------------------------------------------
# load genio package
library(genio)

# path to plink files
file <- system.file("extdata", 'sample.bed', package = "genio", mustWork = TRUE)

# generate trait expression
Y <- matrix(rnorm(10 * 4), ncol = 4)

# apply lit to plink file
out <- lit_plink(Y, file = file, verbose = FALSE)
head(out)

## ----eval = FALSE-------------------------------------------------------------
# # apply Marginal (SQ/CP) to loaded genotypes
# out <- marginal(Y, X)
# 
# # apply Marginal (SQ/CP) to plink file
# out <- marginal_plink(Y, file = file, verbose = FALSE)

