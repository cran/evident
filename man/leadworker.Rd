\name{leadworker}
\alias{leadworker}
\docType{data}
\title{
DNA Damage in Lead Workers
}
\description{
Data from Table 1 of Wu et al. (2002) concerning DNA damage among lead workers
compared to controls.  In this example, the data have been matched
for age and smoking, making 11 matched pairs.
}
\usage{data("leadworker")}
\format{
  A data frame with 22 observations on the following 7 variables.
  \describe{
    \item{\code{mset}}{Matched set indicator, 1, 2, ..., 11}
    \item{\code{group}}{1=lead worker, 0=control}
    \item{\code{age}}{Age in years}
    \item{\code{smoking}}{Smoking, pack-years}
    \item{\code{bll}}{Blood lead level, mu-g/dl}
    \item{\code{dpc}}{DNA-protein cross-links, percent}
    \item{\code{id}}{ID number in the original study, before matching}
  }
}
\details{
The outcome, a measure of DNA damage is dpc.
}
\source{
Fang-Yang Wu, Pao-Wen Chang, Chin-Ching Wu and Hsien-Wen Kuo (2002).
"Correlations of Blood Lead with DNA-Protein Cross-Links and Sister Chromatid Exchanges in Lead Workers". Cancer Epidemiology, Biomarkers and Prevtion. March 1 2002 11 (3) 287-290.
}

\examples{
data(leadworker)
boxplot(leadworker$dpc~leadworker$group)
}
\keyword{datasets}
