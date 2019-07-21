# R_study

## KoNLP를 활용한 Sentiment analysis (2019-07-22)

* 파일: Google drive > Bioinformatics > R > Sentiment > Sentiment_analysis.r
* 참고자료
  * 감성분석 건국대학교 통계학과 백광렬 - 2018 빅데이터 청년인재 (https://rpubs.com/baekdata/gabs)
  * KNU(케이앤유) 한국어 감성사전 (https://github.com/park1200656/KnuSentiLex)
* required package: KoNLP, rvest, stringr, RHINO, easySenti
* required file: 군산대학교 KNU 한국어 감성사전(SentiWord_Dict.csv), 긍정어 단어 pool (pos_pol_word.txt", 부정아 단어 pool (neg_pol_word.txt)
* ASK2019 대비 본과2학년 알레르기면역 블럭강의 학생 평가 결과에 대한 sentiment analysis

* 학생들의 평가결과를 read.table or read.csv로 읽어들이는데 에러가 나서, 그냥 말뭉치로 데이터를 입력해버렸음

* eastSenti package를 통해 positive vs negative에 대한 sentiment analysis를 시행
* rpub.com R code로 분석한 결과는 항상 중립으로 결과가 나옴. 오류가 있나?



  
