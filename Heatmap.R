

# Load required libraries
library(readxl)
library(tidyverse)

# Read fold change data from Excel file
foldchange_data_labeled <- read_excel("W:/SpatMet/Antonia/R/heatmap/liver_all.xlsx")

# Reshape the data into long format
foldchange_data_labeled_long <- foldchange_data_labeled %>%
  gather(key = "Condition", value = "Foldchange", -Metabolites_name)

# Plot the heatmap
ggplot(foldchange_data_labeled_long, aes(x = Condition, y = Metabolites_name, fill = Foldchange)) +
  geom_tile() +
  scale_fill_gradientn(colors = c("lightyellow", "red", "darkred"), name = "Fold Change") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))+
  theme(axis.text.y=element_text(size=8, color="black"))


