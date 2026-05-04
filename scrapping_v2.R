
library(tidyverse)
library(dplyr)
library(rvest)


# -------  Paginació automàtica  -------
# ---------------------------------------
  
#    SESSION:

#    -) això no és només llegir HTML com read_html()
#    -) això crea una sessió de navegació

#    QUÈ FA?

#    -) manté estat (com un navegador)
#    -) pot seguir links
#    -) pot fer “clics simulats”


#    session_follow_link(css = ".next")

#    -) “dins la pàgina actual, busca un element amb classe .next i ves-hi”

#    -) <li class="next">
#    -)   <a href="/page/2/">Next →</a>
#    -) </li>


#   ----- EX 01 = mourem x una pàgina ----
#   --------------------------------------

#    -) ESTIC a PAG 1
#    -) ANAR a pag 2 (fent CLICK)

#    -) Info HTML pag 1
#    -) Info HTML pag 2



# --- WEB 1

sessio <- session("https://quotes.toscrape.com")

# --- WEB 2
# --- fer CLIKC a        = <a href =xxxx >  
# --- <a> està dins de   = <li class ="next" >

sessio2 <- sessio |> 
  session_follow_link(css = ".next a")


# --- Les URL

sessio$url
sessio2$url

# --- La info TEXT HTML de cada WEB

text_web_1 <- sessio |> 
  html_elements(".text") |> 
  html_text2()

text_web_2 <- sessio2 |> 
  html_elements(".text") |> 
  html_text2()

text_web_1[1]
text_web_2[1]


#   ----- EX 01 = mourem x HABITACLIA ----
#   --------------------------------------


# --- ATENCIÓ !!!
# --------------

#    -) La web de HABITACLIA BOLOQUEJA el SCRAPING

#    -) Dona ERROR =    
#    -)   Error en read_html.response(x$response, ..., base_url = x$url): 
#    -)   Forbidden (HTTP 403).

#    -) Segons CHATGPT això vol dir que HABITACLIA ha bloquejat el SCRAPPING

sessio <- session("https://www.habitaclia.com/viviendas-l_antiga_esquerra_de_l_eixample-barcelona.htm")

sessio2 <- sessio |> 
  session_follow_link(css = "a")

sessio$url
sessio2$url


