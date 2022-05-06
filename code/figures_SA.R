
# SA Figures

rm(i)
for (i in 1:length(y_vars)) {
  
  y <- y_vars[i]
  path <- paste0("writing/figures/", y, ".png")
  png(here(path), width = 700, height = 350)
  iplot(sa_output[[y]], ref.line = -1, main = "")
  dev.off()
}