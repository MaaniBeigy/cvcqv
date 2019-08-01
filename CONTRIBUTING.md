# Contributing to cvcqv development

The goal of this guide is to facilitate contributing to `cvcqv` as 
quickly as possible. The guide is divided into two main pieces:

1. Filing a bug report or feature request in an issue.
1. Suggesting a change via a pull request.

Please note that `cvcqv` is released with a [Contributor Code of Conduct](.github/CODE_OF_CONDUCT.md). By contributing to this project, 
you agree to abide by its terms.

## Issues

When filing an issue, the most important thing is to include a **minimal 
reproducible example** so that we can quickly verify the problem, and then figure 
out how to fix it. There are three things you need to include to make your 
example reproducible: **required packages**, **data**, and **code**.

1.  **Packages** should be loaded at the top of the script, so it's easy to
    see which ones the example needs.
  
1.  The easiest way to include **data** is to use `dput()` to generate the R code 
    to recreate it. For example, to recreate the `mtcars` dataset in R,
    I'd perform the following steps:
  
       1. Run `dput(mtcars)` in R
       2. Copy the output
       3. In my reproducible script, type `mtcars <- ` then paste.
       
    But even better is if you can create a `data.frame()` with just a handful
    of rows and columns that still illustrates the problem.
  
1.  Spend a little bit of time ensuring that your **code** is easy for others to
    read:
  
    * make sure you've used spaces and your variable names are concise, but
      informative
  
    * use comments to indicate where your problem lies
  
    * do your best to remove everything that is not related to the problem.  
     The shorter your code is, the easier it is to understand.
  
    * do your best to follow [Google's R Style Guide](https://google.github.io/styleguide/Rguide.xml).  

You can check you have actually made a reproducible example by starting up a 
fresh R session and pasting your script in.

(Unless you've been specifically asked for it, please don't include the output 
of `sessionInfo()`.)   

## Pull requests

To contribute a change to `cvcqv`, you follow these steps:

1. Create a branch in git and make your changes.
1. Push branch to github and issue pull request (PR).
1. Discuss the pull request.
1. Iterate until either we accept the PR or decide that it's not
   a good fit for `cvcqv`.

Each of these steps are described in more detail below. This might feel 
overwhelming the first time you get set up, but it gets easier with practice. 
If you get stuck at any point, please reach out for help from package maintainer's email: [manibeygi@gmail.com)](manibeygi@gmail.com).

If you're not familiar with git or github, please start by reading <http://r-pkgs.had.co.nz/git.html>

Pull requests will be evaluated against a seven point checklist:

1.  __Motivation__. Your pull request should clearly and concisely motivate the
    need for change.

1.  __Only related changes__. Before you submit your pull request, please
    check to make sure that you haven't accidentally included any unrelated
    changes. These make it harder to see exactly what's changed, and to
    evaluate any unexpected side effects.

    Each PR corresponds to a git branch, so if you expect to submit
    multiple changes make sure to create multiple branches. If you have
    multiple changes that depend on each other, start with the first one
    and don't submit any others until the first one has been processed.

1.  __Use Google's R coding style__. Please follow the
    [Google's R Style Guide](https://google.github.io/styleguide/Rguide.xml). Maintaining
    a consistent style across the whole code base makes it much easier to
    jump into the code. If you're modifying existing `cvcqv` code that
    doesn't follow the style guide, a separate pull request to fix the
    style would be greatly appreciated.

1.  If you're adding new parameters or a new function, you'll also need
    to document them with [roxygen](https://github.com/klutometis/roxygen).
    Make sure to re-run `devtools::document()` on the code before submitting.

    Currently, `cvcqv` uses the development version of roxygen2, which you
    can get with `install_github("klutometis/roxygen")`. This will be
    available on CRAN in the near future.

1.  If fixing a bug or adding a new feature to a function,
    please add a [testthat](https://github.com/r-lib/testthat) unit test.

This seems like a lot of work but don't worry if your pull request isn't perfect.
It's a learning process and members of the `cvcqv` team will be on hand to help you
out. A pull request ("PR") is a process, and unless you've submitted a few in the
past it's unlikely that your pull request will be accepted as is. All PRs require
review and approval from at least one member of the `cvcqv` development team 
before merge.

Finally, remember that `cvcqv` is an in-development package. We honorably welcome pull requests and contributions. 
