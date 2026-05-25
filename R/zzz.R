# Declare bare-name columns that flow through dplyr::select() inside the
# shortest-length lookup table (R/sysdata.rda). Without this, R CMD check
# and lintr's object_usage_linter flag `al`, `a`, and `b` as undefined
# globals — they are columns of the internal `shortest_length` data
# frame, accessed via dplyr's non-standard evaluation.
utils::globalVariables(c("al", "a", "b"))
