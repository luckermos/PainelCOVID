dados_mundo <- function(covid) {
  world <- ne_countries(scale = "medium", returnclass = "sf")

  temp.file <- paste(tempfile(), ".xls", sep = "")
  download.file("http://api.worldbank.org/v2/en/indicator/SP.POP.TOTL?downloadformat=excel",
    temp.file,
    mode = "wb"
  )
  pop_2019 <- read_excel(temp.file, sheet = "Data", skip = 3) %>%
    select(`Country Name`, `Country Code`, "2019") %>%
    rename(
      "sovereignt" = `Country Name`,
      "adm0_a3" = `Country Code`,
      pop_est2 = "2019"
    ) %>%
    mutate(sovereignt = case_when(
      sovereignt == "United States" ~ "United States of America",
      sovereignt == "Russian Federation" ~ "Russia",
      sovereignt == "Egypt, Arab Rep." ~ "Egypt",
      sovereignt == "Congo, Dem. Rep." ~ "Democratic Republic of the Congo",
      sovereignt == "Iran, Islamic Rep." ~ "Iran",
      sovereignt == "Korea, Dem. People’s Rep." ~ "North Korea",
      sovereignt == "Korea, Rep." ~ "South Korea",
      sovereignt == "Tanzania" ~ "United Republic of Tanzania",
      sovereignt == "Venezuela, RB" ~ "Venezuela",
      sovereignt == "Serbia" ~ "Republic of Serbia",
      sovereignt == "Slovak Republic" ~ "Slovakia",
      TRUE ~ sovereignt
    ))

  world <- left_join(x = world, y = pop_2019 %>% select(-adm0_a3), by = "sovereignt") %>%
    mutate(pop_est2 = replace_na(pop_est2, 0)) %>%
    mutate(pop_est = ifelse(pop_est2 > 0, pop_est2, pop_est)) %>%
    select(-pop_est2)

  covid <- covid %>% mutate(
    Country_Region = case_when(
      Country_Region == "US" ~ "United States of America",
      Country_Region == "Congo (Brazzaville)" ~ "Republic of Congo",
      Country_Region == "Congo (Kinshasa)" ~ "Democratic Republic of the Congo",
      Country_Region == "Korea, South" ~ "South Korea",
      Country_Region == "Tanzania" ~ "United Republic of Tanzania",
      Country_Region == "Serbia" ~ "Republic of Serbia",
      Country_Region == "Republic of Korea" ~ "South Korea",
      Country_Region == "Bahamas" ~ "The Bahamas",
      Country_Region == "Bahamas, The" ~ "The Bahamas",
      Country_Region == "Eswatini" ~ "Swaziland",
      Country_Region == "Guinea-Bissau" ~ "Guinea Bissau",
      Country_Region == "Burma" ~ "Myanmar",
      TRUE ~ Country_Region
    )
  )

  covid_cont <- left_join(x = covid, y = (world %>% st_drop_geometry() %>%
    select(continent, name_sort, pop_est) %>%
    rename(
      Country_Region = name_sort,
      pop_est_2019 = pop_est
    )), by = "Country_Region") %>%
    group_by(continent, date) %>%
    summarise(
      Confirmed = sum(Confirmed),
      Deaths = sum(Deaths),
      Recovered = sum(Recovered),
      n_week = max(n_week),
      New_Confirmed = sum(New_Confirmed),
      New_Deaths = sum(New_Deaths),
      New_Recovered = sum(New_Recovered),
      pop_est_2019 = sum(pop_est_2019)
    )

  covid <- left_join(x = covid, y = (world %>% st_drop_geometry() %>%
    select(sovereignt, pop_est) %>%
    mutate(pop_est = case_when(
      sovereignt == "Western Sahara" ~ pop_est,
      TRUE ~ replace_na(pop_est, 0)
    )) %>%
    group_by(sovereignt) %>% summarise(pop_est = sum(pop_est)) %>%
    rename(
      Country_Region = sovereignt,
      pop_est_2019 = pop_est
    )), by = "Country_Region")

  world <- left_join(
    x = world %>% filter(sovereignt != "Antarctica"),
    y = covid %>% filter(date == max(date)) %>% rename(sovereignt = Country_Region),
    by = "sovereignt"
  )

  world_pop <- world %>%
    mutate(
      Confirmed = replace_na(Confirmed, 0),
      Deaths = replace_na(Deaths, 0),
      pop_est = case_when(
        sovereignt == "Western Sahara" ~ pop_est,
        TRUE ~ replace_na(pop_est, 0)
      )
    ) %>%
    group_by(sovereignt) %>%
    summarise(
      pop = max(pop_est), Confirmed = max(Confirmed), Deaths = max(Deaths),
      Recovered = max(Recovered)
    ) %>%
    mutate(
      Confirmed_pop = (Confirmed / pop) * 1000000,
      Deaths_pop = (Deaths / pop) * 1000000,
      Treatment_pop = ((Confirmed - Recovered) / pop) * 1000000
    ) %>%
    st_drop_geometry()

  world_2 <- left_join(x = world, y = world_pop, by = "sovereignt")

  world_3 <- world_2 %>% mutate(
    Confirmed_pop = case_when(
      sovereignt == "Qatar" ~ 0,
      TRUE ~ Confirmed_pop
    )
  )
  world <- as(world, Class = "Spatial")
  world_2 <- as(world_2, Class = "Spatial")
  world_3 <- as(world_3, Class = "Spatial")
  return(list(world, world_2, world_3))
}
