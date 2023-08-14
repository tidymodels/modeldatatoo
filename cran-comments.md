## Comment

Received CRAN notice which read: "modeldatatoo also has top-level code which should be in .onLoad.". 
I refactored the package, such that code that tries to access the internet only triggers when functions are called, rather than once the package is loaded. Alleviating the original problem. 

All user-facing functions require internet access, and examples are thus placed in `\donttest{}`.

## R CMD check results

0 errors | 0 warnings | 0 note

