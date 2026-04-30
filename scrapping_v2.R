
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


#   - EX 01
#   -------

sessio <- session("https://quotes.toscrape.com")

sessio2 <- sessio |> 
  session_follow_link(css = ".next")

sessio$url
sessio$url


#   - EX 01
#   -------

sessio <- session("https://www.habitaclia.com/viviendas-l_antiga_esquerra_de_l_eixample-barcelona.htm")

sessio2 <- sessio |> 
  session_follow_link(css = ".next")

sessio$url
sessio2$url

#       ------------- NO ACABA DE ANAR !!
#  ------------------------------------------
