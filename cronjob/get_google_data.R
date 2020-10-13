library(tidyverse)

.download_google_mobility <- function() {
  url <- "https://www.gstatic.com/covid19/mobility/Global_Mobility_Report.csv"
  download.file(url, destfile = "google_mobility.csv")
  df <- readr::read_csv("google_mobility.csv", col_types = cols(.default = "c")) %>%
    .convert_google_ctypes()
  file.remove("google_mobility.csv")
  return(df)
}

.convert_google_ctypes <- function(df) {
  df <- df %>%
    dplyr::mutate(date = as.Date(date),
                  retail_and_recreation_percent_change_from_baseline = as.numeric(retail_and_recreation_percent_change_from_baseline),
                  grocery_and_pharmacy_percent_change_from_baseline = as.numeric(grocery_and_pharmacy_percent_change_from_baseline),
                  parks_percent_change_from_baseline = as.numeric(parks_percent_change_from_baseline),
                  transit_stations_percent_change_from_baseline = as.numeric(transit_stations_percent_change_from_baseline),
                  workplaces_percent_change_from_baseline = as.numeric(workplaces_percent_change_from_baseline),
                  residential_percent_change_from_baseline = as.numeric(residential_percent_change_from_baseline)
    )
  return(df)
}

.get_google_data <- function() {
  df <- .download_google_mobility()
  saveRDS(df, "rds/covid_google.rds")
  write.csv(df, "csv/covid_google.csv", row.names = FALSE)
  zip("csv/covid_google.zip", "csv/covid_google.csv")
  file.remove("csv/covid_google.csv")
}

.get_google_data()