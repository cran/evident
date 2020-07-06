\name{benzene}
\alias{benzene}
\docType{data}
\concept{Evidence factors}
\concept{Observational study}
\concept{Sensitivity analysis}
\concept{Matched pairs}
\concept{Causal inference}
\title{
Chromosome Damage from Exposure to Benzene
}
\description{
Examines chromosome aberrations among shoe workers exposed to benzene and unexposed controls.
}
\usage{data("benzene")}
\format{
  A data frame with 78 observations on the following 5 variables.
  \describe{
    \item{\code{age}}{Age in years}
    \item{\code{exposure}}{Years employed as a shoe worker.  For controls, exposure = 0}
    \item{\code{alcohol}}{0=no, 1=yes}
    \item{\code{smoking}}{Cigarette smoking, packs per day}
    \item{\code{totalplus}}{Total chromosome aberrations, including gaps.}
  }
}

\source{
The data are frome Tunca, B.T. and Egeli, U. (1996).  Paz-y-Mino (2002) discuss whether to include gaps in chromosome aberrations. Used as an example in Rosenbaum (2001).
}
\references{
Paz-y-Mino, C., Davalos, M.V., Sanchez, M.E., Arevalo, M. and Leone, P.E. (2002). <doi:10.1016/S1383-5718(02)00021-9> "Should gaps be included in chromosomal aberration analysis? Evidence based on the comet assay". Mutation Research: Genetic Toxicology and Environmental Mutagenesis, 516, 57-61.

Rosenbaum, P.R. (2001). <doi:10.1093/biomet/88.1.219> "Effects attributable to treatment: Inference in experiments and observational studies with a discrete pivot". Biometrika, 88, 219-231.

Tunca, B.T., Egeli, U. (1996). <doi:10.1289/ehp.961041313> "Cytogenetic findings on shoe workers exposed long-term to benzene".  Environmental Health Perspectives, 104, 1313-1317.
}
\examples{
data(benzene)
attach(benzene)
boxplot(totalplus[exposure==0],totalplus[exposure>0],names=c("C","W"),ylab="Chromosome aberrations",
       main=c("Controls vs Workers"),xlab="C=control, W=worker",ylim=c(0,36))
plot(exposure[exposure>0],totalplus[exposure>0],ylim=c(0,36),main="Shoe Workers Only",
       xlab="Years of Exposure",ylab="Chromosome aberrations",pch=16)
wilcox.test(totalplus[exposure>0],totalplus[exposure==0],conf.int=TRUE,alternative = "greater")
cor.test(exposure[exposure>0],totalplus[exposure>0],method="k",alternative = "greater")
detach(benzene)
}
\keyword{datasets}
