
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


# ---------  EX 01 ----------
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

# ---------  EX 02 ----------
# ---------------------------

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


# ---------  EX 03 ----------
# ---------------------------

#   -) .classe → class
#   -) #id → id
#   -) espai → dins
#   -) %>% → fill directe


#   -)html_elements(".producte h2")
#   -)html_elements(".llista a")

#  ------------- EXEMPLE DE ELEMENT A EXPLORAR
#  --------------------------------------------

#      <h3 class="list-item-title">

#      <a href="https://www.habitaclia.com/compp;lo=55....." target="_self" 
#          title="Piso  en  Carrer ramon ....r" 
#          itemprop="name">

#      Piso  en  Carrer ramon i cajal 35. Acogedor piso en el centro con ascensor</a>
  


w <- "https://www.habitaclia.com/comprar-vivienda-en-cornella_de_llobregat/provincia_barcelona-baix_llobregat-area_14/listainmuebles.htm"

web <- read_html(w)

# Extreure el TEXT

titols <- web |> 
  html_elements(".list-item-title a") %>% 
  html_text2() %>% 
  enc2utf8() # ajuda a fer ENCODING de UTF8 - xo no va bé del tot


titols

# Extreure el LINK

links <- web |> 
  html_elements(".list-item-title a") %>%  
  html_attr("href")


# Extreure el DESCRIPCIÓ

descripcio <- web |> 
  html_elements(".list-item-title a") %>%  
  html_attr("title")

titols
links
descripcio

df <- data.frame(
  titol = titols,
  link = links,
  descripcio = descripcio
)

df

# ----- EXEMPLE 2 -----------
# ---------------------------

#    -) Busco LLOC
#    -) Busco PREU
#    -) Creo un DF

#    -) Uso    html_elements()    dins de     html_elements()
#    -) Així obtinc informació més detallada

w <- "https://www.habitaclia.com/comprar-vivienda-en-cornella_de_llobregat/provincia_barcelona-baix_llobregat-area_14/listainmuebles.htm"

web <- read_html(w)

# Extreure el TEXT

lloc <- web |> 
  html_elements(".list-item-location") %>% 
  html_text2()

titol <- web |> 
  html_elements(".list-item-title") %>% 
  html_text2()

preu <- web |> 
  html_elements(".list-item-content-second article") %>% 
  html_elements(".font-2") %>% 
  html_text2()


lloc
preu

df <- data.frame(
  lloc = lloc,
  preu = preu
)

df

df_2 <- data.frame(
  lloc = lloc,
  titol = titol
)

df
df_2



  
