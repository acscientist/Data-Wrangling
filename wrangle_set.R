#' ------------------------------------------------------------------------------
#' Demonstration of Base R Set Operations
#' ------------------------------------------------------------------------------
#' Purpose:
#'   To illustrate the usage of base R set functions including union, intersection,
#'   set difference, membership testing, and set equality.
#'
#' Relevance:
#'   This example emphasizes complexity (randomized input vectors with NA handling),
#'   effectiveness (clearly shows function outcomes), and efficiency (uses concise code
#'   to demonstrate core functionality).
#' ------------------------------------------------------------------------------

#' --- Create Random Sample Sets with NA ---
set.1 <- c(sort(sample(1:15, 9)), NA)   #' Random sample from 1:15 (9 values), then append NA
set.1

set.2 <- c(sort(sample(5:15, 4)), NA)   #' Random sample from 5:15 (4 values), then append NA
set.2

#' --- Union of Sets ---
#' Print the unique elements from combining elements from set.1 and set.2
#' - will give same values, but in different order; which set is passed first to base::union() merely gets printed to console first
#' - if common value between arguments exists, will only be printed once when first argument passed to union() is printed to concole
#' Returns all unique elements from both sets.
#' Output order is influenced by the order of input arguments.
base::union(set.1, set.2)
base::union(set.2, set.1)

#' --- Intersection of Sets ---
#' Returns only elements found in both sets.
#' Output is in ascending order; input order does not matter.
base::intersect(set.1, set.2)
base::intersect(set.2, set.1)

#' --- Set Difference ---
#' Returns elements in the first set that are not in the second set.
#' Order of arguments is critical.
#' Print the elements in set.x that are distinct from following sets
base::setdiff(set.1, set.2)
base::setdiff(set.2, set.1)

#' --- Membership Testing with is.element() ---
#' Returns a logical vector indicating whether each element of the first vector
#' is present anywhere in the second vector.
#' print a TRUE or FALSE if an index element from the first set is found in ANY INDEX POSITION of following set
#' like using dplyr's %in% and %like% functions
base::is.element(set.1, set.2)  #' Logical vector same length as set.1
base::is.element(set.2, set.1)  #' Logical vector same length as set.2

#' --- Set Equality Testing with setequal() ---
#' Returns TRUE if sets contain the same elements, regardless of order.
#' Note: NA values are treated as equal for equality purposes.
#' Similar to is.element, but instead of printing TRUE/FALSE if the element in set.1 is found ANYWHERE in the following set, it tests whether the element in MATCHING INDEX POSITIONS of each set is equivalent to one another;
#' the reason that "base::setequal(set.1[10], set.2[5])" equates to TRUE is that the value in the 10th index position of set.1 is NA, and the value in the 5th index position of set.2 is also NA
base::setequal(set.1, set.2)
base::setequal(set.2, set.1)

#' Specific comparison: checks if both NA values at different indices are equal.
base::setequal(set.1[10], set.2[5])  #' Likely TRUE if both are NA

#' --- Combined Logic Demonstration ---
#' Demonstrates the fundamental set identity:
#' union(A, B) == setdiff(A, B) + intersect(A, B) + setdiff(B, A)
base::setequal(
  union(set.1, set.2),
  c(setdiff(set.1, set.2), intersect(set.1, set.2), setdiff(set.2, set.1))
)
