
library(tidyverse)

var <- read_tsv("variants_all.tsv", col_names = c("type", "phred", "dp"))

summary(var)

summary(var$phred[var$type=="SNP"])
summary(var$phred[var$type=="INDEL"])

summary(var$dp[var$type=="SNP"])
summary(var$dp[var$type=="INDEL"])

var <- var %>% filter(phred < 250)

g1 <- ggplot(var, aes(x = phred, fill = type)) +
  geom_histogram(position = "dodge", bins = 50) +
  theme_minimal() +
  labs(title = "PHRED Quality: INDEL vs SNP",
       x = "PHRED",
       y = "Count")

g2 <- ggplot(var, aes(x = dp, fill = type)) +
  geom_histogram(position = "dodge", bins = 50) +
  theme_minimal() +
  labs(title = "Read Depth (DP): INDEL vs SNP",
       x = "DP",
       y = "Count")

g3 <- ggplot(var, aes(x = type, y = phred, fill = type)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "PHRED Quality by Variant Type", x = "Variant Type", y = "PHRED")

g4 <- ggplot(var, aes(x = type, y = dp, fill = type)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Read Depth (DP) by Variant Type", x = "Variant Type", y = "DP")

ggsave("hist_phred.pdf", plot = g1, width = 6, height = 4)
ggsave("hist_dp.pdf", plot = g2, width = 6, height = 4)
ggsave("box_phred.pdf", plot = g3, width = 6, height = 4)
ggsave("box_dp.pdf", plot = g4, width = 6, height = 4)



