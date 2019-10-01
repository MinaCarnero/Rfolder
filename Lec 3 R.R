data("mtcars")
head(mtcars,n=10)
tail(mtcars,n=10)
str(mtcars)
head(iris)
a=c(1:10)
a
d="duck"
d
str(a)
# integers are called with the str function. 
str(d)
g=c("duck", "duck", d, "goose")
g
NA
#NA are missing value
head(mtcars, n=NULL)
head(mtcars)
mtcars2=mtcars
mtcars2
head(mtcars2)
mtcars$carb
# el signo $ es para que aparezcan las opciones de las categorias que tiene esa data set
mtcars2carb=NULL
head(mtcars2)
2*1025
#NaN
0/0
class(a)
class(mtcars$mpg)
typeof(mtcars$mpg)
str(mtcars)
typeof(mtcars$gear)
a=c(1:10)
c(1:10)=a
a
c(1:15)=a
c(1:15)->a
a
?c()
c=5
c(c,6.7.8)
c(c,6,7,8)
#esta incluyendo el 5 en ese grupo, xq ya asignaste que c vale 5 y ahora aumentas 6 7 y 8
1+5*2
(1+5)*2
%%
41%%21
# cuando pones %% va a dividir esos numeros pero como no dan un numero exact va a dividir los numeros enteros mas cercanos con el cociente exacto
"%myop%"=function(a,b)(2*a+2*b)
1 %myop% 1
# entonces los valores que pongas a los lados son los que estaran involucrados en la funcion. el de la izquierda es a y el de la derecha es b
# basicamente estas fabricando tus operadores
"%bacon%"=function(x,y)(x+10*y)
3 %bacon% 5
f=function(){x=1;y=2;z=3;x+y+z}
f()
f(3)
#aditional statements
#conditional statements
typeof('if')
rm(z)
x>z
if(FALSE)"this will not be printed" else"this will be printed"
t=10
s=c(8,10,12,3,17)
s
if (t<s) t else s
# this was an example of a mismatch
# use a double equal sign == if you are trying to find if your conditioon is TRUE
switchero.if.then=function(x){
if(x=="a") 
  "camel"  
else if (x == "b") 
  "bear"
else if (x == "c")
  'alligator'
else 
  'moose'
}
