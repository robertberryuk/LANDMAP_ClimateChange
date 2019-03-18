#> THIS SCRIPT DOCUMENTS THE PROCESS OF RECLASSIFYING THE VISUAL AND SENSORY LAYER OF THE LANDMAP DATA FOR WALES
#> INTO NEW LANDSCAPE TYPES BASED ON THE SPECIFICATION AS SET OUT BY NATURAL RESOURCES WALES (see Docs/V&S reclassification spec.docx for more detail)

#> Libraries
library(tidyverse)
library(sf)
library(here)

#> Import the LANDMAP Visual and Sensory layer polygon shapefile
vs_shp <- st_read(here("In", "NRW_LandMap_Visual_SensoryPolygon.shp"))


#> create non-sptial version
vs_df <- vs_shp
#> drop geometry column for faster computation
st_geometry(vs_df)  <- NULL

# #> Update UID of Builth showground polygon
# dat %>% 
#   mutate(var = replace(var, var != "Candy", "Not Candy"))
# 
# vs_df2 <- vs_df %>% 
#   mutate(UID = replace(UID, UID == "Candy", "Not Candy"))
####--LMP14 classifcation--####

#> Drop columns that are superfluous to the analysis
vs_df <- vs_df %>%
  select(SurveyID, CLS_2, CLS_3)

#> Get unique existing group 1 ("CLS_1") level landscape classification types (for info)
CLS_1_unique <- vs_df %>%
  distinct(CLS_1)

#> Get unique existing group 2 ("CLS_2") level landscape classification types (for info)
CLS_2_unique <- vs_df %>%
  distinct(CLS_2)

#> Get unique existing group 3 ("CLS_3") level landscape classification types (for info)
CLS_3_unique <- vs_df %>%
  distinct(CLS_3)

# #> Export CLS_3_unique as a CSV file for use in the Lookup table
# write_csv(CLS_3_unique, (here("In", "CLS3_Unique.csv")))

#> Import the "LMP14_9_Lookup.csv" lookup table
LMP_lookup <- read.csv(here("In", "LMP14_9_Lookup.csv"))

#> Merge the lookup table with
vs_df_merged <- merge(vs_df, LMP_lookup, by = "CLS_3", all.x = TRUE)

#> Drop CLS_2 and CLS_3 fields (used for visual checking - not needed for the merge to V&S shapefile)
vs_df_merged$CLS_3 <- NULL
vs_df_merged$CLS_2 <- NULL

#> Merge vs_df_merged with the original V&s shapefile
vs_shp_out <- merge(vs_shp, vs_df_merged, by = "SurveyID", all.x = TRUE)

#> Export updated shapefile
st_write(vs_shp_out, (here("Out", "LANDMAP_VS_Climate.shp")))

#> Export a simplified shapeile containing only LMP 14 and LMP09 info (for dissolving in QGIS)
#> Subset VS_shp_out 
VS_shp_simple <- vs_shp_out %>%
  select(SurveyID, LMP14_CODE, LMP14_D_L, LMP14_D_S, LMP09_CODE, LMP09_D_L, LMP09_D_S)

#> Export
st_write(VS_shp_simple, (here("Out", "LANDMAP_VS_ClimateOnly.shp")))



