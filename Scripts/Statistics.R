#> This script is used to calculate the statistics as set out in the NRW ITT 

# 1. LMP14	LANDMAP 14 landscape categories - % and km2 for each category
# 2. LMP14AS	LANDMAP 14 landscape categories - % and km2 for each category within each of the 6 Area Statement areas
# 3. LMP09	LANDMAP 9 high level landscape categories - % and km2 for each category
# 4. LMP14<1m - # LANDMAP landscape categories highlighting landscapes less than 1m in contour height (% and km2 for each category and subcategory (no double counting))
# 5. LMP14 flood risk - LANDMAP landscape categories highlighting landscapes currently at risk of flooding (coastal and fluvial) % and km2 for each category and subcategory (no double counting)
# 6. LMP14 boundaries	LANDMAP landscape categories and boundary type = % and km2 for each category
# 7. LMP14 evaluation	LANDMAP landscape categories and overall evaluation - % and km2 for each category


####> 1.LIBRARIES####
library(tidyverse)
library(sf)
library(here)
library(ggthemes)
library(dplyr)


####> 2. DATA LOAD AND PRE-PROCESSING####

#> Import the updated LANDMAP polygon data
LMP_polys <- st_read(here("Out", "LANDMAP_VS_Climate.shp"), stringsAsFactors = FALSE)
#> Pproject into BNG
LMP_polys <- st_transform(LMP_polys, crs = 27700)

#> Subset keeping only required variables an calculate areas
LMP <- LMP_polys %>%
  select(UID, VS_7, VS_26, LMP14_CODE, LMP14_D_S, LMP14_D_L, LMP09_CODE, LMP09_D_S, LMP09_D_S)
#> Calculate area of each aspect area (in Km2)
LMP$AreaKm2 <- st_area(LMP) / 1000000
#> Round down to two decimal points
LMP$AreaKm2 <- round(LMP$AreaKm2, digits = 2)
#> Convert from units to numeric
LMP$AreaKm2 <- as.numeric(LMP$AreaKm2)
#> Create a version of LMP with no geometry for non-spatial operations
LMP_noGeo <- LMP
st_geometry(LMP_noGeo) <- NULL

#> Remove original LANDMAP polygon data
rm(LMP_polys)

#> Import the NRW Area polygons
NRW <- st_read(here("In", "NRW_AREASPolygon.shp"), stringsAsFactors = FALSE)
#Change column "Name" name
colnames(NRW)[which(names(NRW) == "NAME")] <- "Area_Name"
#> Trim whitespacse as "filter" not picking up area name
NRW$Area_Name <- trimws(NRW$Area_Name)

#> Import the +1 sea level rise data (need to convert from raster first)
SeaLevel <- st_read(here("In", "1m_vector_clip.shp"))
#> Pproject into BNG
SeaLevel <- st_transform(SeaLevel, crs = 27700)

#> Import the Flood Zone 2 data
Flood2 <- st_read(here("In", "Floodzone2_Clean.shp"))
#> Peproject into BNG
Flood2 <- st_transform(Flood2, crs = 27700)

#> Import the Flood Zone 2 data
Flood3 <- st_read(here("In", "Floodzone3_Clean.shp"))
#> Peproject into BNG
Flood3 <- st_transform(Flood3, crs = 27700)

#> Import each of the 7 local authority boundaries
Blaenau <- st_read(here("In", "Blaenau_Gwent.shp"))
Caerphilly <- st_read(here("In", "Caerphilly.shp"))
Ceredigion <- st_read(here("In", "Ceredigion.shp"))
Denbighshire <- st_read(here("In", "Denbighshire.shp"))
Monmouthshire <- st_read(here("In", "Monmouthshire.shp"))
Newport <- st_read(here("In", "Newport.shp"))
Torfaen <- st_read(here("In", "Torfaen.shp"))


#> List of unique LMP values for colour coding
unique_LMP14 <- as.data.frame(unique(LMP$LMP14_D_S))
#Export table to use in lookup table
write_csv(unique_LMP14, (here("In", "unique_LMP14.csv")))


#COLOUR LOOKUP TABLES
colours_LMP14 <- read_csv(here("In", "Lookup_LMP14_Colours.csv"))
colours_LMP09 <- read_csv(here("In", "Lookup_LMP09_Colours.csv"))
colours_Boundaries <- 

#ALL-WALES STATS


####> TASK1: LMP14	LANDMAP 14 landscape categories - % and km2 for each category ####
stats_AW_LMP14 <- LMP_noGeo %>%
  select(LMP14_D_S, AreaKm2) %>%
  group_by(LMP14_D_S) %>%
  summarise(Km2=sum(AreaKm2)) %>%
  arrange(desc(Km2))

#> Add percentage column and change both units columns to numeric 
stats_AW_LMP14$Area_pcent <- stats_AW_LMP14$Km2 / sum(stats_AW_LMP14$Km2) * 100
stats_AW_LMP14$Area_pcent <- as.numeric(stats_AW_LMP14$Area_pcent)
#> Round percentage column to 2 decimal places
stats_AW_LMP14$Area_pcent <- round(stats_AW_LMP14$Area_pcent, digits = 2)

#> Export stats table
write_csv(stats_AW_LMP14, here("Out", "Stats_Tables", "StatsTable1_AW_LP14.csv"))

#> Merge colours to dataframe
stats_AW_LMP14 <- merge(stats_AW_LMP14, colours_LMP14, by = "LMP14_D_S", all.x = TRUE)

#Plot
# 
# #universally change theme
# theme_set(theme_classic(base_size = 16))

#> Plot of LMP14 All Wales
plot1_AW_LMP14 <- ggplot(stats_AW_LMP14, aes(x = reorder(LMP14_D_S, Area_pcent), y=Area_pcent, fill=LMP14_D_S)) +
  geom_bar(stat = "identity") +
  theme_bw() +
  labs(x = "LMP14 Landscape Type", y = "% Total Land Area") +
  theme(axis.title.y = element_text(margin = margin(t = 0, r = 16, b = 0, l = 0))) +
  theme(axis.title.x = element_text(margin = margin(t = 12, r = 0, b = 0, l = 0))) +
  scale_fill_manual(values = stats_AW_LMP14$Colour_LMP14) +
  theme(legend.position="none") +
  #> Flip the axes
  coord_flip() 
#> Show plot
plot1_AW_LMP14
#> Export the plot
ggsave(here("Out", "Plots", "Plot1.1_AW_LMP14.png"), width = 7, height = 5)



####> TASK2: LMP14AS	LANDMAP 14 landscape categories - % and km2 for each category within each of the 6 Area Statement areas####

#intersect LMP14 and NRW Areas
int <- st_intersection(LMP, NRW)
#> Remove geom
st_geometry(int) <- NULL

#Build km2 data table for NRW Areas
stats_AW_LMP14_NRW <- int %>%
  select(LMP14_D_S, AreaKm2, Area_Name) %>%
  group_by(Area_Name, LMP14_D_S) %>%
  summarise(Km2=sum(AreaKm2)) %>%
  arrange(desc(Km2))
#> Change NAs to zero
stats_AW_LMP14_NRW[is.na(stats_AW_LMP14_NRW)] <- 0

#> Spread km2 data
spread_LMP14_NRW_km <- stats_AW_LMP14_NRW %>% 
  spread(LMP14_D_S, Km2)
#> Change NAs to zero
spread_LMP14_NRW_km[is.na(spread_LMP14_NRW_km)] <- 0
#> Export table
write_csv(spread_LMP14_NRW_km, here("Out", "Stats_Tables", "StatsTable2.0.1_AW_LMP14_NRW_Areakm_Spread.csv"))

#> Percentage table for NRW areas
stats_LMP14_NRW_PC <- stats_AW_LMP14_NRW %>% 
  group_by(Area_Name) %>% 
  mutate(percentage = Km2/sum(Km2) * 100)
#> Round percentage
stats_LMP14_NRW_PC$percentage <- round(stats_LMP14_NRW_PC$percentage, digits = 2)

#> Spread percentage data
spread_LMP14_NRW_PC <- stats_LMP14_NRW_PC %>% 
  select(Area_Name, LMP14_D_S, percentage) %>% 
  spread(LMP14_D_S, percentage)
#> Change NAs to zero
spread_LMP14_NRW_PC[is.na(spread_LMP14_NRW_PC)] <- 0
#> Export table
write_csv(spread_LMP14_NRW_PC, here("Out", "Stats_Tables", "StatsTable2.0.2_AW_LMP14_NRW_AreaPC_Spread.csv"))


#> Filter by NRW Area

#> 1. Mid Wales
stats_AW_LMP14_NRW_MidWales <- stats_AW_LMP14_NRW %>%
  dplyr::filter(Area_Name=="Mid Wales") %>%
  arrange(desc(Km2))

#> Add percentage column and change both units columns to numeric 
stats_AW_LMP14_NRW_MidWales$Area_pcent <- stats_AW_LMP14_NRW_MidWales$Km2 / sum(stats_AW_LMP14_NRW_MidWales$Km2) * 100
stats_AW_LMP14_NRW_MidWales$Area_pcent <- as.numeric(stats_AW_LMP14_NRW_MidWales$Area_pcent)
#> Round percentage column to 2 decimal places
stats_AW_LMP14_NRW_MidWales$Area_pcent <- round(stats_AW_LMP14_NRW_MidWales$Area_pcent, digits = 2)

#> Export stats table
write_csv(stats_AW_LMP14_NRW_MidWales, here("Out", "Stats_Tables", "StatsTable2.1_AW_LP14_NRW_MidWales.csv"))

#> Plot data
plot2_AW_LMP14 <- ggplot(stats_AW_LMP14_NRW_MidWales, aes(x = reorder(LMP14_D_S, Area_pcent), y=Area_pcent, fill=LMP14_D_S)) +
  geom_bar(stat = "identity") +
  theme_bw() +
  labs(x = "LMP14 Landscape Type", y = "% Total Land Area") +
  # theme(axis.text.x=element_text(angle=90,hjust=1)) +
  theme(axis.title.y = element_text(margin = margin(t = 0, r = 16, b = 0, l = 0))) +
  theme(axis.title.x = element_text(margin = margin(t = 12, r = 0, b = 0, l = 0))) +
  scale_fill_manual(values = stats_AW_LMP14$Colour_LMP14) +
  theme(legend.position="none") +
  coord_flip() 
#> Show plot
plot2_AW_LMP14
#> Export the plot
ggsave(here("Out", "Plots", "Plot2.1_AW_LMP14_NRW_MidWales.png"), width = 7, height = 5)


#> 2. North East Wales
stats_AW_LMP14_NRW_NEWales <- stats_AW_LMP14_NRW %>%
  dplyr::filter(Area_Name=="North East Wales") %>%
  arrange(desc(Km2))

#> Add percentage column and change both units columns to numeric 
stats_AW_LMP14_NRW_NEWales$Area_pcent <- stats_AW_LMP14_NRW_NEWales$Km2 / sum(stats_AW_LMP14_NRW_NEWales$Km2) * 100
stats_AW_LMP14_NRW_NEWales$Area_pcent <- as.numeric(stats_AW_LMP14_NRW_NEWales$Area_pcent)
#> Round percentage column to 2 decimal places
stats_AW_LMP14_NRW_NEWales$Area_pcent <- round(stats_AW_LMP14_NRW_NEWales$Area_pcent, digits = 2)

#> Export stats table
write_csv(stats_AW_LMP14_NRW_NEWales, here("Out", "Stats_Tables", "StatsTable2_AW_LP14_NRW_NorthEastWales.csv"))

#> Plot data
plot2_AW_LMP14 <- ggplot(stats_AW_LMP14_NRW_NEWales, aes(x = reorder(LMP14_D_S, Area_pcent), y=Area_pcent, fill=LMP14_D_S)) +
  geom_bar(stat = "identity") +
  theme_bw() +
  labs(x = "LMP14 Landscape Type", y = "% Total Land Area") +
  # theme(axis.text.x=element_text(angle=90,hjust=1)) +
  theme(axis.title.y = element_text(margin = margin(t = 0, r = 16, b = 0, l = 0))) +
  theme(axis.title.x = element_text(margin = margin(t = 12, r = 0, b = 0, l = 0))) +
  scale_fill_manual(values = stats_AW_LMP14$Colour_LMP14) +
  theme(legend.position="none") +
  coord_flip() 
#> Show plot
plot2_AW_LMP14
#> Export the plot
ggsave(here("Out", "Plots", "Plot2.2_AW_LMP14_NRW_NorthEastWales.png"), width = 7, height = 5)

#> 3. North West Wales
stats_AW_LMP14_NRW_NWWales <- stats_AW_LMP14_NRW %>%
  dplyr::filter(Area_Name=="North West Wales") %>%
  arrange(desc(Km2))

#> Add percentage column and change both units columns to numeric 
stats_AW_LMP14_NRW_NWWales$Area_pcent <- stats_AW_LMP14_NRW_NWWales$Km2 / sum(stats_AW_LMP14_NRW_NWWales$Km2) * 100
stats_AW_LMP14_NRW_NWWales$Area_pcent <- as.numeric(stats_AW_LMP14_NRW_NWWales$Area_pcent)
#> Round percentage column to 2 decimal places
stats_AW_LMP14_NRW_NWWales$Area_pcent <- round(stats_AW_LMP14_NRW_NWWales$Area_pcent, digits = 2)

#> Export stats table
write_csv(stats_AW_LMP14_NRW_NWWales, here("Out", "Stats_Tables", "StatsTable2_AW_LP14_NRW_NorthWestWales.csv"))

#> Plot data
plot2_AW_LMP14 <- ggplot(stats_AW_LMP14_NRW_NWWales, aes(x = reorder(LMP14_D_S, Area_pcent), y=Area_pcent, fill=LMP14_D_S)) +
  geom_bar(stat = "identity") +
  theme_bw() +
  labs(x = "LMP14 Landscape Type", y = "% Total Land Area") +
  # theme(axis.text.x=element_text(angle=90,hjust=1)) +
  theme(axis.title.y = element_text(margin = margin(t = 0, r = 16, b = 0, l = 0))) +
  theme(axis.title.x = element_text(margin = margin(t = 12, r = 0, b = 0, l = 0))) +
  scale_fill_manual(values = stats_AW_LMP14$Colour_LMP14) +
  theme(legend.position="none") +
  coord_flip() 
#> Show plot
plot2_AW_LMP14
#> Export the plot
ggsave(here("Out", "Plots", "Plot2.3_AW_LMP14_NRW_NorthWestWales.png"), width = 7, height = 5)

#> 4. South East Wales
stats_AW_LMP14_NRW_SEWales <- stats_AW_LMP14_NRW %>%
  dplyr::filter(Area_Name=="South East Wales") %>%
  arrange(desc(Km2))
#> Add missing values (LMP14 types not present in area)
#> Change to 'normal' ungrouped data frame
stats_AW_LMP14_NRW_SEWales <- as.data.frame(stats_AW_LMP14_NRW_SEWales)
#> Create "missing data"
col1 <- as.character(c("South East Wales"))
col2 <- as.character(c("Water (sea)"))
col3 <- as.numeric(c(0))

#> Create new dataframe to hold missing values
df1 <- data.frame(col1, col2, col3, stringsAsFactors = FALSE)
#> Rename cols to match main dataframe
names(df1)[names(df1) == 'col1'] <- 'Area_Name'
names(df1)[names(df1) == 'col2'] <- 'LMP14_D_S'
names(df1)[names(df1) == 'col3'] <- 'Km2'
#> Bind dataframes
stats_AW_LMP14_NRW_SEWales <- rbind(stats_AW_LMP14_NRW_SEWales, df1)

#> Add percentage column and change both units columns to numeric 
stats_AW_LMP14_NRW_SEWales$Area_pcent <- stats_AW_LMP14_NRW_SEWales$Km2 / sum(stats_AW_LMP14_NRW_SEWales$Km2) * 100
stats_AW_LMP14_NRW_SEWales$Area_pcent <- as.numeric(stats_AW_LMP14_NRW_SEWales$Area_pcent)
#> Round percentage column to 2 decimal places
stats_AW_LMP14_NRW_SEWales$Area_pcent <- round(stats_AW_LMP14_NRW_SEWales$Area_pcent, digits = 2)

#> Export stats table
write_csv(stats_AW_LMP14_NRW_SEWales, here("Out", "Stats_Tables", "StatsTable2_AW_LP14_NRW_SouthEastWales.csv"))

#> Plot data
plot2_AW_LMP14 <- ggplot(stats_AW_LMP14_NRW_SEWales, aes(x = reorder(LMP14_D_S, Area_pcent), y=Area_pcent, fill=LMP14_D_S)) +
  geom_bar(stat = "identity") +
  theme_bw() +
  labs(x = "LMP14 Landscape Type", y = "% Total Land Area") +
  # theme(axis.text.x=element_text(angle=90,hjust=1)) +
  theme(axis.title.y = element_text(margin = margin(t = 0, r = 16, b = 0, l = 0))) +
  theme(axis.title.x = element_text(margin = margin(t = 12, r = 0, b = 0, l = 0))) +
  scale_fill_manual(values = stats_AW_LMP14$Colour_LMP14) +
  theme(legend.position="none") +
  coord_flip() 
#> Show plot
plot2_AW_LMP14
#> Export the plot
ggsave(here("Out", "Plots", "Plot2.4_AW_LMP14_NRW_SouthEastWales.png"), width = 7, height = 5)

#> 5. South Wales Central
stats_AW_LMP14_NRW_SCWales <- stats_AW_LMP14_NRW %>%
  dplyr::filter(Area_Name=="South Wales Central") %>%
  arrange(desc(Km2))
#> Add missing values (LMP14 types not present in area)
#> Change to 'normal' ungrouped data frame
stats_AW_LMP14_NRW_SCWales <- as.data.frame(stats_AW_LMP14_NRW_SCWales)
#> Create "missing data"
col1 <- as.character(c("South Wales Central"))
col2 <- as.character(c("Upland (rock)"))
col3 <- as.numeric(c(0))

#> Create new dataframe to hold missing values
df1 <- data.frame(col1, col2, col3, stringsAsFactors = FALSE)
#> Rename cols to match main dataframe
names(df1)[names(df1) == 'col1'] <- 'Area_Name'
names(df1)[names(df1) == 'col2'] <- 'LMP14_D_S'
names(df1)[names(df1) == 'col3'] <- 'Km2'
#> Bind dataframes
stats_AW_LMP14_NRW_SCWales <- rbind(stats_AW_LMP14_NRW_SCWales, df1)
#> Add percentage column and change both units columns to numeric 
stats_AW_LMP14_NRW_SCWales$Area_pcent <- stats_AW_LMP14_NRW_SCWales$Km2 / sum(stats_AW_LMP14_NRW_SCWales$Km2) * 100
stats_AW_LMP14_NRW_SCWales$Area_pcent <- as.numeric(stats_AW_LMP14_NRW_SCWales$Area_pcent)
#> Round percentage column to 2 decimal places
stats_AW_LMP14_NRW_SCWales$Area_pcent <- round(stats_AW_LMP14_NRW_SCWales$Area_pcent, digits = 2)

#> Export stats table
write_csv(stats_AW_LMP14_NRW_SCWales, here("Out", "Stats_Tables", "StatsTable2_AW_LP14_NRW_SouthWalesCentral.csv"))

#> Plot data
plot2_AW_LMP14 <- ggplot(stats_AW_LMP14_NRW_SCWales, aes(x = reorder(LMP14_D_S, Area_pcent), y=Area_pcent, fill=LMP14_D_S)) +
  geom_bar(stat = "identity") +
  theme_bw() +
  labs(x = "LMP14 Landscape Type", y = "% Total Land Area") +
  # theme(axis.text.x=element_text(angle=90,hjust=1)) +
  theme(axis.title.y = element_text(margin = margin(t = 0, r = 16, b = 0, l = 0))) +
  theme(axis.title.x = element_text(margin = margin(t = 12, r = 0, b = 0, l = 0))) +
  scale_fill_manual(values = stats_AW_LMP14$Colour_LMP14) +
  theme(legend.position="none") +
  coord_flip() 
#> Show plot
plot2_AW_LMP14
#> Export the plot
ggsave(here("Out", "Plots", "Plot2.5_AW_LMP14_NRW_SouthWalesCentral.png"), width = 7, height = 5)


#> 6. South West Wales
stats_AW_LMP14_NRW_SWWales <- stats_AW_LMP14_NRW %>%
  dplyr::filter(Area_Name=="South West Wales") %>%
  arrange(desc(Km2))
#> Add missing values (LMP14 types not present in area)
#> Change to 'normal' ungrouped data frame
stats_AW_LMP14_NRW_SWWales <- as.data.frame(stats_AW_LMP14_NRW_SWWales)
#> Create "missing data"
col1 <- as.character(c("South Wales Central"))
col2 <- as.character(c("Upland (rock)"))
col3 <- as.numeric(c(0))
#> Create new dataframe to hold missing values
df1 <- data.frame(col1, col2, col3, stringsAsFactors = FALSE)
#> Rename cols to match main dataframe
names(df1)[names(df1) == 'col1'] <- 'Area_Name'
names(df1)[names(df1) == 'col2'] <- 'LMP14_D_S'
names(df1)[names(df1) == 'col3'] <- 'Km2'
#> Bind dataframes
stats_AW_LMP14_NRW_SWWales <- rbind(stats_AW_LMP14_NRW_SWWales, df1)

#> Add percentage column and change both units columns to numeric 
stats_AW_LMP14_NRW_SWWales$Area_pcent <- stats_AW_LMP14_NRW_SWWales$Km2 / sum(stats_AW_LMP14_NRW_SWWales$Km2) * 100
stats_AW_LMP14_NRW_SWWales$Area_pcent <- as.numeric(stats_AW_LMP14_NRW_SWWales$Area_pcent)
#> Round percentage column to 2 decimal places
stats_AW_LMP14_NRW_SWWales$Area_pcent <- round(stats_AW_LMP14_NRW_SWWales$Area_pcent, digits = 2)

#> Export stats table
write_csv(stats_AW_LMP14_NRW_SWWales, here("Out", "Stats_Tables", "StatsTable2_AW_LP14_NRW_SouthWestWales.csv"))

#> Plot data
plot2_AW_LMP14 <- ggplot(stats_AW_LMP14_NRW_SWWales, aes(x = reorder(LMP14_D_S, Area_pcent), y=Area_pcent, fill=LMP14_D_S)) +
  geom_bar(stat = "identity") +
  theme_bw() +
  labs(x = "LMP14 Landscape Type", y = "% Total Land Area") +
  # theme(axis.text.x=element_text(angle=90,hjust=1)) +
  theme(axis.title.y = element_text(margin = margin(t = 0, r = 16, b = 0, l = 0))) +
  theme(axis.title.x = element_text(margin = margin(t = 12, r = 0, b = 0, l = 0))) +
  scale_fill_manual(values = stats_AW_LMP14$Colour_LMP14) +
  theme(legend.position="none") +
  coord_flip() 
#> Show plot
plot2_AW_LMP14
#> Export the plot
ggsave(here("Out", "Plots", "Plot2.6_AW_LMP14_NRW_SouthWestWales.png"), width = 7, height = 5)


####> TASK3: LMP09	LANDMAP 09 landscape categories - % and km2 for each category ####
stats_AW_LMP09 <- LMP_noGeo %>%
  select(LMP09_D_S, AreaKm2) %>%
  group_by(LMP09_D_S) %>%
  summarise(Km2=sum(AreaKm2)) %>%
  arrange(desc(Km2))

#> Add percentage column and change both units columns to numeric 
stats_AW_LMP09$Area_pcent <- stats_AW_LMP09$Km2 / sum(stats_AW_LMP09$Km2) * 100
stats_AW_LMP09$Area_pcent <- as.numeric(stats_AW_LMP09$Area_pcent)
#> Round percentage column to 2 decimal places
stats_AW_LMP09$Area_pcent <- round(stats_AW_LMP09$Area_pcent, digits = 2)

#> Export stats table
write_csv(stats_AW_LMP09, here("Out", "Stats_Tables", "StatsTable3_AW_LMP09.csv"))

#> Merge colours to dataframe
stats_AW_LMP09 <- merge(stats_AW_LMP09, colours_LMP09, by = "LMP09_D_S", all.x = TRUE)

#Plot
# 
# #universally change theme
# theme_set(theme_classic(base_size = 16))

#> Plot of LMP09 All Wales
plot1_AW_LMP09 <- ggplot(stats_AW_LMP09, aes(x = reorder(LMP09_D_S, Area_pcent), y=Area_pcent, fill=LMP09_D_S)) +
  geom_bar(stat = "identity") +
  theme_bw() +
  labs(x = "LMP09 Landscape Type", y = "% Total Land Area") +
  theme(axis.title.y = element_text(margin = margin(t = 0, r = 16, b = 0, l = 0))) +
  theme(axis.title.x = element_text(margin = margin(t = 12, r = 0, b = 0, l = 0))) +
  scale_fill_manual(values = stats_AW_LMP09$Colour_LMP09) +
  theme(legend.position="none") +
  #> Flip the axes
  coord_flip() 
#> Show plot
plot1_AW_LMP09
#> Export the plot
ggsave(here("Out", "Plots", "Plot3.1_AW_LMP09.png"), width = 7, height = 5)


####> TASK4: LMP14	LANDMAP 014 +1m sea level rise - % and km2 for each category#### 

#< Intersect the LMP14 and SeaLevel data
int <- st_intersection(SeaLevel, LMP)

#Build Flood km2 data table 
stats_AW_LMP14_1m <- int %>%
  select(LMP14_D_S)
#Calc areas of intersecting polygons
stats_AW_LMP14_1m$FloodKm2 <- st_area(stats_AW_LMP14_1m) / 1000000

#> Remove geom for faster processing
st_geometry(stats_AW_LMP14_1m) <- NULL

#> Group table
stats_AW_LMP14_1m <- stats_AW_LMP14_1m %>% 
  select(LMP14_D_S, FloodKm2) %>% 
  group_by(LMP14_D_S)%>% 
  summarise(Flood_Km2=sum(FloodKm2)) %>% 
  arrange(desc(Flood_Km2))

#> Get LMP 14 Total Areas
LMP14_AreaKm <- LMP_noGeo %>% 
  select(LMP14_D_S, AreaKm2) %>% 
  group_by(LMP14_D_S) %>% 
  summarise(LMP14_km2=sum(AreaKm2)) %>%
  arrange(desc(LMP14_km2))
          
#> Merge with LMP14 Areas (left hand join on LMP14 to preserve 0 value variables
merge1 <- merge(LMP14_AreaKm, stats_AW_LMP14_1m, by = "LMP14_D_S", all.x = TRUE)

#> Change NAs to zero
merge1[is.na(merge1)] <- 0

#> Add field - percentage flooded land per area
merge1$percentFlood <- merge1$Flood_Km2 / merge1$LMP14_km2 * 100

#> Arrange descending
merge1 <- merge1 %>% 
  arrange(desc(percentFlood))

#> Round down values in merge table
merge1$LMP14_km2 <- round(merge1$LMP14_km2, digits = 2)
merge1$Flood_Km2 <- round(merge1$Flood_Km2, digits = 2)
merge1$percentFlood <- round(merge1$percentFlood , digits = 2)
#> Export stats table
write_csv(merge1, here("Out", "Stats_Tables", "StatsTable4_AW_LP14_+1.csv"))

merge1$percentFlood <- NULL

library(reshape2)
DF1 <- melt(merge1, id.var="LMP14_D_S")

#> Plot data
plot2_AW_LMP14 <- ggplot(DF1, aes(x = reorder(LMP14_D_S, value), y = value, fill = variable)) +
  geom_bar(stat = "identity") +
  theme_bw() +
  labs(x = "LMP14 Landscape Type", y = "Area (km2)") +
  # theme(axis.text.x=element_text(angle=90,hjust=1)) +
  theme(axis.title.y = element_text(margin = margin(t = 0, r = 16, b = 0, l = 0))) +
  theme(axis.title.x = element_text(margin = margin(t = 12, r = 0, b = 0, l = 0))) +
  # scale_fill_manual(values = stats_AW_LMP14$Colour_LMP14) +
  # theme(legend.position="none") +
  theme(legend.title = element_blank()) +
  theme(legend.position = "top") +
  scale_fill_manual(labels = c("  Up to 1m ASL   ", "  > 1m ASL "), values = c("Light Green","Black"), breaks = c("Flood_Km2", "LMP14_km2")) +
  coord_flip() 
#> Show plot
plot2_AW_LMP14
#> Export the plot
ggsave(here("Out", "Plots", "Plot4.0_AW_LMP14_+1_.png"), width = 7, height = 5)

####> TASK5: LMP14	LANDMAP 14 Flood Zone 2- % and km2 for each category####

#< Intersect the LMP14 and Flood2 data
int2 <- st_intersection(Flood2, LMP)

st_write(int2, here("Out", "Int2.shp"))

#Build Flood km2 data table 
stats_Flood2 <- int2 %>%
  select(LMP14_D_S)
#Calc areas of intersecting polygons
stats_Flood2$FloodKm2 <- st_area(stats_Flood2) / 1000000

#> Remove geom for faster processing
st_geometry(stats_Flood2) <- NULL

#> Group table
stats_Flood2 <- stats_Flood2 %>% 
  select(LMP14_D_S, FloodKm2) %>% 
  group_by(LMP14_D_S)%>% 
  summarise(Flood_Km2=sum(FloodKm2)) %>% 
  arrange(desc(Flood_Km2))

#> Get LMP 14 Total Areas
LMP14_AreaKm <- LMP_noGeo %>% 
  select(LMP14_D_S, AreaKm2) %>% 
  group_by(LMP14_D_S) %>% 
  summarise(LMP14_km2=sum(AreaKm2)) %>%
  arrange(desc(LMP14_km2))

#> Merge with LMP14 Areas (left hand join on LMP14 to preserve 0 value variables
merge1 <- merge(LMP14_AreaKm, stats_Flood2, by = "LMP14_D_S", all.x = TRUE)

#> Change NAs to zero
merge1[is.na(merge1)] <- 0

#> Add field - percentage flooded land per area
merge1$percentFlood <- merge1$Flood_Km2 / merge1$LMP14_km2 * 100

#> Arrange descending
merge1 <- merge1 %>% 
  arrange(desc(percentFlood))

#> Round down values in merge table
merge1$LMP14_km2 <- round(merge1$LMP14_km2, digits = 2)
merge1$Flood_Km2 <- round(merge1$Flood_Km2, digits = 2)
merge1$percentFlood <- round(merge1$percentFlood , digits = 2)
#> Export stats table
write_csv(merge1, here("Out", "Stats_Tables", "StatsTable5_AW_LP14_Floodzone2.csv"))

merge1$percentFlood <- NULL

library(reshape2)
DF1 <- melt(merge1, id.var="LMP14_D_S")


#> Plot data
plot2_AW_LMP14 <- ggplot(DF1, aes(x = reorder(LMP14_D_S, value), y = value, fill = variable)) +
  geom_bar(stat = "identity") +
  theme_bw() +
  labs(x = "LMP14 Landscape Type", y = "Area (km2)") +
  # theme(axis.text.x=element_text(angle=90,hjust=1)) +
  theme(axis.title.y = element_text(margin = margin(t = 0, r = 16, b = 0, l = 0))) +
  theme(axis.title.x = element_text(margin = margin(t = 12, r = 0, b = 0, l = 0))) +
  # scale_fill_manual(values = stats_AW_LMP14$Colour_LMP14) +
  # theme(legend.position="none") +
  theme(legend.title = element_blank()) +
  theme(legend.position = "top") +
  scale_fill_manual(labels = c(" Flood Zone 2    ", " Non-Flood Zone 2"), values = c("Light Green","Black"), breaks = c("Flood_Km2", "LMP14_km2")) +
  coord_flip() 
#> Show plot
plot2_AW_LMP14
#> Export the plot
ggsave(here("Out", "Plots", "Plot5.0_AW_LMP14_Floodzone2_.png"), width = 7, height = 5)


#< Intersect the LMP14 and Flood3 data
int3 <- st_intersection(Flood3, LMP)

#Build Flood km2 data table 
stats_Flood3 <- int3 %>%
  select(LMP14_D_S)
#Calc areas of intersecting polygons
stats_Flood3$FloodKm2 <- st_area(stats_Flood3) / 1000000

#> Remove geom for faster processing
st_geometry(stats_Flood3) <- NULL

#> Group table
stats_Flood3 <- stats_Flood3 %>% 
  select(LMP14_D_S, FloodKm2) %>% 
  group_by(LMP14_D_S)%>% 
  summarise(Flood_Km2=sum(FloodKm2)) %>% 
  arrange(desc(Flood_Km2))

#> Get LMP 14 Total Areas
LMP14_AreaKm <- LMP_noGeo %>% 
  select(LMP14_D_S, AreaKm2) %>% 
  group_by(LMP14_D_S) %>% 
  summarise(LMP14_km2=sum(AreaKm2)) %>%
  arrange(desc(LMP14_km2))

#> Merge with LMP14 Areas (left hand join on LMP14 to preserve 0 value variables
merge1 <- merge(LMP14_AreaKm, stats_Flood3, by = "LMP14_D_S", all.x = TRUE)

#> Change NAs to zero
merge1[is.na(merge1)] <- 0

#> Add field - percentage flooded land per area
merge1$percentFlood <- merge1$Flood_Km2 / merge1$LMP14_km2 * 100

#> Arrange descending
merge1 <- merge1 %>% 
  arrange(desc(percentFlood))

#> Round down values in merge table
merge1$LMP14_km2 <- round(merge1$LMP14_km2, digits = 2)
merge1$Flood_Km2 <- round(merge1$Flood_Km2, digits = 2)
merge1$percentFlood <- round(merge1$percentFlood , digits = 2)
#> Export stats table
write_csv(merge1, here("Out", "Stats_Tables", "StatsTable5_AW_LP14_Floodzone3.csv"))

merge1$percentFlood <- NULL

library(reshape2)
DF1 <- melt(merge1, id.var="LMP14_D_S")


#> Plot data
plot2_AW_LMP14 <- ggplot(DF1, aes(x = reorder(LMP14_D_S, value), y = value, fill = variable)) +
  geom_bar(stat = "identity") +
  theme_bw() +
  labs(x = "LMP14 Landscape Type", y = "Area (km2)") +
  # theme(axis.text.x=element_text(angle=90,hjust=1)) +
  theme(axis.title.y = element_text(margin = margin(t = 0, r = 16, b = 0, l = 0))) +
  theme(axis.title.x = element_text(margin = margin(t = 12, r = 0, b = 0, l = 0))) +
  # scale_fill_manual(values = stats_AW_LMP14$Colour_LMP14) +
  # theme(legend.position="none") +
  theme(legend.title = element_blank()) +
  theme(legend.position = "top") +
  scale_fill_manual(labels = c(" Flood Zone 3    ", " Non-Flood Zone 3"), values = c("Light Green", "Black"), breaks = c("Flood_Km2", "LMP14_km2")) +
  coord_flip() 
#> Show plot
plot2_AW_LMP14
#> Export the plot
ggsave(here("Out", "Plots", "Plot5.1_AW_LMP14_Floodzone3_.png"), width = 7, height = 5)


####> TASK6: LMP14	LANDMAP 14 Boundary Type- % and km2 for each category####

#Build table 
Stats_Bound <- LMP_noGeo %>% 
  select(LMP14_D_S, VS_7, AreaKm2)

#Check distinct values
UniqueBounds <- as.data.frame(unique(Stats_Bound$VS_7))

#Update VS_7 values to "Developed land" where LMP14_D_S == "Developed (communities)"
Stats_Bound <- within(Stats_Bound, VS_7[LMP14_D_S == "Developed (communities)"] <- "Developed")

#> Group table
Stats_Bound  <- Stats_Bound  %>% 
  group_by(VS_7, LMP14_D_S) %>% 
  summarise(VS_7km2=sum(AreaKm2)) 
  # arrange(desc(
  
#> Spread table for export
BoundExport <- Stats_Bound %>% 
spread(VS_7, VS_7km2)

#> Change NAs to zeros
BoundExport[is.na(BoundExport)] <- 0

#> Export summary (spread) table
write_csv(BoundExport, here("Out", "Stats_Tables", "StatsTable6_AW_LP14_Boundaries.csv"))

#> Create percentage 
ValueExportPC <- BoundExport[2:12]/rowSums(BoundExport[2:12]) * 100
#> Cbind LMP_D_S
ValueExportPC2 <- cbind(BoundExport[1], ValueExportPC)
#> Round down
ValueExportPC2[2:12] <- round(ValueExportPC2[2:12], digits = 2)
#> Export summary (spread) % table
write_csv(ValueExportPC2, here("Out", "Stats_Tables", "StatsTable6_AW_LP14_Boundaries_PC.csv"))



library(reshape2)
DF2 <- melt(BoundExport, id.var="LMP14_D_S")


#> Plot data
plot2_AW_LMP14 <- ggplot(DF2, aes(x = reorder(LMP14_D_S, value), y = value, fill = variable)) +
  geom_bar(stat = "identity") +
  theme_bw() +
  labs(x = "LMP14 Landscape Type", y = "Area (km2)") +
  # theme(axis.text.x=element_text(angle=90,hjust=1)) +
  theme(axis.title.y = element_text(margin = margin(t = 0, r = 16, b = 0, l = 0))) +
  theme(axis.title.x = element_text(margin = margin(t = 12, r = 0, b = 0, l = 0))) +
  theme(legend.position="none") +
  theme(legend.title = element_blank()) +
  theme(legend.position = "top") +
  scale_fill_manual(labels = c("Clawdd/Hedgebanks  ", "Developed  ", "Fences  ", "Fences With Trees  ", "Hedge With Trees  ", "Managed Hedge  ", "Mixture", "None", "Overgrown Hedges", "Slate Fences", "Stone Walls"), values = c("#E9F80B", "#000000", "#59F10D", "#F3FF01", "#33A02C", "#A4D5A1", "#FF7F00", "#D61790", "#714D3C", "#E31A1C", "#1417D6"), breaks = c("Clawdd/Hedgebanks", "Developed", "Fences", "Fences With Trees", "Hedge With Trees", "Managed Hedge", "Mixture", "None", "Overgrown Hedges", "Slate Fences", "Stone Walls")) +
  coord_flip() 
#> Show plot
plot2_AW_LMP14
#> Export the plot
ggsave(here("Out", "Plots", "Plot6.1_AW_LMP14_Boundaries.png"), width = 7, height = 5)

####> TASK7: LMP14	LANDMAP 14 Landscape Quality - % and km2 for each category####

#Build table 
Stats_Value <- LMP_noGeo %>% 
  select(LMP14_D_S, VS_26, AreaKm2)

#Check distinct values
UniqueValue <- as.data.frame(unique(Stats_Value$VS_26))

#Update VS_26 values to "Developed land" where LMP14_D_S == "Developed (communities)"
Stats_Value <- within(Stats_Value, VS_26[LMP14_D_S == "Developed (communities)"] <- "Developed")

#> Group table
Stats_Value  <- Stats_Value  %>% 
  group_by(VS_26, LMP14_D_S) %>% 
  summarise(VS_26km2=sum(AreaKm2)) 


#> Spread table for export
ValueExport <- Stats_Value %>% 
  spread(VS_26, VS_26km2)

#> Change NAs to zeros
ValueExport[is.na(ValueExport)] <- 0

#> Change order of catagories in ValueExport for drawing chart order
ValueExport <- ValueExport %>% 
  select(LMP14_D_S, Developed, Low, Moderate, High, Outstanding)

#> Export summary (spread) km 2 table
write_csv(ValueExport, here("Out", "Stats_Tables", "StatsTable7_AW_LP14_Value.csv"))

#> Create percentage 
ValueExportPC <- ValueExport[2:5]/rowSums(ValueExport[2:5]) * 100
#> Cbind LMP_D_S
ValueExportPC2 <- cbind(ValueExport[1], ValueExportPC)
#> Round down
ValueExportPC2[2:5] <- round(ValueExportPC2[2:5], digits = 2)
#> Export summary (spread) % table
write_csv(ValueExportPC2, here("Out", "Stats_Tables", "StatsTable7_AW_LP14_PC.csv"))



library(reshape2)
DF3 <- melt(ValueExport, id.var="LMP14_D_S")

#> Plot data
plot2_AW_LMP14 <- ggplot(DF3, aes(x = reorder(LMP14_D_S, value), y = value, fill = variable)) +
  geom_bar(stat = "identity") +
  theme_bw() +
  labs(x = "LMP14 Landscape Type", y = "Area (km2)") +
  # theme(axis.text.x=element_text(angle=90,hjust=1)) +
  theme(axis.title.y = element_text(margin = margin(t = 0, r = 16, b = 0, l = 0))) +
  theme(axis.title.x = element_text(margin = margin(t = 12, r = 0, b = 0, l = 0))) +
  # theme(legend.position="none") +
  theme(legend.title = element_blank()) +
  theme(legend.position = "top") +
  scale_fill_manual(labels = c(" Developed ", " Low ", " Moderate ", " High ", " Outstanding"), values = c("#2D46D2", "#F1EEF6", "#D7B5D8", "#DF65B0", "#CE1256"), breaks = c("Developed", "Low", "Moderate", "High", "Outstanding")) +
  coord_flip() 
#> Show plot
plot2_AW_LMP14
#> Export the plot
ggsave(here("Out", "Plots", "Plot7.1_AW_LMP14_Values.png"), width = 7, height = 5)





