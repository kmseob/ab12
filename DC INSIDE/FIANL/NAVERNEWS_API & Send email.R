# 필요한 라이브러리
library(RCurl)
library(XML)

# 네이버 뉴스 검색 결과 반환 요청 URL
newsUrl <- "https://openapi.naver.com/v1/search/news.xml"

#비 로그인 방식 오픈 API id와 secret
client_id <- "Wzr7jH5LTIQfDMw5lcBY"
client_secret <- "C2InRfPf0z"

# 뉴스에서 빅데이터 단어 검색
query <- URLencode(iconv("트와이스","euc-kr", "UTF-8"))
url <- paste(newsUrl, "?query=",query,"&display=100",sep = "")


doc <- getURL(url,
              httpheader = c('Content-Type' = 'application/xml',
                             'X-Naver-Client-Id'=client_id,
                             'X-Naver-Client-Secret'=client_secret)
)
doc1 <- htmlParse(doc, encoding = "UTF-8")

text <- xpathApply(doc1, "//item/description", xmlValue)
a<- data.frame(text)
a<- t(a)
a1 <- a[,1]
setwd("C:/Users/MY/Desktop/명섭/github/DC INSIDE/FIANL/news_send_email")
write.csv(a1, "DC_news.csv", row.names = FALSE)

# install package
remotes::install_github("mrchypark/sendgridr")
library(sendgridr)
auth_set()

#set working directory

# send mail
mail() %>% 
  from("8renn2923@gmail.com", "kmseob") %>% 
  to("8renn2923@gmail.com", "kmseob") %>% 
  subject("DCinside") %>% 
  content("DCinside gallery")  %>% 
  ## attachments is optional
  attachments("DC_news.csv") %>% 
  send()
