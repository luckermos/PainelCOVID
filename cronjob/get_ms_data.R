.get_ms_url <- function() {
  url <- "https://xx9p7hp1p7.execute-api.us-east-1.amazonaws.com/prod/PortalGeral"
  api_id <- "unAFkcaNDeXajurGB7LChj8SgQYS2ptm"
  header <- httr::add_headers("X-Parse-Application-Id" = api_id)
  response <- httr::GET(url, header, httr::accept_json())
  url <- jsonlite::fromJSON(httr::content(response, "text", encoding="UTF-8"))[["results"]][["arquivo"]][["url"]]
  
  return(url)
}

.download_ms_panel_data <- function() {
  url <- .get_ms_url()
  df <- read.csv(url, sep = ";")
  write.csv(df, "csv/covid_ms.csv", row.names = FALSE)
  zip("csv/covid_ms.zip", "csv/covid_ms.csv")
  saveRDS(df, "rds/covid_ms.rds")
}

message("Iniciando download dos dados do Ministerio da Saude...")
.download_ms_panel_data()
message("Dados baixados com sucesso.")