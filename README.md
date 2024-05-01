##READ ME##

Bipartite Network Analysis of Plant-Bee Communities
**
  MIT license
**
Included in this repository is the code to make a bipartate plant-polinator network analysis
This does NOT include the needed .csv files to run the code if you want to use this code you
must have your own files. Unless you are going to do this exact kind of resarch with different
torphic levels this project will not be of much use. 

DISCLAMER: I am by no means a _programer_ this code is a hot mess at best but it works and I tried to 
make it as user freindly as possible if anyother ecologists want to use it :)

This project was created in Rstudio in 2022 and now relased on github in 2024 it was based off 
of the code in "Dormann, C.F. 2020. Using bipartite to describe and plot two-mode networks in R. 
R package version 4: 1-28."

 --------------------------------------------------------------------------------------------------------------

This code works best if it is set up as table with the higher trophic level on the x and the
lower trophic level on the y.

When importing your .csv into Rstudio you set "row.names=1" to allow this code to run.

The version of Rstudio this was made in was 1.2. 1335. 

The packages you need for this code to run sucessfully is:
  library(bipartite)
  library(bipartiteD3) **this package may cause problems if on a newer version of Rstudio**


  
  
