multiply = function(a,b) {
  force(a)
  force(b)
  function(x){a(x)*b(x)}
}