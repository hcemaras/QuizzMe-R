#QuizzMe
QuizzMe=function(n=1)
{
  for(i in 1:n){
  #İçe Aktar
  QuizzMe_Words=read.csv("data.quizzme",fileEncoding = "UTF-8",stringsAsFactors = FALSE)
  
  #Question
  q=sample(x = QuizzMe_Words$English, size=1, prob = (QuizzMe_Words$Fail/QuizzMe_Words$Total))
  cat("\n");cat("================================================");cat("\n")
  cat(c("        Your word is:",q));cat("\n")
  cat("================================================");cat("\n")
    #Which one is Chosen?
  w=q==QuizzMe_Words$English
  #Answer
  r=QuizzMe_Words$Turkish[w]
  #Options
  o=sample(c(r,sample(x = QuizzMe_Words$Turkish[-w], size=3, prob = (QuizzMe_Words$Fail[-w]/QuizzMe_Words$Total[-w]))),size=4)
  "Your Options are:";cat(c("1) ",o[1],"        "));cat(c("2) ",o[2]));cat("\n");cat(c("3) ",o[3],"        "));cat(c("4) ",o[4]))
  
  #Input Functions
  answer=function()
  { 
    n <- readline(prompt="Write to Order of Correct Answer: ")
    return(as.integer(n))
  }
  answer2=function()
  { 
    n <- readline(prompt="You have to Write a number between 1 to 4. Your answer is: ")
    return(as.integer(n))
  }
  #User's Answer
  u=answer()
  
  if (u<5&u>0) {cat(c("Your Answer is:",o[c(u)]));cat("\n")
  } else {
    u=answer2()
    if (u<5 & u>0) {
    cat(c("Your Answer is:",o[c(u)]));cat("\n")
    }else
    {cat("This is your last chance!");u=answer();
    
    }}
  #Check
  if ((o[as.numeric(u)])==(r)) {cat("Correct! You are amazing.");cat("\n")
    QuizzMe_Words$Total[w]=QuizzMe_Words$Total[w]+1
  } else {
    cat("Oh God! Wrong Answer");cat("\n")
    cat(c(q," is: ",r));cat("\n")
    QuizzMe_Words$Fail[w]=QuizzMe_Words$Fail[w]+1
    QuizzMe_Words$Total[w]=QuizzMe_Words$Total[w]+1}
  #Dışa Aktar' write.csv(QuizzMe_Words.xls)
  write.csv(QuizzMe_Words,"data.quizzme",row.names = F,fileEncoding = "UTF-8" )
  }
  i=i+1}