# MPEA: Multivariate Pathway Enrichment Analysis

MPEA.r contains the following 2 functions

MPEA: Simple Multivariate pathway enrichment Anlysis. 
Arguments:
1. expressions: A matrix of expression values. The samples are rows and the columns are the expression values of individual genes ( or similar). The column names should be the name of the genes as are in the pathway.
2.pathway: a list of individual pathways to be analyzed. Each element of the list consists of a string of the names of the genes inside the pathway 
3. y: Vector of phenotypes. For dichotomous cases a binary vector would be satisfactory.
4. num_simulation: The number of simulation runs 
