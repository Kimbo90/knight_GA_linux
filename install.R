install.packages("BiocManager")

BiocManager::install(version = "3.18")

BiocManager::install(c(
  "wateRmelon",
  "methylumi",
  "FDb.InfiniumMethylation.hg19",
  "TxDb.Hsapiens.UCSC.hg19.knownGene"
))
