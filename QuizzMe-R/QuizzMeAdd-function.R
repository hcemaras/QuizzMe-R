QuizzMeAdd=function(english,turkish)
{
    #Okut
    QuizzMe_Words=read.csv("data.quizzme",fileEncoding = "UTF-8",stringsAsFactors = FALSE)
    #Ekle
    QuizzMe_Words=rbind(QuizzMe_Words,c(english,turkish,1,1))
    #Kaydet
    write.csv(QuizzMe_Words,"data.quizzme",row.names = F,fileEncoding = "UTF-8" )
}