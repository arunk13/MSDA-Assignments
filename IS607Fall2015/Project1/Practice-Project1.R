library(stringr);
library(plyr);
tournamentinfo_master <- readLines('https://raw.githubusercontent.com/arunk13/MSDA-Assignments/master/IS607Fall2015/Project1/tournamentinfo.txt');
head(tournamentinfo_master, 10);
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
tournamentinfo_final <- as.data.frame(str_match(tournamentinfo, regex_pattern)[,-1], stringsAsFactors = FALSE);
calc_avg_pre_opprating <- function(x){
    total_pre_rating <- 0;
    total_opp <- 0;
    opp_columns <- c(5, 7,9,11,13,15,17);
    for(i in opp_columns){
      index <- as.character(x[i][1,1]);
      if(!is.na(index)){
        total_pre_rating = total_pre_rating + as.numeric(tournamentinfo_final[index,19]);
        total_opp = total_opp + 1;
      }
    }
    round(total_pre_rating/total_opp, 0);
}

tournamentinfo_final <- adply(tournamentinfo_final,.margins = 1, .fun = calc_avg_pre_opprating);
tournamentinfo_final <- tournamentinfo_final[c(1,17,2,18,20)];
names(tournamentinfo_final) <- c("Player Name", "State", "Rating", "Pre Rating", "Avg Opp Pre-Rating");
write.csv(tournamentinfo_final, file = "MyData.csv")
