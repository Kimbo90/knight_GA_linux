if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}

BiocManager::install(version = "3.18")

BiocManager::install(c(
  "wateRmelon",
  "methylumi",
  "FDb.InfiniumMethylation.hg19",
  "TxDb.Hsapiens.UCSC.hg19.knownGene"
))

library(wateRmelon)

# ---- DOWNLOAD beta matrix from OneDrive ----

download.file(
  "https://cf-my.sharepoint.com/:u:/r/personal/joneskm10_cardiff_ac_uk/Documents/Documents/GA_transfer/beta_W6.rds?download=1",
  destfile = "beta_W6.rds",
  mode = "wb",
  method = "libcurl"
)

beta_W6 <- readRDS("beta_W6.rds")

# ---- RUN KNIGHT GA CLOCK ----
ga_knight <- agep(beta_W6, method = "knight")

GA_results <- data.frame(
  Basename  = colnames(beta_W6),
  GA_Knight = as.numeric(ga_knight)
)

write.csv(GA_results, "GA_Knight_results.csv", row.names = FALSE)
