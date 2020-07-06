\name{ck}
\alias{ck}
\docType{data}
\concept{Evidence factors}
\concept{Causal inference}
\concept{Observational study}
\concept{Sensitivity analysis}
\title{
Minimum Wages and Employment
}
\description{
Data from Card and Krueger's study of minimum wages and employment in New Jersey and Pennsylvania.
}
\usage{data("ck")}
\format{
  A data frame with 198 observations on the following 7 variables.
  \describe{
    \item{\code{mset}}{Matched set indicator, 1, 2, ..., 66}
    \item{\code{grp}}{Group indicator \code{NJhigh} \code{NJlow} \code{PA}}
    \item{\code{fte}}{Full time employees, Februrary 1992, before the increase in the minimum wage in New Jersey (NJ).}
    \item{\code{fte2}}{Full time employees, November 1992, after the increase in the minimum wage in New Jersey (NJ).}
    \item{\code{CHAIN}}{Restaurant chain, Burger King, Wendy's, KFC and Roy Rogers}
    \item{\code{HRSOPEN}}{Number of hours the restaurant was open in February 1992}
    \item{\code{SHEET}}{Identifier that may be used to link the limited data here to the full data set provided by Card and Krueger.}
  }
}
\details{
On 1 April 1992, the state of New Jersy increased its minimum wage from 4.25 dollars per hour to 5.05 dollars per hour, while adjacent Pennsylvania made no change.  David Card and Alan Krueger studied the change in employment at fast food restaurants, from before the wage increase to after, based on survey data they collected.

There are three groups matched for HRSOPEN and indicators of the CHAIN.   PA are restaurants in eastern Pennsylvania, adjacent to western New Jersey.  NJlow are New Jersey restaurants with a starting wage of at most 4.50 dollars in February 1992, and NJhigh are New Jersey restaurants with a starting wage of more than 4.50 dollars.  The NJlow restaurants were required to increase the starting wage by substantially more than the NJhigh restaurants.

The match was built using the algorithm of Karmakar et al. (2019) and the approximatch package in R.

Using a different matched sample, an analysis of two evidence factors in Card and Krueger's study is given in Rosenbaum (2010).
}
\source{
Card, D. and Krueger, A. B. (1994) <doi:10.1080/10618600.2019.1584900> "Minimum wages and employment: A case study of the fast food industry in New Jersey and Pennsylvania".  American Economic Review, 84, 772-793.
}
\references{
Card, D. and Krueger, A. B. (1994) <doi:10.1080/10618600.2019.1584900> "Minimum wages and employment: A case study of the fast food industry in New Jersey and Pennsylvania".  American Economic Review, 84, 772-793.

Karmakar, B., Small, D. S. and Rosenbaum, P. R. (2019)
<doi:10.1080/10618600.2019.1584900> "Using approximation algorithms to build evidence factors and related designs for observational studies".  Journal of Computational and Graphical Statistics, 28, 698-709.

Rosenbaum, P. R. (2010). <doi:10.1093/biomet/asq019> "Evidence factors in observational studies". Biometrika, 97(2), 333-345.
}
\examples{
data(ck)
boxplot((ck$fte2-ck$fte)~ck$grp)
}
\keyword{datasets}
