\name{ckA}
\alias{ckA}
\docType{data}
\concept{Evidence factor}
\concept{Matching}
\title{
Matching the Minimum Wage Data
}
\description{
The data are Card and Krueger's (1994) minimum wage case study, prior
to matching for CHAIN and HRSOPEN.  The data illustrate
matching to form three groups using Bikram Karmakar's
approxmatch package.  A similar matched data set after matching is in ck
in this package: ck is a matched subset of all of the data in ckA.
}
\usage{data("ckA")}
\format{
  A data frame with 351 observations on the following 9 variables.
  \describe{
    \item{\code{SHEET}}{Identifier that may be used to link the limited data here to the full data set provided by Card and Krueger.}
    \item{\code{HRSOPEN}}{Number of hours the restaurant was open in February 1992}
    \item{\code{CHAIN}}{Restaurant chain, Burger King, Wendy's, KFC and Roy Rogers}
    \item{\code{chain1}}{Binary indicator, chain 1}
    \item{\code{chain2}}{Binary indicator, chain 2}
    \item{\code{chain3}}{Binary indicator, chain 3}
    \item{\code{FTE}}{Full time employees, Februrary 1992, before the increase in the minimum wage in New Jersey (NJ).}
    \item{\code{FTE2}}{Full time employees, November 1992, after the increase in the minimum wage in New Jersey (NJ).}
    \item{\code{grp}}{Group indicator \code{NJhigh} \code{NJlow} \code{PA}}
  }
}
\details{
These data are used to illustrate matching to form matched triples from
three groups, Pennsylvania
restaurants, New Jersey restaurants with low starting wages before the wage
increase, and New Jersey restaurants with high starting wages before the
wage increase.  The low/high wage cut is at 4.50 dollars per hour.  The method
illustrated is from Karmakar et al. (2019) as implemented in Karmakar's
approxmatch package.

To use the approxmatch package, you must first install and load the optmatch
package, which an academic license.  The optmatch packages uses the relax
code of Bertsekas and Tseng (1988).

Using a different matched sample, an analysis of two evidence factors in Card and Krueger's study is given in Rosenbaum (2010).
}
\source{
Card, D. and Krueger, A. B. (1994) <doi:10.1080/10618600.2019.1584900> "Minimum wages and employment: A case study of the fast food industry in New Jersey and Pennsylvania".  American Economic Review, 84, 772-793.
}
\references{
Bertsekas, D. P. and Tseng, P. (1988) <doi:10.1007/BF02288322> "The Relax codes for linear minimum cost network flow problems". Annals of Operations Research, 13(1), 125-190.

Card, D. and Krueger, A. B. (1994) <doi:10.1257/aer.90.5.1397> "Minimum wages and employment: A case study of the fast food industry in New Jersey and Pennsylvania".  American Economic Review, 84, 772-793.

Karmakar, B., Small, D. S. and Rosenbaum, P. R. (2019)
<doi:10.1080/10618600.2019.1584900> "Using approximation algorithms to build evidence factors and related designs for observational studies".  Journal of Computational and Graphical Statistics, 28, 698-709.

Rosenbaum, P. R. (2010). <doi:10.1093/biomet/asq019> "Evidence factors in observational studies". Biometrika, 97(2), 333-345.
}

\examples{
data(ckA)
table(ckA$CHAIN)
table(ckA$grp)

## Not run:
#  To run this example, you must install and load
#  the optmatch package and accepts its academic license.

dist<-approxmatch::multigrp_dist_struc(ckA,as.character(ckA$grp),
                          list(mahal=c("chain1","chain2","chain3",
                                       "HRSOPEN")),wgts=1)
mtch<-approxmatch::tripletmatching(dist,as.character(ckA$grp),
                      indexgroup="PA",ckA,"CHAIN",design=c(1,1,1))
## End(Not run)

}
\keyword{datasets}
