install.packages(c("readxl", "ggplot2", "dplyr"))
library(readxl)
library(ggplot2)
library(dplyr)
data <- read_excel("W:/SpatMet/Antonia/R/Swapnas Manuscript D2 Labelling/Pathway.xlsx")

# Plot
ggplot(data, aes(x = Organ, y = Number, fill = Pathway)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = Number), 
            position = position_stack(vjust = 0.5), 
            size = 2.85,  # <<< Decrease size to ~10 pt
            color = "black",
            family = "Times New Roman") +  # Make sure font matches
  theme_minimal(base_family = "Times New Roman") +
  labs(
    y = "Number of metabolites",
    x = NULL,
    fill = "Pathway"
  ) +
  scale_y_continuous(breaks = seq(0, 200, by = 50)) +
  theme(
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.border = element_blank(),
    axis.line.x = element_line(color = "black"),
    axis.line.y = element_line(color = "black"),
    axis.ticks = element_line(color = "black"),
    axis.text = element_text(color = "black"),
    axis.title = element_text(color = "black"),
    text = element_text(family = "Times New Roman", color = "black"),
    legend.title = element_text(size = 12, family = "Times New Roman", color = "black"),
    legend.text = element_text(size = 10, family = "Times New Roman", color = "black"),
    legend.key.size = unit(0.4, "cm"),
    plot.title = element_text(hjust = 0.5)
  ) +
  scale_fill_brewer(palette = "Paired")

