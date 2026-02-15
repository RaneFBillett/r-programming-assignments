#defining matrices
A <- matrix(1:100,  nrow = 10)
B <- matrix(1:1000, nrow = 10)

#showing the dimensions of both matrices
dim(A)
dim(B)

#showing the determinant of A
det(A)

#the code is halted when you try solve a and b without help, i want the error message displayed so i did this:
errorMessageA <- tryCatch(solve(A), error = function(e) e)
errorMessageA

errorMessageB1 <- tryCatch(solve(B), error = function(e) e)
errorMessageB1

#the determinant also causes an error for B so I did the same thing as above
errorMessageB2 <- tryCatch(det(B), error = function(e) e)
errorMessageB2