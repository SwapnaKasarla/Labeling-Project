library(ggh4x)
library(readr)
library(readxl)
library(ggplot2)
library(tidyr)
library(tidyverse)
library(viridis)
library(RColorBrewer)
library(extrafont)


# Excel
number <- read_excel("W:/SpatMet/Antonia/R/Bar plot/barplots_R_SK.xlsx")

# Order
number$Condition <- factor(number$Condition, levels = c("Unwash", "Chloroform", "Hexane", "Basic hexane"))

# Plot 
ggplot(number, aes(x = Condition, y = Number, fill = Condition)) + 
  geom_bar(position = "dodge", stat = "identity", show.legend = TRUE) +
  theme(axis.title.y = element_text(size = 12),  # Y-Achsentitel
        axis.text.y = element_text(size = 10),   # Y-Achsenbeschriftungen
        axis.ticks.y = element_line(color = "black"),
        axis.ticks.x = element_blank(),  # Y-Achsentick 
        panel.background = element_rect(fill = "white"),  # Hintergrund der Paneele weiß machen
        panel.grid.major = element_line(color = "white", linetype = "solid", size = 0.5),
        panel.grid.minor = element_blank(),  # Deaktivierung der Nebengitterlinien
        strip.background = element_rect(fill = "white", color = "black"),  # Hintergrund der Facetten-Labels
        panel.border = element_rect(color = "black", fill = NA),  # Umrandung um die einzelnen Barplots
        axis.line = element_line(color = "black"),
        legend.position = "bottom", 
        legend.title = element_blank(),  # Legendentitel entfernen
        axis.title.x = element_blank(), 
        axis.text.x = element_blank()) +  # Achsenlinienfarbe
  facet_wrap(~ Organ, ncol = 5) +  # Anpassung der Anzahl der Spalten auf 5
  scale_fill_brewer(palette = "Spectral") +
  scale_x_discrete() +
  scale_y_continuous("Number of Metabolites", limits = c(0, 180), expand = c(0, 0))
