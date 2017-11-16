library(ggplot2)
library(RColorBrewer)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = as.factor(cyl)), size = 2, position = "jitter") +
  geom_smooth(method = "lm") +
  labs(
    title = "Fuel Efficiency and Engine Size \nof Consumer Automobiles",
    subtitle = "Select Vehicles Sold in the United States",
    x = "Engine Displacement (litres)",
    y = "Highway Fuel Efficiency (mpg)"
  )

ggsave("static/images/week-12-image01.png", width = 200, height = 150, units = "mm", dpi = 100)

display.brewer.all()
# saved manually 600 x800

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = as.factor(cyl)), size = 2, position = "jitter") +
  geom_smooth(method = "lm") +
  labs(
    title = "Fuel Efficiency and Engine Size",
    subtitle = "Select Vehicles Sold in the United States",
    x = "Engine Displacement (litres)",
    y = "Highway Fuel Efficiency (mpg)"
  ) +
  scale_color_brewer(palette = "Dark2")

ggsave("static/images/week-12-image03.png", width = 200, height = 150, units = "mm", dpi = 100)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = as.factor(cyl)), size = 2, position = "jitter") +
  geom_smooth(method = "lm", color = "#66A61E") +
  labs(
    title = "Fuel Efficiency and Engine Size",
    subtitle = "Select Vehicles Sold in the United States",
    x = "Engine Displacement (litres)",
    y = "Highway Fuel Efficiency (mpg)"
  ) +
  scale_color_brewer(palette = "Dark2")

ggsave("static/images/week-12-image04.png", width = 200, height = 150, units = "mm", dpi = 100)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = as.factor(cyl)), size = 2, position = "jitter") +
  geom_smooth(method = "lm", color = "#1e66a6") +
  labs(
    title = "Fuel Efficiency and Engine Size",
    subtitle = "Select Vehicles Sold in the United States",
    x = "Engine Displacement (litres)",
    y = "Highway Fuel Efficiency (mpg)"
  ) +
  scale_color_brewer(palette = "Dark2")

ggsave("static/images/week-12-image05.png", width = 200, height = 150, units = "mm", dpi = 100)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = as.factor(cyl)), size = 2, position = "jitter") +
  geom_smooth(method = "lm", color = "#1e66a6") +
  labs(
    title = "Fuel Efficiency and Engine Size",
    subtitle = "Select Vehicles Sold in the United States",
    x = "Engine Displacement (litres)",
    y = "Highway Fuel Efficiency (mpg)"
  ) +
  scale_color_brewer(palette = "Dark2", labels = c("Four", "Five", "Six", "Eight"))

ggsave("static/images/week-12-image07.png", width = 200, height = 150, units = "mm", dpi = 100)
