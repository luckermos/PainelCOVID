### **Brasil**

#### **Evolução dos Casos** {.tabset .tabset-pills}

##### Casos Acumulados

```{r echo=FALSE, message=FALSE, warning=FALSE}
ggplotly(ggplot(data = covid_brasil, aes(x = data, y = casosAcumulado / 1000)) +
           geom_line(size = 0.8, color = "darkgreen") +
           geom_point(
             size = 0.8, color = "darkgreen",
             aes(text = paste0(format(data, "%d %b %Y"), ": ", round(casosAcumulado / 1000, 2)))
           ) +
           darktheme +
           ggtitle("") +
           xlab("") +
           ylab("Casos Acumulados (em milhares)") +
           scale_color_hue(l = 40), tooltip = "text") %>% layout(hovermode = "x unified")
```

##### Casos por Habitantes

```{r echo=FALSE, message=FALSE, warning=FALSE}
ggplotly(ggplot(data = covid_brasil, aes(x = data, y = 100000 * casosAcumulado / pop_2019)) +
           geom_line(size = 1, color = "darkgreen") +
           geom_point(size = .8, color = "darkgreen", aes(text = paste0(format(data, "%d %b %Y"), ": ", format(round(100000 * casosAcumulado / pop_2019, 2),
                                                                                                               decimal.mark = ",", big.mark = ".",
                                                                                                               small.mark = "."
           )))) +
           darktheme +
           xlab("") +
           ylab("Casos Confirmados (por 
100 mil habitantes)") +
           labs(color = "") +
           scale_color_hue(l = 40), tooltip = "text") %>% layout(hovermode = "x unified")
```

##### Novos Casos Diários

```{r echo=FALSE, message=FALSE, warning=FALSE}
ggplotly(ggplot(data = covid_brasil, aes(x = data, y = casosNovos / 1000)) +
           geom_point(color = "darkgreen", aes(text = paste0(format(data, "%d %b %Y"), ": ", round(casosNovos / 1000, 2)))) +
           geom_line(size = 0.8, color = "darkgreen") +
           darktheme +
           ggtitle("") +
           xlab("") +
           ylab("Casos Novos (em milhares)") +
           scale_color_hue(l = 40), tooltip = "text") %>% layout(hovermode = "x unified")
```

##### Novos Casos Semanais

```{r echo=FALSE, message=FALSE, warning=FALSE}
ggplotly(ggplot(data = covid_brasil_week, aes(x = semanaEpi, y = casosNovos / 1000)) +
           geom_point(color = "darkgreen", aes(text = paste0(semanaEpi, ": ", round(casosNovos / 1000, 2)))) +
           geom_line(size = 0.8, color = "darkgreen") +
           darktheme +
           ggtitle("") +
           xlab("Semana Epidemiológica") +
           ylab("Casos Novos (em milhares)") +
           scale_color_hue(l = 40), tooltip = "text") %>% layout(hovermode = "x unified")
```

#### {-}

#### **Evolução dos Óbitos** {.tabset .tabset-pills}

##### Óbitos

```{r echo=FALSE, message=FALSE, warning=FALSE}
ggplotly(ggplot(data = covid_brasil, aes(x = data, y = obitosAcumulado / 1000)) +
           geom_line(size = 0.8, color = "darkred") +
           geom_point(
             size = 0.8, color = "darkred",
             aes(text = paste0(format(data, "%d %b %Y"), ": ", round(obitosAcumulado / 1000, 2)))
           ) +
           darktheme +
           ggtitle("") +
           xlab("") +
           ylab("Óbitos (em milhares)") +
           scale_color_hue(l = 40), tooltip = "text") %>% layout(hovermode = "x unified")
```

##### Óbitos por Habitantes

```{r echo=FALSE, message=FALSE, warning=FALSE}
ggplotly(ggplot(data = covid_brasil, aes(x = data, y = 100000 * obitosAcumulado / pop_2019)) +
           geom_line(size = 1, color = "darkred") +
           geom_point(
             size = .8, color = "darkred",
             aes(text = paste0(
               format(data, "%d %b %Y"), ": ",
               format(round(100000 * obitosAcumulado / pop_2019, 2),
                      decimal.mark = ",", big.mark = ".",
                      small.mark = "."
               )
             ))
           ) +
           darktheme +
           xlab("") +
           ylab("Óbitos (por 100
mil habitantes)") +
           labs(color = "") +
           scale_color_hue(l = 40), tooltip = "text") %>% layout(hovermode = "x unified")
```

##### Novos Óbitos Diários

```{r echo=FALSE, message=FALSE, warning=FALSE}
ggplotly(ggplot(data = covid_brasil, aes(x = data, y = obitosNovos / 1000)) +
           geom_point(color = "darkred", aes(text = paste0(format(data, "%d %b %Y"), ": ", round(obitosNovos / 1000, 2)))) +
           geom_line(size = 0.8, color = "darkred") +
           darktheme +
           ggtitle("") +
           xlab("") +
           ylab("Óbitos (em milhares)") +
           scale_color_hue(l = 40), tooltip = "text") %>% layout(hovermode = "x unified")
```

##### Novos Óbitos Semanais

```{r echo=FALSE, message=FALSE, warning=FALSE}
ggplotly(ggplot(data = covid_brasil_week, aes(x = semanaEpi, y = obitosNovos / 1000)) +
           geom_point(color = "darkred", aes(text = paste0(semanaEpi, ": ", round(obitosNovos / 1000, 2)))) +
           geom_line(size = 0.8, color = "darkred") +
           darktheme +
           ggtitle("") +
           xlab("Semana Epidemiológica") +
           ylab("Óbitos (em milhares)") +
           scale_color_hue(l = 40), tooltip = "text") %>% layout(hovermode = "x unified")
```

#### {-}