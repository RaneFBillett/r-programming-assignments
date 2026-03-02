#creating the dataset
studentData <- data.frame(
  studentID = 1:5,
  name = c("Rane", "Ren", "Youme", "Kitty", "Paula"),
  grade = c("A","B","C","D","F")
)

#exploring the dataset
class(studentData)
str(studentData)
summary(studentData)
head(studentData)

#S3 addition
class(studentData) <- c("studentS3","data.frame")
str(studentData)

print.studentS3 <- function(x, ...) { 
  cat("Student information dataset (S3 Object)\n") 
  cat("Number of students:", nrow(x), "\n") 
  print(unclass(x)) 
}

print(studentData)

#s4 addition
setClass( "StudentData", slots = list( df = "ANY" ) ) 
studentObject <- new("StudentData", df = studentData) 

setMethod( "show", "StudentData", function(object) 
  { 
  cat("Student information dataset (S4 Object)\n") 
  cat("Number of students:", nrow(object@df), "\n\n") 
  print(object@df) 
  } 
)

studentData

#s3 second example

summary.studentS3 <- function(object, ...) {
  cat("\n=====================================\n")
  cat("Summary of Student Grades (S3 Object)\n") 
  cat("=====================================\n") 
  print(table(object$grade)) 
}

summary(studentData)

#s4 second example
setClass( "StudentGrade", slots = list( name = "character", grade = "character" ) )
grade1 <- new("StudentGrade", name = "Rane", grade = "A")

setMethod( "show", "StudentGrade", function(object) { 
  cat("Student Grade Record (S4 Object)\n") 
  cat("Name:", object@name, "\n") 
  cat("Grade:", object@grade, "\n") 
  } 
)

grade1