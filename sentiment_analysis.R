install.packages("KoNLP")
install.packages("rvest")
install.packages("stringr")
#install.packages("RHINO")
if(!require(RHINO)) {install_github("SukjaeChoi/RHINO"); library(RHINO)}


library(rJava)
library(KoNLP)
library(rvest)
library(stringr)

install.packages("rJava")
Sys.setenv(JAVA_HOME="C:/Program Files/Java/jdk-11.0.4/")

knu = read.csv("G:/SentiWord_Dict.csv", header=FALSE, sep='\t', encoding='UTF-8')
head(knu)

doc <- read.txt("G:/result.txt")

url="https://news.naver.com/main/ranking/read.nhn?mid=etc&sid1=111&rankingType=popular_day&oid=003&aid=0008737816&date=20180802&type=1&rankingSeq=8&rankingSectionId=100" # URL
page <- read_html(url,encoding = "euc-kr") # 인코딩 확인하기 
doc <- page%>%html_nodes("#articleBodyContents")%>%html_text()
doc

mode(doc)

#doc <- "대락적으로 적당하다. 잘 가르쳐주셨습니다. 이런 단기간에 이 양을 수업하시느라 고생하셨겟습니다. 반복적으로 복습이 되서 좋았습니다. 깔끔했습니다. 감사합니다. 감사합니다. 알레르기를 재밋게 배울수있었습니다. 강의를 잘하시는 교수님들이 많으셨다. 모르겠다. 본2 첫과목에 빡빡하지않은 과목이어서 만족스러웠습니다. 교수님께서 열정적으로 가르쳐주셔서 감사했다. 넘 좋아요. 수업시수가 적어 부담이 덜했다. 알레르기를 배울수 있었습니다. 잘가르쳐주셔서감사합니다. 특히 강민규교수님 설명을 조곤조곤 잘해 주셔서 너무 좋았어요. 알레르기를 배웠습니다. 일상에서 흔히보는 아토피나 알러지에 대한 지식이라서 좋았습니다. 김지현 교수님 증례토의때 일어나서 발표시키는게 아니고 직접 오셔서 저희 얘기 들어주실 때 틀릴까봐 긴장되는것도 덜하고 모르는거 질문할 수 있어서 좋았어요. 좋았습니다. 증례토의가 이해에 도움이 되었다. 알레르기에대해 알수있어서 좋았습니다. 감사합니다. 감사드립니다. 대락적으로 적당했다. 최인아 교수님 강의록이 너무 보기 어렵습니다. 감사합니다. 소그룹토의를 강의실에서 해도 될것같습니다. 지금도좋습니다. 류마티스가 양이 너무 많다. 류마티스 부분이 너무 많습니다. 양을 조절해주셔서 전달해주셨르면 합니다. 류마티스가 후반에 몰아치니까 외울게 너무 많아요. 최인아 교수님 말을 너무 빨리하시는데 조금 여유를 가지고 수업해주셨으면 좋겠습니다 ㅠㅠ 이미 아는 내용을 다시한번 강의해주시는 속도처럼 너무 빨리 진행되는거 같습니다. 류마티스내과 강의양이 많은데 비교적 뒤에해서 공부하기가 힘들었습니다. 시험 전 날에 정리할 수 있는 시간을 좀 더 주셨으면 좋겠습니다. 감사합니다. 좋은수업 감사드립니다. 레포트 등의 평가요소 추가. 최인아 교수님 말이 너무 빠르셔요 ㅠㅠ. 모르겠다.  내용이 많이 겹치는데 정리할 수 있는 파일이 있었으면 합니다. 동일 질환에 대해서 치료에 대해서 같은 강의록으로 수업 주셨으면 좋을것 같다. 넘조아요. 겹치는 부분에 있어서 교수님들의 설명이 일치했으면 덜 헷갈릴것같다. 특별히 없습니다. 시험 전날에있는수업을 좀당겨서하면좋겠어요ㅜㅜ. 너무양이많습니다. 양좀 줄여주세요. 최인아 교수님 제발 강의양좀 줄여주셨으면 좋겠습니다. 좋았습니다.알레르기 질환수업과 류마티스 질환수업이 섞여있어서 두 카테고리를 구분하는데 힘들었습. 수업속도가 느려졌으면 좋겠다. 공부시간 이 넉넉했으좋겠습니다. 순서가 뒤죽박죽이에요.감사합니다. 감사합니다."
doc <- "류마티스가 양이 너무 많다. 류마티스 부분이 너무 많습니다. 양을 조절해주셔서 전달해주셨르면 합니다. 류마티스가 후반에 몰아치니까 외울게 너무 많아요. 최인아 교수님 말을 너무 빨리하시는데 조금 여유를 가지고 수업해주셨으면 좋겠습니다 ㅠㅠ 이미 아는 내용을 다시한번 강의해주시는 속도처럼 너무 빨리 진행되는거 같습니다. 류마티스내과 강의양이 많은데 비교적 뒤에해서 공부하기가 힘들었습니다. 시험 전 날에 정리할 수 있는 시간을 좀 더 주셨으면 좋겠습니다. 감사합니다. 좋은수업 감사드립니다. 레포트 등의 평가요소 추가. 최인아 교수님 말이 너무 빠르셔요 ㅠㅠ. 모르겠다.  내용이 많이 겹치는데 정리할 수 있는 파일이 있었으면 합니다. 동일 질환에 대해서 치료에 대해서 같은 강의록으로 수업 주셨으면 좋을것 같다. 넘조아요. 겹치는 부분에 있어서 교수님들의 설명이 일치했으면 덜 헷갈릴것같다. 특별히 없습니다. 시험 전날에있는수업을 좀당겨서하면좋겠어요ㅜㅜ. 너무양이많습니다. 양좀 줄여주세요. 최인아 교수님 제발 강의양좀 줄여주셨으면 좋겠습니다. 좋았습니다.알레르기 질환수업과 류마티스 질환수업이 섞여있어서 두 카테고리를 구분하는데 힘들었습. 수업속도가 느려졌으면 좋겠다. 공부시간 이 넉넉했으좋겠습니다. 순서가 뒤죽박죽이에요.감사합니다. 감사합니다."


words.pa <- function(doc)
{
  doc <- as.character(doc)
  doc2 <- paste(SimplePos22(doc))
  doc3 <- str_match(doc2, "([가-힣]+)/(PA)")
  doc4 <- doc3[,2]
  doc4[!is.na(doc4)]
}

words.nc <- function(doc)
{
  doc <- as.character(doc)
  doc2 <- paste(SimplePos22(doc))
  doc3 <- str_match(doc2, "([가-힣]+)/(NC)")
  doc4 <- doc3[,2]
  doc4[!is.na(doc4)]
}

words.pv <- function(doc)
{
  doc <- as.character(doc)
  doc2 <- paste(SimplePos22(doc))
  doc3 <- str_match(doc2, "([가-힣]+)/(PV)")
  doc4 <- doc3[,2]
  doc4[!is.na(doc4)]
}

### 명사추출
doc.nc=words.nc(doc)
doc.nc

### 형용사추출 
doc.pa=words.pa(doc)
doc.pa

### 동사추출 
doc.pv=words.pv(doc)
doc.pv

### 중복 삭제 
doc.nc=unique(doc.nc)
doc.pa=unique(doc.pa)
doc.pv=unique(doc.pv)

doc.pa.df=as.data.frame(doc.pa)
write.csv(doc.pa.df,"g:/data/doc.pa.csv",fileEncoding = "EUC-KR")
doc.pa.df

doc.nc.df=as.data.frame(doc.nc)
write.csv(doc.nc.df,"g:/data/doc.nc.csv",fileEncoding = "UTF-8")

doc.pv.df=as.data.frame(doc.pv)
write.csv(doc.pv.df,"g:/data/doc.pv.csv",fileEncoding = "UTF-8")

setwd("g:/")

positive <- readLines(file("g:/data/pos_pol_word.txt", encoding = "UTF-8"))
positive
positive=positive[-1]

negative <- readLines(file("g:/data/neg_pol_word.txt", encoding = "UTF-8"))
negative
negative=negative[-1]

txt <- readLines(file("g:/result.txt",encoding = "UTF-8"))
txt <- doc
pos=SimplePos22(txt)
pos

pos.vec=unlist(pos)
pos.vec

pos.vec<-gsub("[[:alpha:]]","",pos.vec) # 영어 삭제
pos.vec

pos.vec<-gsub("/","",pos.vec) # /삭제
pos.vec

pos.vec<-gsub("[+ㄱㄴ]","",pos.vec) # +,ㄱ,ㄴ삭제
pos.vec

pos.matches.num<-match(pos.vec,positive) # 긍정어 벡터 번호
neg.matches.num<-match(pos.vec,negative) # 부정어 벡터 번호 

pos.matches.num 
neg.matches.num

pos.matches <- !is.na(pos.matches.num)
neg.matches <- !is.na(neg.matches.num)

pos.sum=sum(pos.matches)
neg.sum=sum(neg.matches)
pos.sum ; neg.sum

result <- pos.sum-neg.sum

if(result>0){
  print("긍정")
}else if(result==0){
  print("중립")
}else{
  print("부정")
}

sigmoid <- function(x){
  1/(1+exp(-x))
}

x=seq(from=-5,to=5,by=0.1)
plot(x,sigmoid(x),col="red")



library(devtools)
install_github("SukJaeChoi/easySenti")
library(easySenti)


positive <- readLines(file("g:/data/pos_pol_word.txt", encoding = "utf-8"))
positive=positive[-1]
positive

negative <- readLines(file("g:/data/neg_pol_word.txt", encoding = "utf-8"))
negative=negative[-1]
negative

#docs <- readLines(file("g:/result.txt",encoding = "utf-8"))
doc <- "대락적으로 적당. 열심히 가르쳐주셔서 감사드립니다. 감사합니다. 수업별로 조금씩 연결이 돼서 도움이 됐습니다. 수업시간이적어서 좋았습니다. 잘모르겠다. 잘 가르쳐주셨습니다. 이런 단기간에 이 양을 수업하시느라 고생하셨겟습니더. 반복되는 복습. 깔끔했습니다. 감사합니다. 감사합니다. 알레르기를 재밋게 배울수있었습니다. 출석체크자주해서 비중높이는것. 강의를 잘하시는 교수님들이 많으셨다. 모르겠다. 본2첫과목에 빡빡하지않은 과목이어서 만족스러웠습니다. 교수님께서 열정적으로 가르쳐주셔서 감사했다. 넘조아요. 수업시수가 적어 부담이 덜했다,. 알레르기를 배울수 있었습니다. 잘가르쳐주셔서감사합니다 특히 강민규교수님 설명조곤조곤잘해주셔서 너무좋았어요. 알레르기를 배웠습니다. 일상에서흔히보는 아토피나 알러지에 대한 지식이라서 좋았습니다. 김지현 교수님 증례토의때 일어나서 발표시키는게 아니고 직접 오셔서 저희 얘기 들어주실 때 틀릴까봐 긴장되는것도 덜하고 모르는거 질문할 수 있어서 좋았어요. 좋았습니다. 증례토의가 이해에 도움이 되었다. 알레르기에대해 알수있어서 좋았습니다. 증례토의. 감사합니다. 감사드립니다. 대락적으로 적당. 최인아 교수님 강의록이 너무 보기 어렵습니다. 감사합니다. 소그룹토의를 강의실에서 해도 될것같습니다. 지금도좋습니다. 류마티스가 양이너무많다. 류마티스부분이 너무 많습니다. 양을 조절해주셔서 전달해주셨르면 합니다. 류마티스가 후반에 몰아치니까 외울게 너무 많아요. 최인아 교수님 말을 너무 빨리하시는데 조금 여유를 가지고 수업해주셨으면 좋겠습니다 ㅠㅠ 이미 아는 내용을 다시한번 강의해주시는 속도처럼 너무 빨리 진행되는거 같습니다. 류마티스내과 강의양이 많은데 비교적 뒤에해서 공부하기가 힘들었습니다. 시험 전 날에 정리할 수 있는 시간을 좀 더 주셨으면 좋겠습니다. 감사합니다. 좋은수업 감사드립니다. 레포트 등의 평가요소 추가. 최인아 교수님 말이 너무 빠르셔요 ㅠㅠ. 모르겠다.  내용이 많이 겹치는데 정리할 수 있는 파일이 있었으면 합니다. 동일 질환에 대해서 치료에 대해서 같은 강의록으로 수업 주셨으면 좋을것 같다. 넘조아요. 겹치는 부분에 있어서 교수님들의 설명이 일치했으면 덜 헷갈릴것같다. 특별히 없습니다. 시험 전날에있는수업을 좀당겨서하면좋겠어요ㅜㅜ. 너무양이많습니다. 양좀 줄여주세요. 최인아 교수님 제발 강의양좀 줄여주셨으면 좋겠습니다. 좋았습니다.알레르기 질환수업과 류마티스 질환수업이 섞여있어서 두 카테고리를 구분하는데 힘들었습. 수업속도가 느려졌으면 좋겠다. 공부시간 이 넉넉했으좋겠습니다. 순서가 뒤죽박죽이에요.감사합니다. 감사합니다."

easySenti(doc,positive,negative)
easySenti(doc,positive,negative,t=3) # 3초과 긍정 
easySenti(doc,positive,negative,sigmoid = TRUE) # 시그모이드, 경계값 0.3
easySenti(doc,positive,negative,sigmoid = TRUE, t.s=0.5) # 시그모이드, 경계값 0.5
