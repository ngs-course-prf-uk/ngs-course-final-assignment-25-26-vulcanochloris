
library(tidyverse)

var <- read_tsv("variants_all.tsv", col_names = c("type", "phred", "dp"))

summary(var)

summary(var$phred[var$type=="SNP"])
summary(var$phred[var$type=="INDEL"])

summary(var$dp[var$type=="SNP"])
summary(var$dp[var$type=="INDEL"])

var <- var %>% filter(phred < 250)

g1 <- ggplot(var, aes(x = type, y = phred, fill = type)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "PHRED Quality by Variant Type", x = "Variant Type", y = "PHRED")

g2 <- ggplot(var, aes(x = type, y = dp, fill = type)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Read Depth (DP) by Variant Type", x = "Variant Type", y = "DP")

ggsave("results/box_phred.png", plot = g1, width = 6, height = 4)
ggsave("results/box_dp.png", plot = g2, width = 6, height = 4)



