
UpdatedStateLevelData_2010 <- read_dta("/Users/abbyjohnson/Desktop/UT/Causal Inference/Lott-and-Mustard/data/UpdatedStateLevelData-2010.dta")

CS <- UpdatedStateLevelData_2010%>%
  mutate(state = factor(state)) %>% 
  select(fipsstat, year, shalll,
         lvio, lmur, lrap, laga, lrob, lpro, lbur, llar, laut, 
         starts_with("ao")) %>% 
  group_by(fipsstat) %>% 
  mutate(
    shalll_ever = if_else(sum(shalll)>0,1,0)
  ) %>% 
  ungroup()

view(CS)

year_treated_by_state <- CS %>% 
  select(fipsstat, year, shalll) %>% 
  mutate(is_treated = year * shalll) %>% 
  group_by(fipsstat, shalll) %>% 
  summarise(treatment_year = min(is_treated)) %>% 
  ungroup() %>%
  filter(shalll==1)%>%
  select(-shalll)


CS <- CS %>% left_join(year_treated_by_state, by = "fipsstat") %>%
  mutate(treatment_year = replace_na(treatment_year, 0))

y_vars <- CS %>% select(lvio, lmur, lrap, laga, lrob, lpro, lbur, llar, laut) %>% colnames
x_vars <- CS %>% select(starts_with("ao")) %>% colnames


cs_agg_output <- list()
cs_group_coefficients <- list()
sa_output <- list()


#CS 

for (i in 1:length(y_vars)) {
  
  y <- y_vars[i]
  x <- x_vars[i]
  x_form <- as.formula(paste0("~", x))
  
  atts <- att_gt(yname = y,
                 tname = "year",
                 idname = "fipsstat",
                 gname = "treatment_year",
                 data = CS,
                 xformla = x_form,
                 control_group = "notyettreated", 
                 clustervars = "fipsstat",
                 panel = TRUE)

  agg <- aggte(atts,
               type = "group",
               balance_e = T,
               na.rm = T)
  
  cs_agg_output[[y]] <- agg
  
  cs_group_coefficients[[y]] <- c(agg$overall.att,
                           agg$overall.se)
  
  
  
 
# SA
  sa_form <- paste0(y,
                    " ~ ",
                    x,
                    " + sunab(treatment_year, year) | fipsstat + year") %>% 
    as.formula()
  
  sa <- feols(fml = sa_form,
              data = CS)
  sa_output[[y]] <- sa
  
}

