#Question 1 - Factorial of a number. 

cal_factorial <- function(param1)
{
  if(!is.numeric(param1)){
    print("Please enter numeric value");
  }
  else if(param1 < 0){
    print("Please enter positive numeric value");
  }
  else{
    y <- 1;
    for(i in param1:1){
      y <-y*i;
    }
    sprintf("%i factorial is %i", param1, y); 
  }
}
#Calling above function
cal_factorial(12);

#----------------------------------------------

#Question 2 : Sequence generator
seq_generator <-  function(start_seq, end_seq, by_value){
  if(!is.numeric(start_seq) || !is.numeric(end_seq) || !is.numeric(by_value)){
    print("Please enter numeric inputs");
  }
  else{
    vect_seq <- c(start_seq);
    last_seqnum <- end_seq;
    curren_seq <- start_seq;
    while (curren_seq < end_seq && end_seq >= curren_seq + by_value) {
      curren_seq <- curren_seq + by_value;
      vect_seq[length(vect_seq)+1] <- curren_seq;
    }
    vect_seq;
  }
}

#Calling function for sequence of 20 to 50 by 5
seq_generator(20, 50, 5);

#------------------------------------------
#Question 2 : An alternative by using built-in function "seq"
#Just out of curiosity, I searched for an easy way, and I saw the below function
#Reference : https://stat.ethz.ch/R-manual/R-devel/library/base/html/seq.html
seq(from = 20, to = 50 , by = 5)

#--------------------------------------------
#Question 3 : Quadratic equation solver

#quad_solver accepts a numeric vector input of size 3 (a, b, c) each will 
#represent aX^2 + bX + c
quad_solver <- function(input_vect){
  if(!is.vector(input_vect) || !is.numeric(input_vect)){
    print("Please enter a numeric vector of size 3")
  }
  else if(length(input_vect) != 3){
    print("Please input a vector of size 3")
  }
  else{
    a <- input_vect[1];
    b <- input_vect[2];
    c <- input_vect[3];
    sprintf("The quadratic equation you want to solve is %ix^2+%ix+%i", a, b, c);
    discriminant <- b^2 - (4 * a * c);
    discriminant;
    if(discriminant < 0){
      print("Your equation has imaginary roots and this calculator doesnt calculate imaginary roots");
    }
    else if(discriminant == 0){
      root <- -b / (2 * a);
      sprintf("Root : X = %f", root);
    }
    else if(discriminant > 0){
      root1 <- (-b + sqrt(b^2 - (4 * a * c))) / (2 * a);
      root2 <- (-b - sqrt(b^2 - (4 * a * c))) / (2 * a);
      sprintf("Roots : X1 = %f , X2 = %f", root1, root2);
    }
  }
}
#Calling above function
quad_solver(c(1, 3, 2))




