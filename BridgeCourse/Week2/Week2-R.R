calc_factorial <- function(param1)
{
  if(!is.numeric(param1)){
    print("Please enter numeric value");
    return();
  }
  if(param1 < 0){
    print("Please enter positive numeric value");
    return();
  }
  y <- 1;
  for(i in param1:1){
      y <-y*i;
  }
  return(y);
}

calc_choose <- function(input1, input2)
{
  if(!is.numeric(input1) || !is.numeric(input2)){
    print("Please enter numeric values");
  }
  else if(input1 < 0 || input2 < 0){
    print("Please enter positive numeric value.");
  }
  else if(input1 < input2){
    print("As input 1 is less than input 2 , the answer is 0");
  }
  else{
  value1 <- calc_factorial(input1);
  value2 <- calc_factorial(input1 - input2);
  value3 <- calc_factorial(input2);
  sprintf("%i choose %i is: %i",input1, input2, value1 / (value3 * value2)); 
  }
}

calc_choose(10, 13);




