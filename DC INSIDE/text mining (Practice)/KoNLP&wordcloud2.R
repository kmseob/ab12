library('igraph')
library('tidygraph') 
library('ggraph')

library('wordcloud2')
library('reshape2')
library('tidyverse')
library('rJava')
library('readr')
library('igraph')

library('KoNLP')

###############################

#call dictionary
useNIADic()

#################### convert csv file to txt file

setwd("C:/Users/MY/Desktop/명섭/github/DC INSIDE/DATA(5-18~)/5_28")
datasett <- read.csv("gall__twice__05-28.csv", header = TRUE)
datasett <- datasett[,1]

write.table(datasett, "D:/12313/datasett.txt", 
            row.names = FALSE, fileEncoding = "UTF-8",
            na = ".")

setwd("D:/12313")
m <- read_lines('datasett.txt')
head(m, 2)


################ list

m_df <- read_lines('datasett.txt') %>% SimplePos09 %>% melt %>% as_tibble %>% select(3, 1)

m_df %>% mutate(noun=str_match(value, '([가-힣]+)/N')[,2]) %>% na.omit %>% count(noun, sort=TRUE)
m_df %>% mutate(noun=str_match(value, '([가-힣]+)/N')[,2]) %>% na.omit %>% mutate(length=str_length(noun))

######################

# 빈도수 csv 필요없는것 제거
result <- m_df %>% mutate(noun=str_match(value, '([가-힣]+)/N')[,2]) %>% na.omit %>% filter(str_length(noun)>=2) %>% count(noun, sort=TRUE)

result <- subset(result, noun != "근데")
result <- subset(result, noun != "진짜")
result <- subset(result, noun != "존나")
result <- subset(result, noun != "누구")
result <- subset(result, noun != "이거")
result <- subset(result, noun != "그거")
result <- subset(result, noun != "저거")

write.csv(result, file = "datasett_text.csv", row.names = FALSE)
result

# word cloud
result2 <- result %>% wordcloud2()
result2


############################################ 바이그램

#상위 30개 확인
m_count <- result %>% head(15)

#품사 제외
result_t <- m_df %>% mutate(noun=str_match(value, '([가-힣]+)/N')[,2]) %>% na.omit %>% filter(str_length(noun)>=2)
m_df2 <- result_t %>% select(3, 1)

#같은 열에 있을 때만 골라낸다
m_df3 <- m_df2 %>% filter(noun %in% m_count$noun)

#mg라는 변수에 그래프를 넣는다
mg <- graph_from_data_frame(m_df3)


#사회 연결망을 만들기 위한 정리
V(mg)$type <- bipartite_mapping(mg)$type 
mm <- as_incidence_matrix(mg) %*% t(as_incidence_matrix(mg)) 
diag(mm) <- 0 
mg <- graph_from_adjacency_matrix(mm)


#그래프 정리
mg %>% as_tbl_graph() %>% 
  ggraph() + 
  geom_edge_link(aes(start_cap = label_rect(node1.name), end_cap = label_rect(node2.name))) + 
  geom_node_text(aes(label=name))


##바이그램
bigram_df <- m_df2 %>% 
  na.omit() %>% 
  select(noun) %>% 
  mutate(lead=lead(noun)) %>% 
  unite(bigram, c(noun, lead), sep=' ') %>% 
  count(bigram, sort=TRUE)%>% 
  head(50) %>% 
  separate(bigram, c('word1', 'word2'))

### bigram_df <- bigram_df[-15,] ##같은 바이그램 제거 예시

###최종 그리기
bigramm <- bigram_df %>% 
  as_tbl_graph %>% 
  ggraph() + 
  geom_edge_link(aes(start_cap = label_rect(node1.name), end_cap = label_rect(node2.name))) + 
  geom_node_point(color = "lightblue", size = 5) +
  geom_node_text(aes(label=name), vjust = 1, hjust = 1) +
  theme_void()

bigramm
  








                