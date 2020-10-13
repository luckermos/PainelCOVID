library(progress)
library(tidyverse)

.download_raw_csv <- function(main_url, sufix, file_type = ".csv") {
  url <- paste0(main_url, sufix, file_type)
  df <- readr::read_csv(url, col_types = cols(.default = "c"))
  return(df)
}

.rename_jhu_dataset <- function(df) {
  df_names <-
    names(df) %>%
    stringr::str_replace("/", "_") %>%
    stringr::str_replace("Latitude", "Lat") %>%
    stringr::str_replace("Longitude", "Long_") %>%
    stringr::str_replace("Last Update", "Last_Update")
  df <- df %>% set_names(df_names)
  return(df)
}

.bind_jhu_daily_data <- function(sufix) {
  main_url <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/"
  df <- tryCatch(
    {
      main_url %>%
        .download_raw_csv(sufix) %>%
        .rename_jhu_dataset() %>%
        dplyr::mutate(
          date = as.Date(sufix, format = "%m-%d-%Y"))
    },
    error = function(e) {
      tibble("Confirmed" = "0")
    }
  )
  return(df)
}

.convert_jhu_ctypes <- function(df) {
  df <- df %>% 
    dplyr::mutate(Province_State = as.character(Province_State),
                  Country_Region = as.character(Country_Region),
                  Last_Update = as.character(Last_Update),
                  Confirmed = as.numeric(Confirmed),
                  Deaths = as.numeric(Deaths),
                  Recovered = as.numeric(Recovered),
                  Lat = as.numeric(Lat),
                  Long_ = as.numeric(Long_),
                  FIPS = as.character(FIPS),
                  Admin2 = as.character(Admin2),
                  Active = as.numeric(Active),
                  Combined_Key = as.character(Combined_Key),
                  Incidence_Rate = as.numeric(Incidence_Rate),
                  `Case-Fatality_Ratio` = as.numeric(`Case-Fatality_Ratio`))
  return(df)
}

.download_jhu_dataset <- function(initial_date = "2020-01-22",
                                  final_date = Sys.Date()-1) {
  period <- seq(as.Date(initial_date), as.Date(final_date), "day") %>%
    format("%m-%d-%Y")
  pb <- progress_bar$new(total = length(period),
                         format = "  downloading jhu data [:bar] :percent eta: :eta",)
  df <- purrr::map_dfr(period, function(x) {
    pb$tick()
    .bind_jhu_daily_data(x)}
  ) %>% 
    .convert_jhu_ctypes()
  return(df)
}


.get_jhu_data <- function() {
  df <- .download_jhu_dataset()
  saveRDS(df, "rds/covid_jhu.rds")
  write.csv(df, "csv/covid_jhu.csv", row.names = FALSE)
  zip("csv/covid_jhu.zip", "csv/covid_jhu.csv")
  file.remove("csv/covid_jhu.csv")
}

.get_jhu_data()
