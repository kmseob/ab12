library(stringr)
library(rvest)

# working directory
setwd("D:/12313")

#gall id
v <- c("travel_asia","chicken","smartphone","tabletpc","pridepc_new3","earphone","programming","exam_new", 
       "toy","fantasy_new","sphero","ib_new","plastic_s","depression","immovables",
       "bitcoins","car_new1","bicycle","gongik_new","bike","army",
       "lotto","diet","loan","cs","exam_gosi","government","correction","overwatch",
       "kart","d_fighter_new1","maplestory","game_mabinogi1","leagueoflegends2","cyphers","bd","fifaonline","ff14","talesweaver",
       "lostark","kbs_drama","mbc_drama1","sbs_drama","hiphop",
       "instruments","pop","classic","compose",
       "elec","baseball_new8","baseball_ab","basketball","extra",
       "volleyball","football_new6","boxing","fight","tennis",
       "football_k","bts","redvelvet",
       "twice","lovelyz","winner","univ_edu","2year_university",
       "4year_university","foreign_university","employment","arbeit")


#gall id loop
for (k in v){
  
  #page loop
  for(i in 1:100){
    
    url='https://gall.dcinside.com/board/lists/?id='    
    url2 = '&list_num=100&sort_type=N&search_head=&page='
    base_url <- paste0(url,k,url2,i,sep='')
    
    # title
    b <- readLines(base_url, encoding = 'UTF-8')
    b2 <- b[str_detect(b,"icon_img icon_txt")]
    dc_title <- str_extract(b2, "(?<=</em>).*(?=</a>)")
    
    # writer
    mm <- b[which(str_detect(b,"icon_img icon_txt"))+3]
    mm2 <- str_extract(mm, "(?<=data-nick=).*(?=data-uid)")
    mm3 <- gsub("/","",mm2)
    mm4 <- gsub("\"","",mm3)
    dc_writer <- gsub("%20","",mm4)
    
    # writer ip
    qq <- b[which(str_detect(b, "icon_img icon_txt"))+3]
    qq2 <- str_extract(qq, "(?<=data-ip=).*(?=data-loc)")
    qq3 <- gsub("/","",qq2)
    writer_ip <- gsub("\"","",qq3)
    
    # dc date
    rr <- b[which(str_detect(b, "icon_img icon_txt"))+5]
    rr2 <- str_extract(rr, "(?<=title=).*(?=</td>)")
    rr3 <- gsub("/","",rr2)
    rr4 <- gsub("\"","",rr3)
    dc_date <- substr(rr4,21,25)
    
    # cbind and assign
    data <- cbind(dc_title, dc_writer, writer_ip, dc_date)
    rownames(data) <- NULL
    assign(paste0("r",i), data)
    
  }
  
  ras1000 <- rbind(r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20,r21,r22,r23,r24,r25,r26,r27,r28,r29,r30,r31,r32,r33,r34,r35,r36,r37,r38,r39,r40,r41,r42,r43,r44,r45,r46,r47,r48,r49,r50,r51,r52,r53,r54,r55,r56,r57,r58,r59,r60,r61,r62,r63,r64,r65,r66,r67,r68,r69,r70,r71,r72,r73,r74,r75,r76,r77,r78,r79,r80,r81,r82,r83,r84,r85,r86,r87,r88,r89,r90,r91,r92,r93,r94,r95,r96,r97,r98,r99,r100)
                  
  ras1000 <- ras1000[-c(1,2),]
  rownames(ras1000) <- NULL
  ras9889 <- data.frame(ras1000)
  
  #today mm/dd
  ddaattee <- format(Sys.Date()-1, "%m.%d")
  ras9999 <- subset(ras9889, ras9889$dc_date == ddaattee)
  
  #gallery data
  assign(paste0("ooo",k), ras9999)
  
  #save each data
  write.csv(get(paste0("ooo",k)), paste0("gall__",k,"__",format(Sys.Date()-1,"%m-%d"),".csv"), row.names = FALSE)
  
}

######internet gall 400page go go
