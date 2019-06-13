# 디시인사이드       
디씨인사이드 갤러리별 게시글들을 수집하여 데이터를 만드려고합니다.         

## 수집할 데이터        
![1](https://user-images.githubusercontent.com/49008643/56280869-189c1d00-6146-11e9-97cf-b4af86e4119f.JPG)            

디시인사이드는 주제별 게시판의 집합체인 사이트입니다.     
디시인사이드 갤러리 (dcinside.com)에는 매일 70만개 이상의 게시글, 150만개 이상의 댓글이 작성되는 사이트입니다.    
수 많은 주제로 나뉜 게시판(**해외축구, 국내야구, 각종 게임등등**)에 많은 사람들이 게시글과 댓글을 작성합니다.   
그래서 이 사이트에서 생성되는 데이터를 활용하여 무엇을 할 수 있을까 생각해 보았다.           

## 수집한 데이터 활용방법

생각하는 것은 개인이 관심을 가지고 있는 분야와 관련 있는 갤러리의 데이터를 매일 수집한다.    
그 날의 정보를 토대로 가장 화제 되는 주제가 무엇인지 텍스트마이닝을 통해서 알아본다.   
갤러리 관련 키워드를 네이버 뉴스에 검색하여 결과를 보내본다.    


## 수집한 데이터가 유용하다고 생각하는 이유

지금 인터넷 상에는 데이터가 너무나 많고, 끊임없이 새로운 데이터가 생성 되고 있기 때문에 자기가 원하는 정보만 얻기란 쉽지 않고,        
취미나 유흥거리에 집중하고 살기에는 삶이 너무 바쁘다고 생각한다.           
그런 바쁜 사람들에게 프로그램이 스스로 정보를 제공하는 기능은 정말 편한 기능일 수 있다.          


## 데이터

[데이터](https://github.com/kmseob/ab12/tree/master/DC%20INSIDE/DATA(5-18~)) 수집 기간 : 5월 18일 ~ 6월 11일 총 25일
전체 파일 크기 : 82.1MB                
갤러리 : 70개의 갤러리          
가져온 정보 : 게시글 제목 / 작성자 / 작성자의 IP / 날짜                
        
***꾸준히 모아온 데이터가 대부분 텍스트 위주로 구성되어 있기 때문에 텍스트 마이닝을 활용해서 분석을 시도***          

## [분석 방법](https://github.com/kmseob/ab12/blob/master/DC%20INSIDE/FIANL/KoNLP%26wordcloud2.R)과 결과 (축구 갤러리)

### 1. 빈도수   
 
- 빈도수를 csv 파일로 저장 
 
[빈도수 파일 저장 리스트](https://github.com/kmseob/ab12/tree/master/DC%20INSIDE/FIANL/final%20test%20data(%EB%B6%84%EC%84%9D%EA%B2%B0%EA%B3%BC)/1%EB%B9%88%EB%8F%84%EB%B6%84%EC%84%9D)      


- 빈도 표                   
   
 ![56643353](https://user-images.githubusercontent.com/49008643/59383497-f5cf6300-8d9a-11e9-891f-896746c8a5fe.JPG)           
           
- 절대적 빈도수 비교 곡선 - 가장 많이 등장한 단어를 선택하여 빈도수             
              
![graph](https://user-images.githubusercontent.com/49008643/59378651-c6672900-8d8f-11e9-8f82-84aad028ace0.JPG)           
             

### 2. 연결정도 중심성을 바탕으로 네트워크 시각화           
        
-네트워크 시각화 (6월 1일)            
        
![22222222](https://user-images.githubusercontent.com/49008643/59378838-3ecdea00-8d90-11e9-98c6-093b71612076.JPG)           
                 
          
-바이그램을 활용 (6월 1일)            
                
![111111111](https://user-images.githubusercontent.com/49008643/59378862-48575200-8d90-11e9-8003-2cb683b68b27.JPG)           
 
             
### 3. TF-DI(Term Frequency - Date Index)를 활용한 트렌드 분석과 키워드의 중요도             
            
- TF-DI 계산방법          
                 
![12](https://user-images.githubusercontent.com/49008643/59385945-6f1d8480-8da0-11e9-88e6-8e319ebfc100.JPG)                 
               
>키워드 i : 손흥민 / 박지성 / 호날두 / 메시 / 리버풀 / 토트넘 / 이강인      
>j (시작하는 날의 횟수) = 1,2,3...23     
>n (분석기간의 횟수) = 23    

TF : 상대적 빈도수   
DF : 날짜별로 가중치  
  
ex)         
'5/20-손흥민'의 중요도를 알고 싶다.    

     1. '5/20-손흥민의 빈도수' / '5/20 모든 키워드 빈도수 총합' -> TF        
     2.          '3'          / '분석기간의 횟수 23'          -> DF     
     3.  TF *  DF   = 0041918          
     
      
|        | 5_18     | 5_19     | 5_20     | 5_21     | 5_22     | 5_23     | 5_24     | 5_25     | 5_27     | 5_28     | 5_29     | 5_30     | 5_31     | 6_1      | 6_2      | 6_3      | 6_4      | 6_5      | 6_6      | 6_7      | 6_8      | 6_9      | 6_10     |          |
|--------|----------|----------|----------|----------|----------|----------|----------|----------|----------|----------|----------|----------|----------|----------|----------|----------|----------|----------|----------|----------|----------|----------|----------|----------|
| 손 흥 민 | 0.017234 | 0.024518 | 0.041918 | 0.065967 | 0.092902 | 0.07819  | 0.112277 | 0.090015 | 0.090111 | 0.149293 | 0.243138 | 0.254212 | 0.274878 | 0.247136 | 0.30239  | 0.33027  | 0.337577 | 0.29984  | 0.1372   | 0.514804 | 0.420093 | 0.217942 | 0.12381  | 4.465713 |
| 박 지 성 | 0.007997 | 0.009899 | 0.004459 | 0.025987 | 0.030348 | 0.039806 | 0.065671 | 0.065545 | 0.046907 | 0.06417  | 0.026718 | 0.04479  | 0.018898 | 0.03488  | 0.036714 | 0.071321 | 0.06806  | 0.035761 | 0.015886 | 0.066684 | 0.072857 | 0.04036  | 0.028571 | 0.92229  |
| 호 날 두 | 0.003154 | 0.008833 | 0.029654 | 0.026987 | 0.026013 | 0.063973 | 0.030364 | 0.025927 | 0.062954 | 0.051074 | 0.026718 | 0.032684 | 0.020616 | 0.009783 | 0.016021 | 0.029626 | 0.043558 | 0.053641 | 0.307616 | 0.024006 | 0.137964 | 0.036324 | 0.206349 | 1.27384  |
| 메 시   | 0.005069 | 0.012944 | 0.036343 | 0.021989 | 0.026632 | 0.0263   | 0.028952 | 0.023305 | 0.082705 | 0.060241 | 0.040078 | 0.033895 | 0.029206 | 0.014888 | 0.027369 | 0.046084 | 0.065337 | 0.03301  | 0.218075 | 0.026674 | 0.085259 | 0.060539 | 0.257143 | 1.262037 |
| 토 트 넘 | 0.005069 | 0.017361 | 0.007804 | 0.016492 | 0.019819 | 0.0263   | 0.028246 | 0.018935 | 0.033329 | 0.047145 | 0.064124 | 0.081106 | 0.154619 | 0.079968 | 0.114815 | 0.084488 | 0.059893 | 0.057767 | 0.020219 | 0.05068  | 0.049605 | 0.024216 | 0.063492 | 1.125491 |
| 리 버 풀 | 0.003604 | 0.011574 | 0.008027 | 0.012994 | 0.00991  | 0.024879 | 0.03107  | 0.012235 | 0.034563 | 0.043216 | 0.034734 | 0.053263 | 0.065283 | 0.073588 | 0.125495 | 0.079002 | 0.055809 | 0.031634 | 0.043326 | 0.005335 | 0.054256 | 0.004036 | 0.015873 | 0.833706 |
| 이 강 인 | 0.001352 | 0.001827 | 0.00223  | 0.003498 | 0.011768 | 0.001422 | 0.007768 | 0.111864 | 0.040735 | 0.019644 | 0.04275  | 0.02179  | 0.001718 | 0.148452 | 0.029371 | 0.054862 | 0.108896 | 0.270956 | 0.083764 | 0.181382 | 0.09301  | 0.573106 | 0.304762 | 2.116924 |        
      
*손흥민(4.47) > 이강인(2.12) > 호날두(1.27) > 메시(1.26) > 토트넘(1.13) > 박지성(0.92) > 리버풀(0.83)     
순서로 중요도를 표현하였다.*

2번 방법이 네트워크 시각화에서는 각 단어들 간의 연결관계가 어떠한지 알게 되었다면   
3번 TF-DI를 통해서는 어떤 단어가 더 중요한 단어인지 알 수 있습니다.    
    그리고 추가로 최근 날짜에 가까워질수록 가중치가 커지기 때문에 최근 트렌드를 반영한
    중요도라고 할 수 있습니다. 
                
## 분석 결과 활용(자동화X)             
         
- 네이버 open api를 활용하여 뉴스 검색        
           
   [최근 100개의 뉴스를 검색하여 저장](https://github.com/kmseob/ab12/blob/master/DC%20INSIDE/FIANL/NAVERNEWS_API%20%26%20Send%20email.R)                 
- 뉴스 검색 결과      
     
  [이강인에 대한 검색 결과](https://github.com/kmseob/ab12/blob/master/DC%20INSIDE/FIANL/news_send_email/DC_news.csv)



- 결과를 메일로 받기    
         
  [r에서 자동으로 메일 보내기_코드](https://github.com/kmseob/ab12/blob/master/DC%20INSIDE/FIANL/NAVERNEWS_API%20%26%20Send%20email.R)               
     
![222](https://user-images.githubusercontent.com/49008643/59378596-a59ed380-8d8f-11e9-9469-9e4e0a8deddd.JPG)    
    
   
## 짧은 소감

모르는게 많아 어려운 학기였지만, 그래서 공부를 많이하게 되었고 뒤돌아 보니 남은게 많은 것 같습니다.      
내가 데이터를 만들고, 그걸 분석하고 있으니 뭐라도 된 것 같아서 재밌게 했습니다.     
큰 일이 있지 않는 이상 종강 후에도 계속 하려고 생각하고 있습니다.      
  
지금까지 DC INSIDE 데이터 수집과 분석까지의 과정을 봐주셔서 감사합니다!

