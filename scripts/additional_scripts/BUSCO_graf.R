library(ggplot2)
library(patchwork)
library(dplyr)
library(tidyr)

# 1. Data
df <- data.frame(
  Type = c(rep("Porifera", 8), rep("Cnidaria", 3), rep("Ctenophora", 2), rep("Filasterea (outgroup)", 1)),
  Class = c("Demospongiae", "", "", "Hexactinellida", "", "Calcarea", "Homoscleromorpha", "", "", "", "", "", "", ""),
  Species = c("Dysidea avara", "Aiolochroia crassa", "Halichondria panicea", "Aphrocallistes beatrix", 
              "Bolosoma cyanae", "Sycon ciliatum", "Corticium candelabrum", "Oscarella lobularis", 
              "Pocillopora verrucosa", "Hydractinia symbiolongicarpus", "Nematostella vectensis", 
              "Bolinopsis microptera", "Mnemiopsis leidyi",
              "Capsaspora owczarzaki"),
  S = c(70.2, 76.6, 71.4, 72.3, 70.2, 75.6, 72.9, 74.4, 79.9, 68.6, 72.9, 64.7, 72.9, 95.3),
  D = c(20.2, 11.2, 18.5, 5.1, 6.5, 11.3, 16.4, 15.3, 16.8, 26.0, 24.0, 14.4, 7.3, 0.8),
  F = c(3.6, 4.8, 3.7, 5.7, 5.7, 3.9, 6.4, 4.2, 1.5, 2.1, 1.0, 4.9, 5.8, 1.6),
  M = c(6.0, 7.4, 6.4, 17.0, 17.6, 9.2, 4.3, 6.1, 1.8, 3.3, 2.1, 15.9, 14.0, 2.3)
)

df <- df %>% mutate(row_idx = rev(row_number())) 

# --- Data for view lighting ---
highlight_species <- c("Aiolochroia crassa", "Aphrocallistes beatrix", "Bolosoma cyanae")
highlight_df <- df %>% 
  filter(Species %in% highlight_species) %>%
  mutate(ymin = row_idx - 0.5, ymax = row_idx + 0.5)

# --- Lines ---
type_line_df <- df %>%
  group_by(Type) %>%
  summarize(y = min(row_idx) - 0.5) %>%
  add_row(y = max(df$row_idx) + 0.5) %>%
  add_row(y = 0.5) %>% 
  distinct()

class_line_df <- df %>%
  mutate(Class_Full = ifelse(Class == "", NA, Class)) %>%
  fill(Class_Full, .direction = "down") %>%
  group_by(Type, Class_Full) %>%
  summarize(y = min(row_idx) - 0.5) %>%
  ungroup() %>%
  filter(!y %in% type_line_df$y)

type_labels <- df %>%
  group_by(Type) %>%
  summarize(y_mid = mean(row_idx))

# 2. Table (left part)
p_table <- ggplot(df) +

  geom_rect(data = highlight_df, aes(xmin = 4.7, xmax = 8.1, ymin = ymin, ymax = ymax), 
            fill = "#09808c", alpha = 0.25) +
  
  geom_segment(data = class_line_df, aes(x = 2.4, xend = 8.1, y = y, yend = y), 
               color = "grey60", linewidth = 0.5) +
  geom_segment(data = type_line_df, aes(x = -0.1, xend = 8.1, y = y, yend = y), 
               color = "black", linewidth = 0.8) +
  
  geom_text(data = type_labels, aes(x = 0, y = y_mid, label = Type), 
            hjust = 0, size = 4.8, fontface = "bold") +
  geom_text(aes(x = 2.6, y = row_idx, label = Class), hjust = 0, size = 4.2) +
  geom_text(aes(x = 4.9, y = row_idx, label = Species), hjust = 0, size = 4.2, fontface = "italic") +
  
  annotate("text", x = c(0, 2.6, 4.9), y = nrow(df) + 1.2, 
           label = c("Phylum", "Class", "Species"), fontface = "bold", hjust = 0, size = 5.2) +
  
  scale_y_continuous(limits = c(0.4, nrow(df) + 2), expand = c(0,0)) + 
  xlim(-0.1, 8.2) + 
  theme_void()

# 3. Graph BUSCO (right part)
df_long <- pivot_longer(df, cols = c(S, D, F, M), names_to = "Status", values_to = "Percentage")
df_long$Status <- factor(df_long$Status, levels = c("M", "F", "D", "S"))
custom_breaks <- c(0, 25, 50, 75, 80, 85, 90, 95, 100)

p_busco <- ggplot(df_long) +
  geom_segment(data = class_line_df, aes(y = y, yend = y, x = 0, xend = 100), 
               color = "grey60", linewidth = 0.5) +
  geom_segment(data = type_line_df, aes(y = y, yend = y, x = 0, xend = 100), 
               color = "black", linewidth = 0.8) +
  
  geom_col(aes(x = row_idx, y = Percentage, fill = Status), width = 0.75, color = "white", linewidth = 0.2) +
  coord_flip(clip = "off") +
  scale_fill_manual(
    values = c("S" = "#a6cee3", "D" = "#1f78b4", "F" = "#fdbf6f", "M" = "#e31a1c"),
    labels = c("S" = "Complete (single-copy)", "D" = "Complete (duplicated)", 
               "F" = "Fragmented", "M" = "Missing"),
    breaks = c("S", "D", "F", "M")
  ) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.08)), breaks = custom_breaks) +
  scale_x_continuous(limits = c(0.4, nrow(df) + 2), expand = c(0,0)) +
  theme_minimal() +
  theme(
    axis.text.y = element_blank(),
    axis.title = element_blank(),
    panel.grid.major.y = element_blank(),
    panel.grid.minor = element_blank(),
    axis.text.x = element_text(size = 11),
    legend.position = "bottom",
    legend.title = element_blank(),
    legend.text = element_text(size = 12.5),
    legend.key.width = unit(1.8, "cm"),
    legend.spacing.x = unit(0.5, "cm"),
    plot.margin = margin(l = 5, r = 30, t = 10, b = 10)
  ) +
  guides(fill = guide_legend(nrow = 1))

# 4. Combining
final_plot <- p_table + p_busco + plot_layout(widths = c(1, 1.4))

# 5. Saving
ggsave("BUSCO_species_highlight_final.png", final_plot, width = 45, height = 18, units = "cm", dpi = 300)

