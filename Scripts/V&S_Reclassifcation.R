#> THIS SCRIPT DOCUMENTS THE PROCESS OF RECLASSIFYING THE VISUAL AND SENSORY LAYER OF THE LANDMAP DATA FOR WALES
#> INTO NEW LANDSCAPE TYPES BASED ON THE SPECIFICATION AS SET OUT BY NATURAL RESOURCES WALES (see Docs/V&S reclassification spec.docx for more detail)

#> Libraries
library(tidyverse)
library(sf)
library(here)

#> Import the LANDMAP Visual and Sensory layer polygon shapefile
vs_shp <- st_read(here("In", "NRW_LandMap_Visual_SensoryPolygon.shp"))

####--LMP14 classifcation--####

#> Change vs_shp into non-spatial dataframe (easier to work with (problems using dplyr with sf objects - join back to shp later)
vs_df <- vs_shp %>% st_set_geometry(NULL)

#> Drop columns that are superfluous to the analysis
vs_df <- vs_df %>%
  select(SurveyID, CLS_2, CLS_3)

#> Add new fields to hold the reclassified LMP14 landscape types
#> Short numeric code field
vs_df$LMP14_CODE <- "UNASSIGNED"
#> Full textual description as per project spec
vs_df$LMP14_D_S <- "UNASSIGNED"
#> Short textual description (might be useful for mapping - legends, labels etc)
vs_df$LMP14_D_L <- "UNASSIGNED"

#> Get unique existing group 1 ("CLS_1") level landscape classification types (for info)
CLS_1_unique <- vs_df %>%
  distinct(CLS_1)

#> Get unique existing group 2 ("CLS_2") level landscape classification types (for info)
CLS_2_unique <- vs_df %>%
  distinct(CLS_2)

#> Get unique existing group 3 ("CLS_3") level landscape classification types (for info)
CLS_3_unique <- vs_df %>%
  distinct(CLS_3)
  
#> Assign new LMP values based on current CLS_3 values
#> Add short
vs_df <- vs_df  %>% 
mutate(LMP14_D_L = ifelse(CLS_3 == "Wooded Upland & Plateaux", "Upland, exposed plateau, valleys, hillsides and scarp slopes. Wooded 20-50%", LMP14_D_L)),
mutate(LMP14_D_L = ifelse(CLS_3 == "Wooded Upland & Plateaux", "Upland, exposed plateau, valleys, hillsides and scarp slopes. Wooded 20-50%", LMP14_D_L))







#> Check unique values for LMP_14_D_L
LMP14_D_L_Unique <- vs_df %>%
  distinct(LMP14_D_L)
LMP14_D_L_Unique


#> Consult the LANDMAP documentation to see



####>

#add new categoryies 14 and 9 - 


# outpur data then merge by new categories to produce new layers