library(stringr);
library(plyr);
tournamentinfo_master <- readLines('https://raw.githubusercontent.com/arunk13/MSDA-Assignments/master/IS607Fall2015/Project1/tournamentinfo.txt');
#Ref: http://stackoverflow.com/questions/9068397/import-text-file-as-single-character-string
tournamentinfo <- tournamentinfo_master;
str_detect(tournamentinfo, "^-+$");
tournamentinfo <- str_replace_all(tournamentinfo, "^-+$", "");
tournamentinfo <- tournamentinfo[sapply(tournamentinfo, nchar) > 0];
tournamentinfo <- tournamentinfo[-c(1:2)];
append_separator <- function(x){
  row_index <- which(tournamentinfo == x);
  if(row_index %% 2 == 0){
    x <- paste(x, "*");
  }else{
    x;
  }
}
tournamentinfo <- sapply(tournamentinfo, append_separator);
tournamentinfo <- paste(tournamentinfo, collapse = "");
tournamentinfo <- unlist(strsplit(tournamentinfo, split = "\\*"));
tournamentinfo <- unlist(str_extract_all(tournamentinfo, "^(.+?\\|){12}"));
id <- "^\\s+(\\d+)\\s+\\|";
name <- "\\s+([[:alnum:]- ]+)\\b\\s*\\|";
total_points <- "(\\d+\\.?\\d*)\\s*\\|";
res_opp <- "(\\w)\\s*(\\d{1,})?\\|";
state <- "\\s*(\\w{2})\\s*\\|";
avoid <- "\\s*.+R:";
pre_rating <- "\\s*(\\d{1,}).*->";
post_rating <- "\\s*(\\d{1,}).*\\|";
regex_pattern <- paste(id,name,total_points,res_opp,res_opp,res_opp,res_opp,res_opp,res_opp,res_opp,state,avoid,pre_rating,post_rating, sep = "");
as.data.frame(str_match(tournamentinfo, regex_pattern)[,-1]);









#############
temp <- str_split(tournamentinfo, "\\|");
temp <- lapply(temp, str_trim);
tournamentinfo_frame <- data.frame(matrix(unlist(temp), nrow = 64, byrow = TRUE), stringsAsFactors = FALSE)
#http://stackoverflow.com/questions/4227223/r-list-to-data-frame
tournamentinfo_frame <- tournamentinfo_frame[-c(13)];



##############
######functions which didnt work

unlist(temp);



lapply(temp, str_trim)

data_extract <- function(d){
  c(str_trim(str_match(d, "\\s+[0-9]{2}\\b")), 
    str_trim(str_match(d, "^(.+?\\|){1}")),)
}


str_locate(tournamentinfo[1], ".+")



sapply(temp, unlist);

str_trim(str_extract(tournamentinfo, "\\|.+?\\|"))
sapply(tournamentinfo, )
str_trim(str_match(tournamentinfo, "\\s+[0-9]{2}\\b"));

tournamentinfo <- str_trim(str_split(tournamentinfo, "\\|"));
#str_c(tournamentinfo, "");


