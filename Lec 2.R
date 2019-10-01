#This is a test file

R version 3.6.1 (2019-07-05) -- "Action of the Toes"
Copyright (C) 2019 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> setwd("C:/MINA/UL/Fall 2019/R Lab/Romina")
> setwd()
Error in setwd() : argument "dir" is missing, with no default
> setwd(dir)
Error in setwd(dir) : character argument expected
> setwd(C:/MINA/UL/Fall 2019/R Lab/Rominadir)
Error: unexpected '/' in "setwd(C:/"
> setwd("C:/MINA/UL/Fall 2019/R Lab/Romina")
> 
  > 2+5
[1] 7
> #we are going to assign a symbol to that equation
  > #try to use lowercase because then you forget what you capitalized
  > x<-2+5
> y=2+5
> # so <- and = are to say something is equals to a value
  > x
[1] 7
> y
[1] 7
> #to generate sequences of numbers
  > 1:10
[1]  1  2  3  4  5  6  7  8  9 10
> # assign an object to this sequence
  > z = 1:10
> # if you want to delete an object use rm() and write the name of the object in the braquets
  > rm(y)
> #so you will see in the environment panel that the object is not there anymore
  > #ARGUMENTS: we separate them using colons. 
  > #to know what an argument does use the function mean()
  > #actually, to know what does function does you will have to put ? before the name of the function
  > ?mean
> #so in the HELP tab you will see all what you need to now about this function and then you can use it
  > mean(x=z, trim=0.2,na.rm=T)
[1] 5.5
> mean(x=z,na.rm=T)
[1] 5.5
> ?rename
No documentation for ‘rename’ in specified packages and libraries:
  you could try ‘??rename’
> # so if it appears that the function is not specified you can use ?? to look for it in HELP
  > ??rename
> # in this case the package is not downloaded, so you will have to do it first
  > #INSTALL PACKAGES
  > install.packages("rlang")
WARNING: Rtools is required to build R packages but is not currently installed. Please download and install the appropriate version of Rtools before proceeding:
  
  https://cran.rstudio.com/bin/windows/Rtools/
  Installing package into ‘C:/Users/Romina/Documents/R/win-library/3.6’
(as ‘lib’ is unspecified)
trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.6/rlang_0.4.0.zip'
Content type 'application/zip' length 1090443 bytes (1.0 MB)
downloaded 1.0 MB

package ‘rlang’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
C:\Users\Romina\AppData\Local\Temp\RtmpOc7aD2\downloaded_packages
> # Go to Tools, Install packages and just type the name of your package and what you see before this comment means that you just downloaded the package
  > ?rename
No documentation for ‘rename’ in specified packages and libraries:
  you could try ‘??rename’
> ??rename
> install.packages("dplyr")
WARNING: Rtools is required to build R packages but is not currently installed. Please download and install the appropriate version of Rtools before proceeding:
  
  https://cran.rstudio.com/bin/windows/Rtools/
  Installing package into ‘C:/Users/Romina/Documents/R/win-library/3.6’
(as ‘lib’ is unspecified)
also installing the dependencies ‘backports’, ‘ellipsis’, ‘digest’, ‘zeallot’, ‘utf8’, ‘vctrs’, ‘cli’, ‘crayon’, ‘fansi’, ‘pillar’, ‘purrr’, ‘assertthat’, ‘pkgconfig’, ‘R6’, ‘Rcpp’, ‘tibble’, ‘tidyselect’, ‘BH’, ‘plogr’

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.6/backports_1.1.4.zip'
Content type 'application/zip' length 66819 bytes (65 KB)
downloaded 65 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.6/ellipsis_0.2.0.1.zip'
Content type 'application/zip' length 43626 bytes (42 KB)
downloaded 42 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.6/digest_0.6.20.zip'
Content type 'application/zip' length 223165 bytes (217 KB)
downloaded 217 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.6/zeallot_0.1.0.zip'
Content type 'application/zip' length 62236 bytes (60 KB)
downloaded 60 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.6/utf8_1.1.4.zip'
Content type 'application/zip' length 215428 bytes (210 KB)
downloaded 210 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.6/vctrs_0.2.0.zip'
Content type 'application/zip' length 828261 bytes (808 KB)
downloaded 808 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.6/cli_1.1.0.zip'
Content type 'application/zip' length 175619 bytes (171 KB)
downloaded 171 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.6/crayon_1.3.4.zip'
Content type 'application/zip' length 750115 bytes (732 KB)
downloaded 732 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.6/fansi_0.4.0.zip'
Content type 'application/zip' length 221583 bytes (216 KB)
downloaded 216 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.6/pillar_1.4.2.zip'
Content type 'application/zip' length 182545 bytes (178 KB)
downloaded 178 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.6/purrr_0.3.2.zip'
Content type 'application/zip' length 420838 bytes (410 KB)
downloaded 410 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.6/assertthat_0.2.1.zip'
Content type 'application/zip' length 55187 bytes (53 KB)
downloaded 53 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.6/pkgconfig_2.0.2.zip'
Content type 'application/zip' length 22509 bytes (21 KB)
downloaded 21 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.6/R6_2.4.0.zip'
Content type 'application/zip' length 58841 bytes (57 KB)
downloaded 57 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.6/Rcpp_1.0.2.zip'
Content type 'application/zip' length 4535723 bytes (4.3 MB)
downloaded 4.3 MB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.6/tibble_2.1.3.zip'
Content type 'application/zip' length 337264 bytes (329 KB)
downloaded 329 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.6/tidyselect_0.2.5.zip'
Content type 'application/zip' length 627040 bytes (612 KB)
downloaded 612 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.6/BH_1.69.0-1.zip'
Content type 'application/zip' length 19008275 bytes (18.1 MB)
downloaded 18.1 MB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.6/plogr_0.2.0.zip'
Content type 'application/zip' length 18870 bytes (18 KB)
downloaded 18 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.6/dplyr_0.8.3.zip'
Content type 'application/zip' length 3266309 bytes (3.1 MB)
downloaded 3.1 MB

package ‘backports’ successfully unpacked and MD5 sums checked
package ‘ellipsis’ successfully unpacked and MD5 sums checked
package ‘digest’ successfully unpacked and MD5 sums checked
package ‘zeallot’ successfully unpacked and MD5 sums checked
package ‘utf8’ successfully unpacked and MD5 sums checked
package ‘vctrs’ successfully unpacked and MD5 sums checked
package ‘cli’ successfully unpacked and MD5 sums checked
package ‘crayon’ successfully unpacked and MD5 sums checked
package ‘fansi’ successfully unpacked and MD5 sums checked
package ‘pillar’ successfully unpacked and MD5 sums checked
package ‘purrr’ successfully unpacked and MD5 sums checked
package ‘assertthat’ successfully unpacked and MD5 sums checked
package ‘pkgconfig’ successfully unpacked and MD5 sums checked
package ‘R6’ successfully unpacked and MD5 sums checked
package ‘Rcpp’ successfully unpacked and MD5 sums checked
package ‘tibble’ successfully unpacked and MD5 sums checked
package ‘tidyselect’ successfully unpacked and MD5 sums checked
package ‘BH’ successfully unpacked and MD5 sums checked
package ‘plogr’ successfully unpacked and MD5 sums checked
package ‘dplyr’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
C:\Users\Romina\AppData\Local\Temp\RtmpOc7aD2\downloaded_packages
> ?rename
No documentation for ‘rename’ in specified packages and libraries:
  you could try ‘??rename’
> ??rename
> ??rename
> # Other way to install packages is to write install.packages"reshape2"
  > install.packages("reshape2")
WARNING: Rtools is required to build R packages but is not currently installed. Please download and install the appropriate version of Rtools before proceeding:
  
  https://cran.rstudio.com/bin/windows/Rtools/
  Installing package into ‘C:/Users/Romina/Documents/R/win-library/3.6’
(as ‘lib’ is unspecified)
also installing the dependency ‘plyr’

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.6/plyr_1.8.4.zip'
Content type 'application/zip' length 1301663 bytes (1.2 MB)
downloaded 1.2 MB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.6/reshape2_1.4.3.zip'
Content type 'application/zip' length 627547 bytes (612 KB)
downloaded 612 KB

package ‘plyr’ successfully unpacked and MD5 sums checked
package ‘reshape2’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
C:\Users\Romina\AppData\Local\Temp\RtmpOc7aD2\downloaded_packages
> ?rename
No documentation for ‘rename’ in specified packages and libraries:
  you could try ‘??rename’
> ??rename
> library(reshape2)
> reshape2
Error: object 'reshape2' not found
> z
[1]  1  2  3  4  5  6  7  8  9 10
> z-1
[1] 0 1 2 3 4 5 6 7 8 9
> z*z
[1]   1   4   9  16  25  36  49  64  81 100
> # Counting the numbers within an object
  > t=1:300
> t
[1]   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17  18  19  20  21  22
[23]  23  24  25  26  27  28  29  30  31  32  33  34  35  36  37  38  39  40  41  42  43  44
[45]  45  46  47  48  49  50  51  52  53  54  55  56  57  58  59  60  61  62  63  64  65  66
[67]  67  68  69  70  71  72  73  74  75  76  77  78  79  80  81  82  83  84  85  86  87  88
[89]  89  90  91  92  93  94  95  96  97  98  99 100 101 102 103 104 105 106 107 108 109 110
[111] 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128 129 130 131 132
[133] 133 134 135 136 137 138 139 140 141 142 143 144 145 146 147 148 149 150 151 152 153 154
[155] 155 156 157 158 159 160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175 176
[177] 177 178 179 180 181 182 183 184 185 186 187 188 189 190 191 192 193 194 195 196 197 198
[199] 199 200 201 202 203 204 205 206 207 208 209 210 211 212 213 214 215 216 217 218 219 220
[221] 221 222 223 224 225 226 227 228 229 230 231 232 233 234 235 236 237 238 239 240 241 242
[243] 243 244 245 246 247 248 249 250 251 252 253 254 255 256 257 258 259 260 261 262 263 264
[265] 265 266 267 268 269 270 271 272 273 274 275 276 277 278 279 280 281 282 283 284 285 286
[287] 287 288 289 290 291 292 293 294 295 296 297 298 299 300
> # to know the lenght of an object type lenght
  > lenght(t)
Error in lenght(t) : could not find function "lenght"
> length(t)
[1] 300
> #the first 5 values
  > head(t)
[1] 1 2 3 4 5 6
> #the last 5 values
  > tail(t)
[1] 295 296 297 298 299 300
> #the last 10 values
  > tail(t,10)
[1] 291 292 293 294 295 296 297 298 299 300
> # OTHER EXERCISE
  > length(z)
[1] 10
> z*z
[1]   1   4   9  16  25  36  49  64  81 100
> z*t
[1]    1    4    9   16   25   36   49   64   81  100   11   24   39   56   75   96  119  144
[19]  171  200   21   44   69   96  125  156  189  224  261  300   31   64   99  136  175  216
[37]  259  304  351  400   41   84  129  176  225  276  329  384  441  500   51  104  159  216
[55]  275  336  399  464  531  600   61  124  189  256  325  396  469  544  621  700   71  144
[73]  219  296  375  456  539  624  711  800   81  164  249  336  425  516  609  704  801  900
[91]   91  184  279  376  475  576  679  784  891 1000  101  204  309  416  525  636  749  864
[109]  981 1100  111  224  339  456  575  696  819  944 1071 1200  121  244  369  496  625  756
[127]  889 1024 1161 1300  131  264  399  536  675  816  959 1104 1251 1400  141  284  429  576
[145]  725  876 1029 1184 1341 1500  151  304  459  616  775  936 1099 1264 1431 1600  161  324
[163]  489  656  825  996 1169 1344 1521 1700  171  344  519  696  875 1056 1239 1424 1611 1800
[181]  181  364  549  736  925 1116 1309 1504 1701 1900  191  384  579  776  975 1176 1379 1584
[199] 1791 2000  201  404  609  816 1025 1236 1449 1664 1881 2100  211  424  639  856 1075 1296
[217] 1519 1744 1971 2200  221  444  669  896 1125 1356 1589 1824 2061 2300  231  464  699  936
[235] 1175 1416 1659 1904 2151 2400  241  484  729  976 1225 1476 1729 1984 2241 2500  251  504
[253]  759 1016 1275 1536 1799 2064 2331 2600  261  524  789 1056 1325 1596 1869 2144 2421 2700
[271]  271  544  819 1096 1375 1656 1939 2224 2511 2800  281  564  849 1136 1425 1716 2009 2304
[289] 2601 2900  291  584  879 1176 1475 1776 2079 2384 2691 3000
> length(z*t)
[1] 300
> #OJO. CUANDO HACES ESTE TIPO DE MULTIPLICACIONES, ESTA TOMANDO EL MENOR VALOR Y LO ESTA REPITIENDO , POR ESO ES QUE AUN TE DA 300 NUMEROS
  > b=1:13
> b*z
[1]   1   4   9  16  25  36  49  64  81 100  11  24  39
Warning message:
  In b * z : longer object length is not a multiple of shorter object length
> mean(z)
[1] 5.5
> round(mean(z,na.rm=T), digits=0)
[1] 6
> r=round(mean(z,na.rm=T), digits=0)
> # SAMPLE FUNCTION
  > sample(x=z, size=4)
[1]  7  3 10  1
> sample(x=z, size=4)
[1] 7 8 9 1
> sample(x=z, size=4)
[1]  2  5  6 10
> # EVERYTIME I USE SAMPLE IT WILL PICK RANDOMLY SAMPLES FROM MY DATA SET
  > # AS IN SIZE YOU ARE INDICATING HOW MANY SAMPLES YOU WANT TO GET FROM THAT ORIGINAL POOL OF SAMPLES
  > 
  > # REPLACE FUNCTION: when your replace is TRUE, your numbers can be repeated from the previous sample, but if you don't want to use the same number use FALSE
  > save(t,file="t_interger.Rdata")
> list.file()
Error in list.file() : could not find function "list.file"
> list.files(t_interger.Rdata)
Error in list.files(t_interger.Rdata) : 
  object 't_interger.Rdata' not found
> list.files()
[1] "Lec 2.R"          "README.md"        "Romina.Rproj"     "t_interger.Rdata"
[5] "test.R