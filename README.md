# MPEA: Multivariate Pathway Enrichment Analysis

MPEA.r contains the following 2 functions

MPEA: Simple Multivariate pathway enrichment Anlysis. 
Arguments:
1. expressions: A matrix of expression values. The samples are rows and the columns are the expression values of individual genes ( or similar). The column names should be the name of the genes as are in the pathway.
2.pathway: a list of individual pathways to be analyzed. Each element of the list consists of a string of the names of the genes inside the pathway 
3. y: Vector of phenotypes. For dichotomous cases a binary vector would be satisfactory.
4. num_simulation: The number of simulation runs for p-value estimation.
5. ncore: number of CPU cores used for the computation
6. seed.number: set for result reproduction.

Value:
A vector containing the unadjusted p-value of individual pathways submitted to the code.

MPEA_subsampling: Multivariate pathway enrichment Anlysis with windowing compensation.
Arguments:
1. expressions: A matrix of expression values. The samples are rows and the columns are the expression values of individual genes ( or similar). The column names should be the name of the genes as are in the pathway.
2.pathway: a list of individual pathways to be analyzed. Each element of the list consists of a string of the names of the genes inside the pathway 
3. y: Vector of phenotypes. For dichotomous cases a binary vector would be satisfactory.
4. subsampling_size: The size of the sampling window
5. numsim1: The number of windowing simulation runs on the pathway
6. numsim2: The number of simulation runs on the array.
7. ncore: number of CPU cores used for the computation
8. dcor_test_repetition: Passed as R ( repitition count to dcor.test)
6. sim_mode: the flag choosing between average ( "mean") and maximum ("max") dcor values for significance analysis.
Value:
A vector containing the unadjusted p-value of individual pathways submitted to the code.
