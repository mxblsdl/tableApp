# Sass code compilation
sass::sass(input = sass::sass_file("inst/app/www/custom.sass"), output = "inst/app/www/custom.css", cache = NULL)

# Set options here
options(golem.app.prod = FALSE) # TRUE = production mode, FALSE = development mode

# Detach all loaded packages and clean your environment
golem::detach_all_attached()
# rm(list=ls(all.names = TRUE))

# Add imports to the description file
## Scrapes all roxygen comments for import statements
## checks for :: in code
attachment::att_amend_desc()

# Document and reload your package
golem::document_and_reload()

# Run the application
run_app()
