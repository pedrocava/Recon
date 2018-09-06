demand = function(q, p_0, a, b) {
 p_0 + a*q + b*q^2
}

cost1 = function(q1, q0_1, c1, c1_2){
  q0_1 + c1*q1 + c1_2 * q1
  
}

cost2 = function(q2, q0_2, c2, c2_2){
  q0_2 + (c2*q2) + (c2_2 * q2)
  
}