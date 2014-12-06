#Week 2 Quizz

#Question 3
f <- function(x){
    g <- function(y){
        y + z
    }
    z <- 4
    x + g(x)
}
z <- 10
f(3)

#Question 4
x <- 5
y <- if(x<3){
    NA
}else{
    10
}

y

