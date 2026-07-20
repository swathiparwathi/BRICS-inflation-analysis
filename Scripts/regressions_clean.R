##  07/05/2025
## Function to compute regression tables for first and second round effects:
do_reg <- function(sheet_name){
  df <- readxl::read_excel('./data/inflation_dataset.xlsx', sheet = sheet_name)
  df <- df[1:3]
  df_complete <- df[complete.cases(df),] 
  
  # Compute lags:
  df_complete$headline_yy_lag12 <- dplyr::lag(df_complete$headline_yy, 12)
  df_complete$core_yy_lag12 <- dplyr::lag(df_complete$core_yy, 12)
  
  # Compute the variables:
  df_complete$var1 <- df_complete$headline_yy - df_complete$headline_yy_lag12
  df_complete$var2 <- df_complete$headline_yy_lag12 - df_complete$core_yy_lag12
  df_complete$var3 <- df_complete$core_yy - df_complete$core_yy_lag12
  df_complete$var4 <- df_complete$core_yy_lag12 - df_complete$headline_yy_lag12
  
  # Equations
  eq1 <- lm(df_complete$var1 ~ df_complete$var2)
  result1 <- broom::tidy(eq1)
  result1_glance <- broom::glance(eq1)
  eq2 <- lm(df_complete$var3 ~ df_complete$var4)
  result2 <- broom::tidy(eq2)
  result2_glance <- broom::glance(eq2)
  results <- list(result1, result1_glance, result2, result2_glance)
  return(results)
}

# Create a loop for all BRICS countries:
brics <- c('Brazil', 'India', 'China', 'Russia', 'South Africa')

# Create a new Excel workbook
wb <- openxlsx::createWorkbook()
# Loop over datasets and add a sheet for each
for (i in brics) {
  result <- do_reg(i)
  openxlsx::addWorksheet(wb, i)
  
  # Write tidy output starting at top
  openxlsx::writeData(wb, sheet = i, result[[1]], startRow = 1, startCol = 1, withFilter = TRUE)
  
  # Write glance output below tidy, leaving a blank row in between
  start_row <- nrow(result[[1]]) + 3
  openxlsx::writeData(wb, sheet = i, result[[2]], startRow = start_row, startCol = 1, withFilter = FALSE)
  
  # Write result2 and glance 2:
  # Write tidy output starting at top
  start_row_2 <- nrow(result[[1]]) + 3 + nrow(result[[2]]) + 3
  openxlsx::writeData(wb, sheet = i, result[[3]], startRow = start_row_2, startCol = 1, withFilter = TRUE)
  
  # Write glance output below tidy, leaving a blank row in between
  start_row_3 <- nrow(result[[1]]) + 3 + nrow(result[[2]]) + 3 + nrow(result[[3]]) + 3
  openxlsx::writeData(wb, sheet = i, result[[4]], startRow = start_row_3, startCol = 1, withFilter = FALSE)
}


# Save workbook
openxlsx::saveWorkbook(wb, file = "./output/regression_results_first_second_round.xlsx", overwrite = TRUE)


## 08/05/2025
## Function to compute regression tables for AD components:
do_reg_ad <- function(sheet_name){
  df <- readxl::read_excel('./data/ad_data_new.xlsx', sheet = sheet_name)
  
  df1_headline <- df[c(1:2, 4:7)] # Select the relevant columns for headline inflation
  df1_headline_complete <- df1_headline[complete.cases(df1_headline), ]
  
  df2_core <- df[c(1,3:7)] # Select the relevant columns for core inflation
  df2_core_complete <- df2_core[complete.cases(df2_core),]
  
  # Equations
  headline <- lm(df1_headline_complete$headline_cpi_yy ~ 
                   df1_headline_complete$cons_yy + 
                   df1_headline_complete$gfcf_yy +
                   df1_headline_complete$g_yy +
                   df1_headline_complete$exports_yy)
  result1 <- broom::tidy(headline)
  result1_glance <- broom::glance(headline)
  core <- lm(df2_core_complete$core_cpi_yy ~ 
               df2_core_complete$cons_yy + 
               df2_core_complete$gfcf_yy +
               df2_core_complete$g_yy +
               df2_core_complete$exports_yy)
  result2 <- broom::tidy(core)
  result2_glance <- broom::glance(core)
  results <- list(result1, result1_glance, result2, result2_glance)
  return(results)
}

# Create a loop for all BRICS countries:
brics <- c('brazil_clean', 'india_clean', 'china_clean_2', 'russia_clean', 'south_africa_clean')

# Create a new Excel workbook
wb <- openxlsx::createWorkbook()
# Loop over datasets and add a sheet for each
for (i in brics) {
  result <- do_reg_ad(i)
  openxlsx::addWorksheet(wb, i)
  
  # Write tidy output starting at top
  openxlsx::writeData(wb, sheet = i, result[[1]], startRow = 1, startCol = 1, withFilter = TRUE)
  
  # Write glance output below tidy, leaving a blank row in between
  start_row <- nrow(result[[1]]) + 3
  openxlsx::writeData(wb, sheet = i, result[[2]], startRow = start_row, startCol = 1, withFilter = FALSE)
  
  # Write result2 and glance 2:
  # Write tidy output starting at top
  start_row_2 <- nrow(result[[1]]) + 3 + nrow(result[[2]]) + 3
  openxlsx::writeData(wb, sheet = i, result[[3]], startRow = start_row_2, startCol = 1, withFilter = TRUE)
  
  # Write glance output below tidy, leaving a blank row in between
  start_row_3 <- nrow(result[[1]]) + 3 + nrow(result[[2]]) + 3 + nrow(result[[3]]) + 3
  openxlsx::writeData(wb, sheet = i, result[[4]], startRow = start_row_3, startCol = 1, withFilter = FALSE)
}


# Save workbook
openxlsx::saveWorkbook(wb, file = "./output/regression_results_ad_components.xlsx", overwrite = TRUE)
