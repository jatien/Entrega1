library("palmerpenguins")
library("tidyverse")

#Las medias dependientes de especie
penguins %>% 
  group_by(species) %>% 
  summarize(across(where(is.numeric), mean, na.rm = TRUE))
#Desviación típica-por especies
penguins %>% 
  group_by(species) %>% 
  summarize(across(where(is.numeric), sd, na.rm = TRUE))
#mediana-especies
penguins %>% 
  group_by(species) %>% 
  summarize(across(where(is.numeric), median, na.rm = TRUE))


bill_no_species <- ggplot(data = penguins,
                          aes(x = bill_length_mm,
                              y = bill_depth_mm)) +
  geom_point() +
  scale_color_manual(values = c("darkorange","purple","cyan4")) +
  labs(title = "Penguin bill dimensions (omit species)",
       subtitle = "Palmer Station LTER",
       x = "Bill length (mm)",
       y = "Bill depth (mm)") +
  theme(plot.title.position = "plot",
        plot.caption = element_text(hjust = 0, face= "italic"),
        plot.caption.position = "plot") +
  geom_smooth(method = "lm", se = FALSE, color = "gray50")

bill_no_species
