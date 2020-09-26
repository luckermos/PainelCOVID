trocar_na_por_0 <- function(df) {
  df <- df %>% 
    dplyr::mutate_if(is.numeric, tidyr::replace_na)
  return(df)
}

add_semana_epidemiologica <- function(df) {
  df <- df %>% 
    dplyr::mutate(
      n_week = lubridate::week(date - 4),
      n_week = n_week - min(n_week) + 1
    )
  return(df)
}

sumarisar_por_pais_e_data <- function(df) {
  df <- df %>% 
    dplyr::group_by(Country_Region, date) %>% 
    dplyr::summarise(
      Confirmed = sum(Confirmed),
      Deaths = sum(Deaths),
      Recovered = sum(Recovered),
      n_week = max(n_week)) 
  return(df)
}

add_novos_casos_e_novos_obitos <- function(df) {
  df <- df %>% 
    dplyr::mutate(
      New_Confirmed = Confirmed - lag(Confirmed),
      New_Deaths = Deaths - lag(Deaths),
      New_Recovered = Recovered - lag(Recovered)
    ) %>% 
    trocar_na_por_0()
  return(df)
}

add_recuperados <- function(df) {
  covid_today <- df %>% filter(date==max(date)) %>% 
    select(Country_Region, date, Confirmed, Recovered)
  
  covid_15 <- df %>% filter(date==max(date)-15) %>% 
    select(Country_Region, date, Confirmed, Recovered) %>% 
    rename(Confirmed_15=Confirmed, Recovered_15=Recovered) %>% 
    mutate(date=date+15)
  
  covid_compar <- left_join(x=covid_today, y=covid_15, by=c("Country_Region", "date")) %>% 
    mutate(Confirmed=replace_na(Confirmed, 0),
           Recovered=replace_na(Recovered, 0),
           Confirmed_15=replace_na(Confirmed_15, 0),
           Recovered_15=replace_na(Recovered_15, 0)) %>% 
    mutate(IND_INFO=case_when(
      Recovered==0 ~ "<span style='color:DarkRed'>Sem Informação</span>", # Sem info de recuperação
      Confirmed > Confirmed_15 & Recovered > Recovered_15 ~ "<span style='color:DarkGreen'>Atualizado</span>", # atualizado
      Confirmed == Confirmed_15 & Recovered == Recovered_15 ~ "<span style='color:DarkGreen'>Atualizado</span>", # atualizado tbm
      TRUE ~ "<span style='color:DarkOrange'>Desatualizado</span>"
    )) %>% 
    select(Country_Region, date, IND_INFO)
  
  covid <- left_join(x=df, y=covid_compar, by=c("Country_Region","date"))
  
  return(covid)
}

