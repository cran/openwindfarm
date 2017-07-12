## ---- echo = FALSE, message = FALSE, warning = FALSE---------------------
knitr::opts_chunk$set(collapse = TRUE, 
                      message = FALSE, 
                      warning = FALSE,
                      comment = "#>")

## ---- out.width="100%"---------------------------------------------------
library(openwindfarm)
map_owf()

## ------------------------------------------------------------------------
df <- get_owf(wind_turbine = "R80711", 
              start_date = "2012-12-10 00:10:00", 
              end_date = "2013-01-15 03:30:00")

## ------------------------------------------------------------------------
library(dplyr)
df %>% 
  select("Wind_turbine_name", "Date_time", starts_with("Rs")) %>% 
  head()

## ---- fig.width=6, fig.height=3------------------------------------------
library(ggplot2)
ggplot(df, aes(I(Ws_avg^3), P_avg)) + 
  geom_point() + 
  geom_smooth(colour = "red") + 
  ggtitle("Wind turbine R80711") + 
  theme_bw()

