
# CS Table

cs_table_dta = do.call("rbind", cs_group_coefficients) %>% 
  as.data.frame 

rownames(cs_table_dta) <- c("log(Violent Crime Rate)", "log(Murder Rate)", "log(Rape Rate)","log(Aggravated Assault Rate)","log(Robbery Rate)","log(Property Crime Rate)","log(Burglary Rate)","log(Larceny Rate)","log(Auto Theft Rate)")

cs_table_dta %>% as.data.frame %>%
  rownames_to_column() %>% 
  mutate(rowname = rowname %>% str_replace_all("_", " ") %>% str_to_title(),
         across(V1:V2, ~round(.x,3))) %>% 
  kbl(
    caption = "Table 5: Callaway and Sant'anna Overall ATTs",
    col.names = c("Outcome Variable",
                  "Overall ATT",
                  "SE"))