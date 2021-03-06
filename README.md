
# tableApp Development Notes

I find the golem package confusing. As a way to deal with the scope of
the package I wanted to create a simple working app and come up with a
development cycle for myself to follow. I will document these steps
here.

## Start

-   Create the new app with `golem::create_golem(<APP_NAME>)`
-   Go to the dev folder and run through the `01_start.R` file.
    -   This file sets metadata about the app.
    -   I set all of these options which include creating this rmd file.

## Development

-   Step through `02_dev.R`
    -   Copy `attachment::att_amend_desc()` into `run_dev.R` so all
        imports are added to DESCRIPTION
    -   Create modules with
        `golem::add_module(name = <MOD_NAME>, with_test = F)`
    -   Create helpers functions with
        `golem::add_utils("helpers", module = <MOD_NAME>)`
    -   Associate helper functions with the module they are used in OR
    -   Create generic helper functions similiar to
        `golem::use_utils_ui()`

### JavaScript Development

-   Add custom JS with:

<!-- -->

    golem::add_js_file("script")
    golem::add_js_handler("handlers")

-   The js handler function links events in Shiny with custom
    javascript.
-   `inst/app/www/handlers.js` shows an example

### SASS Development

-   Golem uses `.sass` *not* `.scss`
-   Create sass file with `golem::add_sass_file(<STYLES>)`
-   sass is compiled in `run_dev.R`

## Interations

-   Run `dev/run_dev.R`
-   Add code to `R/app_ui.R` and `R/app_server.R`
    -   These remain the UI and Server components of the app and are
        called from `run_app`
    -   Modules are not required, but are helpful in creating cleaner
        scripts

## Deploy

-   Run `dev/03_deploy.R`
    -   Check for completeness with `devtools::check()`
    -   Then build the app
    -   Deploy to specific service if needed

### TODO

-   Do a full install of App

### Render readme notes

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this. You could also
use GitHub Actions to re-render `README.Rmd` every time you push. An
example workflow can be found here:
<https://github.com/r-lib/actions/tree/v1/examples>.
