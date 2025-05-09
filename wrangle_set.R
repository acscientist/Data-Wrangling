# Base R Set Operations ---------------------------------------------------
# '
#' **Purpose**
#' Demonstrate `base::` comparison operators: `setx`, `union`, `intersect`
#'
#' **Utility**
#' The `set` statements demonstrated in this file can be used to filter, combine, or compare elements of distinct vectors
#'
#' **Notes**
#' `base::` functions are less likely to receive major updates than non-`base::` functions
#' ... This reduces the likelihood of unexpected changes in code functionality and improves backward compatibility
#'
#' ------------------------------------------------------------------------



# Setup -------------------------------------------------------------------

## Data -------------------------------------------------------------------
#' Generate data for demonstration
#' Random sample from 1:15 (9 values), then append NA
set.1 <- c(sort(sample(1:15, 9)), NA)
set.1

#' Random sample from 5:15 (4 values), then append NA
set.2 <- c(sort(sample(5:15, 4)), NA)
set.2



# Functions ---------------------------------------------------------------

## union ------------------------------------------------------------------
#' Returns *unique* elements within combined vectors
#' ... Will give same values, but in different order
#' ... Which set is passed first to base::union() merely gets printed to console first
base::union(set.1, set.2)
base::union(set.2, set.1)


## intersect ---------------------------------------------------------------
#' Returns *common* elements from individual vectors.
#' ... Output is in ascending order; input order does not matter.
base::intersect(set.1, set.2)
base::intersect(set.2, set.1)


## setdiff -----------------------------------------------------------------
#' Returns elements in the first set that are not in the second set.
#' ... Order of arguments is critical.
#' ... Print the elements in `set.x` that are distinct from following sets
base::setdiff(set.1, set.2)
base::setdiff(set.2, set.1)


## is.element --------------------------------------------------------------
#' Returns a logical vector (`TRUE/FALSE`) indicating whether *each element* of the first vector is present *anywhere* in the second vector, *regardless of index position*
#' ... Same result as using the `%like%` function from `dplyr::`
#' ... Same result as using the `%in%` function from `base::`
base::is.element(set.1, set.2) #' Logical vector same length as set.1
base::is.element(set.2, set.1) #' Logical vector same length as set.2


## setequal ---------------------------------------------------------------
#' Returns a logical value (`TRUE/FALSE`) if the element in a specified index position in one vector is equivalent to the element in the same index position of another vector
#' ... Compare elements *without* specification of the exact index
base::setequal(set.1, set.2)
base::setequal(set.2, set.1)

#' ... Compare elements *with* specification of the exact index
base::setequal(set.1[10], set.2[5])
base::setequal(set.2[5], set.1[10])



# Combined Example --------------------------------------------------------
#' union(A, B) == setdiff(A, B) + intersect(A, B) + setdiff(B, A)
base::setequal(
  union(set.1, set.2),
  c(setdiff(set.1, set.2), intersect(set.1, set.2), setdiff(set.2, set.1))
)
