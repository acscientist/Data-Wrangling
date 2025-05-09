# Base R Replication Operations -------------------------------------------
#'
#' **Purpose**
#' Demonstrate the `base::rep`function
#'
#' **Utility**
#' The `rep()` function replicates elements of vectors, lists, factors, etc.
#'
#' **Notes**
#' `Base R` functions are less likely to receive major updates than `non-Base R` packages
#' ... This reduces the likelihood of unexpected changes in code functionality and improves backward compatibility
#'
#' ------------------------------------------------------------------------



# Functions ---------------------------------------------------------------

## Basic ------------------------------------------------------------------
#' Replicate the *full sequence* a *standard* number of times
rep(1:4, 2)

## Element-wise -----------------------------------------------------------
#' Replicate *each element* a *standard* number of times *without* explicit definition
rep(1:4, each = 2)

#' Replicate *each element* a *standard* number of times *with* explicit definition
rep(1:4, c(2, 2, 2, 2))

#' Replicate *each element* a *unique* number of times *with* explicit definition
rep(1:4, c(2, 1, 6, 5))

## Defined Output Length --------------------------------------------------
#' Replicate each element twice, but truncate output after 4 elements
rep(1:4, each = 2, length.out = 4)

#' As above, but request 10 elements: the pattern recycles to meet the length
rep(1:4, each = 2, length.out = 10)

## Combined Replication Controls ------------------------------------------
#' Replicate each element twice, and repeat the resulting sequence 3 times
#' ... Expected output length: 4 * 2 * 3 = 24
rep(1:4, each = 2, times = 3)

## Account for Floating Points --------------------------------------------
#' Demonstrates sensitivity to floating-point values in repeat count
#' ... will return length 7 depending on OS
rep(1, 40 * (1 - 0.8))
rep(1, 40 * (1 - 0.8) + 1e-7)

## Lists ------------------------------------------------------------------
#' Replicate a named list object multiple times
fred <- list(happy = 1:10, name = "squash")
rep(fred, 5)

## Date-Time Objects ------------------------------------------------------
#' Replicate leap second values (POSIXct class)
date.time.obj <- .leap.seconds[1:3]
rep(date.time.obj, 2)

#' Convert to POSIXlt and repeat with individual replication counts
rep(as.POSIXlt(date.time.obj), rep(2, 3))

## Named Factor Replication -----------------------------------------------
#' Using built-in data: `letters` (lowercase) *or* `LETTERS` (uppercase)
#' Create a factor with names and replicate
letters.lower <- factor(letters[1:4])
names(letters.lower) <- letters[1:4]

letters.upper <- factor(LETTERS[1:4])
names(letters.upper) <- LETTERS[1:4]

#' Replicate entire factor twice (names are preserved)
rep(letters.lower, 2)
rep(letters.upper, 2)

#' Replicate each factor level twice (names are preserved)
rep(letters.lower, each = 2)
rep(letters.upper, each = 2)

#' Internal version of rep: drops names for performance
rep.int(letters.lower, 2)
rep.int(letters.upper, 2)

#' Replicate to a specified length: names dropped, but efficient
rep_len(letters.lower, 10)
rep_len(letters.upper, 10)
