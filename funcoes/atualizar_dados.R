datasets <- function() {
  # Inserir aqui nome do dataset, caso outro seja adcionado
  datasets <- c("jhu", "google", "ms_br")
  return(datasets)
}

atualizar_dado <- function(dataset) {
  df <- covidRdata::download_dataset(dataset)
  saveRDS(df, paste0("dados/", dataset, ".rds"))
}

atualizar_dados <- function(datasets) {
  lapply(datasets, atualizar_dado)
}

deletar_dado <- function(dataset) {
  if(existe_dado(dataset)) {
    file.remove(paste0("dados/", dataset, ".rds"))
  }
}

deletar_dados <- function(datasets) {
  lapply(datasets, deletar_dado)
}

existe_dado <- function(dataset) {
  existe <- file.exists(paste0("dados/", dataset, ".rds"))
  return(existe)
}

carregar_dado <- function(dataset) {
  if(!existe_dado(dataset)) {
    message(paste("dataset", dataset, "não encontrado."))
    message(paste("Realizando download de", dataset, "aguarde..."))
    atualizar_dado(dataset)
  }
  dado <- readRDS(paste0("dados/", dataset, ".rds"))
  return(dado)
}

