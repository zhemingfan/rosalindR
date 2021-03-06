
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rosalindR

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![License:
MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://cran.r-project.org/web/licenses/MIT)
[![Dependencies](https://tinyverse.netlify.com/badge/rosalindR)](https://cran.r-project.org/package=rosalindR)
<!-- badges: end -->

The goal of rosalindR is to offer an alternative platform to
[Rosalind](http://rosalind.info/problems/locations/), a website aimed at
providing students with bioinformatics coding challenges. In R, students
can tackle these problems by being offered a .yaml file with questions
and solutions. Open source conributors can further add more problems of
Rosalind to this platform.

## Installation

As `rosalindR` is not on CRAN, you can install the development version
of rosalindR from [GitHub](https://github.com/) through:

``` r
# install.packages("devtools")
# install.packages('pkgdown')
# install.packages('tools')
# install.packages('badger')
devtools::install_github("zhemingfan/rosalindR")
#> Downloading GitHub repo zhemingfan/rosalindR@HEAD
#>      checking for file ‘/private/var/folders/z4/d0x91kfj1v148xr04zmkynh40000gp/T/Rtmpp17BFb/remotes23573a32feaf/zhemingfan-rosalindR-83da8c7/DESCRIPTION’ ...  ✓  checking for file ‘/private/var/folders/z4/d0x91kfj1v148xr04zmkynh40000gp/T/Rtmpp17BFb/remotes23573a32feaf/zhemingfan-rosalindR-83da8c7/DESCRIPTION’
#>   ─  preparing ‘rosalindR’:
#>      checking DESCRIPTION meta-information ...  ✓  checking DESCRIPTION meta-information
#>   ─  checking for LF line-endings in source and make files and shell scripts
#>   ─  checking for empty or unneeded directories
#>    Removed empty directory ‘rosalindR/data’
#>   ─  building ‘rosalindR_0.0.0.9000.tar.gz’
#>      
#> 
#> Installing package into '/private/var/folders/z4/d0x91kfj1v148xr04zmkynh40000gp/T/Rtmp0Q1NhJ/temp_libpath158d14293b31'
#> (as 'lib' is unspecified)
```

## Example

This is a basic example which shows you how to write a YAML file. First
we can load the package.

``` r
library(rosalindR)
```

Then we can use the `create_question()` function to write a file. The
function will output the filepath, which can be used for the future
tasks.

``` r
rosalindR::create_question("Name_of_package","~/.","AuthorName")
#> [1] "~/./Name_of_package.yaml"
```

## Development

Overall, the initial configuration of this package was developed using
the folllowing lines of code:

``` r_development
# Create package
usethis::create_package()

# Make a R script containing key function
usethis::use_r() #Specifically usethis::use_r("create_question")

# Install the package and restart R (alternatively, do install and restart in right hand drop down menu to access the functions in this package)
devtools::install()

# Create tests for package and test them
usethis::use_testthat()
usethis::use_test("create_question")

# Add a license
usethis::use_mit_license("Jeremy Fan")

# Indicates dependencies
usethis::use_package("tools")

# Editing the README
usethis::use_readme_rmd()

# Build all vignettes
devtools::build_vignettes()
devtools::use_vignette('yaml_configuration')

# Add a code of conduct
usethis::use_code_of_conduct()

# Make a package website
usethis::use_pkgdown()
pkgdown::build_site()

# Activate with GitHub Pages
usethis::use_github_action("pkgdown")

# Add to the Changelog
usethis::use_news_md()

# Add a badge
usethis::use_lifecycle_badge("Experimental")

# Render the README
devtools::build_readme()

# Check the final output
devtools::check()
```

### Rationale

Briefly, the package was initialized using the
`usethis::create_package()` before a function called “create\_function”
was initialized using the `usethis::use_r("create_question)` command.
From here, work was done to finalize the function. Afterwards, unit
tests for the function was created by instantiating the unit test
directory through `usethis::use_testthat()`, and creating a specialized
unit test for create\_function through.
`usethis::use_test("create_question")`. Other aspects of the project
such as updating the licensing and adding dependencies were also done
through the `usethis` package. README and vignettes were subsequently
created to help provide organization to this repository. Changelogs,
code of conducts, package websites, and badges were subsequently added
before a final `devtools::check()` for quality assessment was done.

Github interaction was done through the command line through simple add,
commit, and push commands. As functions were updated
`devtools::load_all()` was ran to make sure the latest version of
functions were being used. Debugging was done through
`devtools::check()`. Everytime roxygen description of function was
changed, `devtools::document()` was ran to update files in the `man`
folder. Testing of a package through time was done through
`devtools::test()`. README.md was **rebuilt** using
`devtools::build_readme()`

## Manual work

Though no “explicit” manual work such as data cleaning was done, work
that can be considered outside of the scope of the above code has been
conducted. For instance, more work was to determine the badge license
through the `badger::badge_license()` command. Function was written
using existing R knowledge, and unit testing done with with own
knowledge.
