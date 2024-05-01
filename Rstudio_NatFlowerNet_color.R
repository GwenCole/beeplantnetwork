library(bipartite)# downloads bipartitie package
#library(RColorBrewer)
#install.packages("RColorBrewer")
dpar<-par() 
par(font=3) 

#***Before you move forward IS THE bipartiteD3 AND bipartite packages downloaded?
#***Are you in a supported R version for bipartiteD3? Ver. at the time of making time is: RStudio 2023.09.0+463 "Desert Sunflower" Release: b51c81cc303d4b52b010767e5b30438beb904641, 2023-09-25 

#imports the data set as .csv and naming it NatFlowerNet
NatFlowerNet <- read.csv("C:/Users/gweny/OneDrive/Desktop/Rstudio/NatFlowerNet.csv", row.names=1) #row 1 was set to row.names when imports which allows it to run and avoid error
   View(NatFlowerNet)  # gives us a view of the file we imported from excel

   
NatFlowerNet[is.na(NatFlowerNet)]<-0 #changes all of the NA to 0 this is so the bipartateD3 can run the normal bipartate can run just fine without this step but if you want color you need this

nat <- as.data.frame(NatFlowerNet)

natm=as.matrix(nat)# converts csv file df to a matrix so I can make the plots without warnings

print(natm)#used to check matrix 


 networklevel(natm)
#calculates a variety of indices and values for the matrix at a network level
#ARGUMENTS:web,index,level,weighted,ISAmethod,SAmethod,extinctmethod,nrep,CCfun,dist,normalise,empty.web,logbase,intereven,H2_integer,fcweighted,fcdist,legacy,
specieslevel(natm)
#calculate various indices for network properties at the species level
#ARGUMENTS:Web,index,level,logbase,low.abun,high.abun,PDI.normalise,PSI.beta,nested.method,nested.normalised,nested.weighted,empty.web


bipartite_D3(natm, colouroption = 'brewer',BrewerPalette ='Dark2', mp=c(3,2),
             MainFigSize = c(1400, 1900), 
             IndivFigSize = c(300, 1600),
             BoxLabPos = c(20, 20),
             PercPos = c(300,300),
             BarSize = 40,
             MinWidth = 0,
             Pad=7,
             IncludePerc = TRUE,
             PercentageDecimals = 2,
             EdgeMode = 'straight',
             PRINT = TRUE
)



#THIS PART OF THE CODE IS NOT NEEDED IF YOU ARE USING THE BIPARTITE_D3
#plotweb(nonm, text.rot = 90, labsize = 1.2, y.lim = c(-1.5,3))#produces the bipartie graph in this example all the options are at default
#I rotated text so it wont be diagonal, you can also change the label size and the size of the bars to make it fit without overlapping 
#plotweb(sortweb(natm, sort.order="dec"),text.rot = 90, labsize = 1.2, y.lim = c(-1.5,3))

par(dpar)#stops italicizing the fonts because you can not italicize the visweb plot so I just stopped it here

visweb(natm,type="diagonal")#produces a plot of a network matrix using the type diagonal 
#formatting issues cannot be fixed without transforming the graph into a gTree object and which you need too download library(gridGraphics) to do

null.t.test(natm,index=c("generality","vulnerability","cluster coefficient","H2","ISA","SA"),nrep=2, N=30)
# the null.t.test is to check to see if the observed values are much different compared to what we would expect to see under random numbers
# random matrices based on r2dtable (with ALL the assumptions)
#

#nrep : number of replicates for the extinction sequence analysis
#N : the number of null models to be produced (its like the number of random repetitions created within the web) the more repetitions the more reliable the test however it will take longer to run or it might crash

