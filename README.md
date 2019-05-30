# 디시인사이드  
디씨인사이드 갤러리별 게시글들을 수집하여 데이터를 만드려고합니다.

## 수집할 데이터
![1](https://user-images.githubusercontent.com/49008643/56280869-189c1d00-6146-11e9-97cf-b4af86e4119f.JPG)

디시인사이드는 주제별 게시판의 집합체인 사이트입니다.  
디시인사이드 갤러리 (dcinside.com)에는 매일 70만개 이상의 게시글, 150만개 이상의 댓글이 작성되는 사이트입니다. 
수 많은 주제로 나뉜 게시판(**해외축구, 국내야구, 각종 게임등등**)에 많은 사람들이 게시글과 댓글을 작성합니다.
그래서 이 사이트에서 생성되는 데이터를 활용하여 무엇을 할 수 있을까 생각해 보았다.

## 수집한 데이터 활용방법

1. 생각하는 것은 개인이 관심을 가지고 있는 분야와 관련 있는 갤러리의 데이터를 매 시간 수집한다. 
수집하다보면 어느순간 게시글의 수가 급상승하는 때가 있을 것이다.
그 때는 갤러리와 관련된 어떤 일이 발생하였기 때문에 자연스럽게 게시글 수가 상승한 것이라고 판단하여 
갤러리 관련 키워드를 네이버 뉴스에 검색하여 결과를 보내주는 시스템을 만들어 보고자 한다. 

***예) 디씨인사이드 해외축구 갤러리 게시글 급상승 -> 네이버뉴스 검색 -> 챔피언스리그 8강 경기 2차전***

2. 특정 고정닉네임, 유동IP를 사용하는 사람들이 자주 접속하는 갤러리의 정보를 통해 광고나 추천영상 등을 제공할 수 있을것이라고 생각하지만
제가 직접하기는 어려움이 있을 것 같습니다.

## 수집한 데이터가 유용하다고 생각하는 이유
지금 인터넷 상에는 데이터가 너무나 많고, 끊임없이 새로운 데이터가 생성 되고 있기 때문에 자기가 원하는 정보만 얻기란 쉽지 않고, 취미나 유흥거리에 집중하고 살기에는 삶이 너무 바쁘다고 생각한다. 그런 바쁜 사람들에게 프로그램이 스스로 정보를 제공하는 기능은 정말 편한 기능일 수 있다. 생각한대로 만들기만 한다면 분명 유용한 프로그램이 될 것이라고 생각합니다.

### 지금까지 과정

1. 갤러리 게시판에 작성된 글의 제목 / 닉네임 / 작성날짜 를 수집한다.

2. 모든 갤러리의 당일 데이터를 모두 수집하여 저장한다. ex) gall-"갤러리명"-"오늘 날짜".csv

3. taskscheduler 패키지를 활용하여 매일 매일 데이터를 수집한다.
![sdfsdfsdfs](https://user-images.githubusercontent.com/49008643/57388683-ac1bb780-71f3-11e9-922b-8495d0f4c593.JPG)



### 수집한 데이터를 활용하여 분석

1. 데이터를 통해 특정 날에 대한 사람들의 관심사 및 갤러리에서 주된 관심사의 트렌드를 알아 보고자 합니다.

2. 빈도 분석  

[코드](https://github.com/kmseob/ab12/blob/master/DC%20INSIDE/text%20mining%20(Practice)/KoNLP%26wordcloud2.R)  

[결과](https://github.com/kmseob/ab12/tree/master/DC%20INSIDE/text%20mining%20(Practice)/twice/frequency%20csv)

3. 연결정도 중심성을 바탕으로 네트워크 시각화 결과

[코드](https://github.com/kmseob/ab12/blob/master/DC%20INSIDE/text%20mining%20(Practice)/KoNLP%26wordcloud2.R)  

[결과](https://github.com/kmseob/ab12/tree/master/DC%20INSIDE/text%20mining%20(Practice)/twice/wordcloud/5_19)

4. TF- DI(Term Frequency - Date Index)를 활용한 미래의 트랜드를 분석


##############빈도수(비율에 대해서 생각해보기)
분석을 활용한 결과 조금 더 
read.me 에 조금 더 자세하게 적을 것
텍스트마인이 그림그릶나한 다른 툴을 찾아봐라
