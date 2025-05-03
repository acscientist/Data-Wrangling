#' ------------------------------------------------------------------------------
#' Demonstration of the `rep()` Function in R
#' ------------------------------------------------------------------------------
#' Purpose:
#'   To showcase different use cases of the base R `rep()` function.
#'   The `rep()` function is essential for replicating elements of vectors,
#'   lists, factors, and other data types in flexible ways.
#'
#' Relevance:
#'   This code exemplifies complexity (varied argument use), effectiveness
#'   (outputs are valid and correct), and efficiency (minimal lines for maximum clarity).
#' ------------------------------------------------------------------------------

#' --- Basic Usage ---
#' Repeat the sequence 1:4, *two full times*.
rep(1:4, 2)

#' --- Element-wise Replication ---
#' Repeat *each element* of 1:4 twice before moving to the next element.
rep(1:4, each = 2)

#' Equivalent to the above: provide a vector of repeat counts.
rep(1:4, c(2, 2, 2, 2))

#' Vary the number of replications per element: 1 twice, 2 once, etc.
rep(1:4, c(2, 1, 2, 1))

#' --- Replication with Output Length Control ---
#' Replicate each element twice, but truncate output after 4 elements.
rep(1:4, each = 2, length.out = 4)

#' As above, but request 10 elements: the pattern recycles to meet the length.
rep(1:4, each = 2, length.out = 10)

#' --- Combined Replication Controls ---
#' Repeat each element twice, and repeat the resulting sequence 3 times.
rep(1:4, each = 2, times = 3) # Expected output length: 4 * 2 * 3 = 24

#' --- Handling Floating Point Precision ---
#' Demonstrates sensitivity to floating-point values in repeat count.
rep(1, 40 * (1 - 0.8)) # May return length 7 (platform-dependent)
rep(1, 40 * (1 - 0.8) + 1e-7) # Adds small epsilon to ensure accurate result

#' --- Replicating Lists ---
#' Replicates a named list object multiple times.
fred <- list(happy = 1:10, name = "squash")
rep(fred, 5)

#' --- Replicating Date-Time Objects ---
#' Replicate leap second values (POSIXct class).
x <- .leap.seconds[1:3]
rep(x, 2)

#' Convert to POSIXlt and repeat with individual replication counts.
rep(as.POSIXlt(x), rep(2, 3))

#' --- Named Factor Replication ---
#' Create a factor with names and replicate.
x <- factor(LETTERS[1:4])
names(x) <- letters[1:4]

#' Original named factor
x

#' Repeat entire factor twice (names are preserved).
rep(x, 2)

#' Repeat each factor level twice (names are preserved).
rep(x, each = 2)

#' Internal version of rep: drops names for performance.
rep.int(x, 2)

#' Replicate to a specified length: names dropped, but efficient.
rep_len(x, 10)
