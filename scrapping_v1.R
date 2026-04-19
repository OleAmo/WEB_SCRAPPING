
# install.packages("rvest")

library(tidyverse)
library(dplyr)
library(rvest)


# -------------  RVEST  -----------
# ---------------------------------
  
#    -) llegir una pàgina amb read_html()
#    -) inspeccionar el codi HTML
#    -) seleccionar elements amb CSS o XPath
#    -) extreure text, atributs, taules i enllaços
#    -) navegar entre pàgines amb session() quan no cal un navegador real.


# -------------  RSelenium  ------
# ---------------------------------
  
#    -) carrega contingut amb JavaScript
#    -) no mostra les dades a l’HTML inicial
#    -) necessita clicar botons
#    -) obrir desplegables
#    -) fer scroll
#    -) omplir formularis.


#  --------  EX 01 ----------
# ---------------------------


web <- read_html("https://example.com")

titol <- web %>%
  html_element("h1") %>% 
  html_text2()

enllacos <- web %>%
  html_elements("a") %>%
  html_attr("href")

titol
enllacos


web_2 <- read_html("https://www.habitaclia.com/")

titol <- web_2 %>%
  html_element("h3") %>% 
  html_text2()

select <- web_2 %>%
  html_element("select") %>% 
  html_text2()

option <- web_2 %>%
  html_element("option") %>% 
  html_text2()

enllacos <- web_2 %>%
  html_elements("a") %>%
  html_attr("href")

titol
option
select
enllacos
