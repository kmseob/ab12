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
갤러리 관련 키워드를 네이버 뉴스에 검색하여 결과를 보내주는 시스템을 만들어 보고자 한다. 


## 수집한 데이터가 유용하다고 생각하는 이유

지금 인터넷 상에는 데이터가 너무나 많고, 끊임없이 새로운 데이터가 생성 되고 있기 때문에 자기가 원하는 정보만 얻기란 쉽지 않고, 
취미나 유흥거리에 집중하고 살기에는 삶이 너무 바쁘다고 생각한다. 
그런 바쁜 사람들에게 프로그램이 스스로 정보를 제공하는 기능은 정말 편한 기능일 수 있다. 


## 데이터

[데이터]() 수집 기간 : 5월 18일 ~ 6월 11일 총 25일 간 
전체 파일 크기 : 82.1mb 
갤러리 : 70개의 갤러리 
가져온 정보 : 게시글 제목 / 작성자 / 작성자의 IP / 날짜 

***꾸준히 모아온 데이터가 대부분 텍스트 위주로 구성되어 있기 때문에 텍스트 마이닝을 활용해서 분석을 시도***

## 분석 방법과 결과

1. 빈도 분석  
 
- 빈도수를 csv 파일로 저장 
 
[빈도수 파일 저장 리스트](https://github.com/kmseob/ab12/tree/master/DC%20INSIDE/FIANL/final%20test%20data(%EB%B6%84%EC%84%9D%EA%B2%B0%EA%B3%BC)/1%EB%B9%88%EB%8F%84%EB%B6%84%EC%84%9D) 

 
  
  
- [빈도 표](https://github.com/kmseob/ab12/blob/master/DC%20INSIDE/FIANL/final%20test%20data(%EB%B6%84%EC%84%9D%EA%B2%B0%EA%B3%BC)/1%EB%B9%88%EB%8F%84%EB%B6%84%EC%84%9D/table.csv#L1)
 
 
 
 
- 절대적 빈도수 비교 곡선 - 가장 많이 등장한 단어를 선택하여 빈도수
 
![graph](https://user-images.githubusercontent.com/49008643/59378651-c6672900-8d8f-11e9-8f82-84aad028ace0.JPG) 
 
 
 
 
 
 
 
 
2. 연결정도 중심성을 바탕으로 네트워크 시각화 

-[코드](https://github.com/kmseob/ab12/blob/master/DC%20INSIDE/FIANL/KoNLP%26wordcloud2.R) 
 
 
 
 
-네트워크 시각화 
 
 
![22222222](https://user-images.githubusercontent.com/49008643/59378838-3ecdea00-8d90-11e9-98c6-093b71612076.JPG) 





-바이그램을 활용 
 
![111111111](https://user-images.githubusercontent.com/49008643/59378862-48575200-8d90-11e9-8003-2cb683b68b27.JPG) 
 
 
 
 
 
 
 
3. TF-DI를 활용한 트렌드 분석과 키워드의 중요도
 
- TF-DI 계산방법 
 
![12](https://user-images.githubusercontent.com/49008643/59378580-9b7cd500-8d8f-11e9-94cc-6b53cfc82d9e.JPG) 
 
  
  


## 분석 결과 활용

- 결과를 메일로 받기
![222](https://user-images.githubusercontent.com/49008643/59378596-a59ed380-8d8f-11e9-9469-9e4e0a8deddd.JPG)


## 
