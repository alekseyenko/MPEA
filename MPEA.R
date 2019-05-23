
MPEA= function(expressions,pathway,genotypes,num_simulation=9999,ncore=6,seed.number=NA){
require(energy)
require(plyr)
require(foreach)
require(doParallel)
  
individual_pathway_length <- sapply(pathway_collapsed,length)
gene_number <- length(gene_names)
pathway_number <- length(individual_pathway_length)

dcor_results <- list()
univariate_results <- list()
univariate_results_adjusted <- list()

for (ii in 1:length(pathway)){
  pathway_expressions <- expressions[,colnames(expressions)%in% pathway[[ii]]]
  
  dcor_results[ii] <- dcor((pathway_expressions),(genotypes))
  
}
names(dcor_results)  <- names( pathway)
if (!is.na(seed.number)){
set.seed= seed.number
}
# surrogate_dcor <- list()
cl<-makeCluster(ncore)
registerDoParallel(cl)

surrogate_dcor <- foreach (ii = 1:pathway_number,  .export = c("num_simulation","gene_number","individual_pathway_length","genotypes"), .packages = "energy") %dopar%{
  if(ii%%100==0) print(ii)
  aux_dcor <- NULL
  for ( jj in 1: num_simulation)
  {
    aux_genes <- sample(1:gene_number,individual_pathway_length[ii])
    aux_dcor[jj] <- dcor(expressions[,aux_genes],genotypes)
    
  }  
  # surrogate_dcor[[ii]] <- aux_dcor
  aux_dcor
}
stopCluster(cl)
nominal_dcor_pvalues <- sapply(1:pathway_number, function(x) (1+(sum(surrogate_dcor[[x]]>dcor_results[x])))/(1+num_simulation))
names(nominal_dcor_pvalues) <- names(pathway)
return(nominal_dcor_pvalues)
}