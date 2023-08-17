## Comment

Resubmit after archival. A refactor was done to make sure internet access was needed when loading the package. This caused CRAN to detect a oversight on my behalf, where one function didn't have their examples wrapped in `\donttest{}`. This has now been fixed.

All user-facing functions require internet access, and examples are thus placed in `\donttest{}`.

## R CMD check results

0 errors | 0 warnings | 0 note

