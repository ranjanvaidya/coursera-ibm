# https://stackoverflow.com/questions/46310288/r-list-of-lists-to-dataframe-with-list-name-as-extra-column
ls()
rm(list = ls())
ls()
#reading many papers
library(plyr)
library(dplyr)
files <- list.files(path = "./", pattern = "*.doc", full.names = T)
library(textreadr)
files
str(files)
library(textreadr)
# The code below reads each word file in the object files
all_student_files <- lapply(files, read_document)
str(all_student_files)
all_student_files[1]
names(all_student_files)
names(all_student_files) <- paste0("element",seq(length(all_student_files)))
names(all_student_files)
str(all_student_files)
library(purrr)
all_student_files_2 <- map_df(all_student_files, ~as.data.frame(.x), .id="id")
all_student_files_2 <- as.data.frame(all_student_files_2)
View(all_student_files_2)
names(all_student_files_2)[2] <- paste("content")
names(all_student_files_2)[1] <- paste("source_id")
# Reading the document to be tested
library(dplyr)
library(textreadr)
Document_1 <- "C:/Users/em12627/Downloads/2021 Teaching - Sem 2/Document_1.docx"
Document_1 <- read_document(Document_1, skip = 0, remove.empty = TRUE, trim = TRUE)
head(Document_1)
Document_1 <- as.data.frame(Document_1)
View(Document_1)
names(Document_1) <- paste("content")
Document_1$source_id <- seq(1:nrow(Document_1))
Document_1 <- Document_1[, c(2,1)]
library(daff)
diff_data(data_ref = Document_1, data = all_student_files_2)
render_diff(diff_data(data_ref = Document_1, data = all_student_files_2))



# all_researc_papers <- as.data.frame(unlist(all_researc_papers))
# View(all_researc_papers)
# names(all_researc_papers)[1] <- paste("content")
# names(all_researc_papers)[1]
# library(purrr)
# ans <- map_df(all_researc_papers, ~as.data.frame(.x), .id="id")
# View(ans)
# 
# 
# 
# 
# head(all_researc_papers)
# names(all_researc_papers)
# names(all_researc_papers) <- paste0("element",seq(length(all_researc_papers)))
# 
# 
# head(all_researc_papers, 1)
# all_researc_papers <- lapply(all_researc_papers, '[')
# head(all_researc_papers)
# 
# # do.call(cbind, all_researc_papers)
# View(unlist(all_researc_papers))
# 
# str(all_researc_papers)
# all_documents_dataframe <- do.call(rbind, all_researc_papers)
# all_documents_dataframe <- as.data.frame(all_documents_dataframe)
# head(all_documents_dataframe)
# 
# 
# head(all_researc_papers)
# getwd()
# # all_researc_papers
# all_researc_papers <- lapply(all_researc_papers, grep, pattern="culture", value=TRUE)
# names(all_researc_papers) <- paste0("element",seq(length(all_researc_papers)))
# all_researc_papers[1]
# all_researc_papers <- as.data.frame(unlist(all_researc_papers))
# View(all_researc_papers)
# write.table(all_researc_papers, "./culture.csv", sep = ",", col.names = F, append = T)
# 
# #reading a single paper
# file <- "./name_of_paper.pdf"
# research_paper <- read_document(file, skip = 1, remove.empty = TRUE, trim = TRUE)
# research_paper
# grep("culture", research_paper)
# research_paper <- as.data.frame(research_paper)
# grep("culture", research_paper$research_paper, value = T)
# name_of_paper <- grep("culture", research_paper$research_paper, value = T)
# name_of_paper_DF <- as.data.frame(name_of_paper)
# write.table(name_of_paper, "name_of_paper.csv", sep = ",", col.names = F, append = T)








