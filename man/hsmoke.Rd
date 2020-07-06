\name{hsmoke}
\alias{hsmoke}
\docType{data}
\concept{Evidence factors}
\concept{Observational study}
\concept{Sensitivity analysis}
\concept{Stratification}
\concept{Subclassification}
\concept{Strata}
\concept{Covariance adjustment}
\concept{Causal inference}
\title{
Smoking and Homocysteine
}
\description{
Data from NHANES 2005-2006 concerning homocysteine levels in daily smokers (z=1) and never smokers (z=0), aged 20 and older.  Daily smokers smoked every day for the last 30 days, smoking an average of at least 10 cigarettes per day.  Never smokers smoked fewer than 100 cigarettes in their lives, do not smoke now, and had no tobacco use in the previous 5 days.  There are 2475 individuals in 104 strata defined by
gender, age, education, income, and BMI.
}
\usage{data("hsmoke")}
\format{
  A data frame with 2475 observations on the following 15 variables.
  \describe{
    \item{\code{SEQN}}{2005-2006 NHANES ID number.}
    \item{\code{homocysteine}}{Homocysteine level, umol/L.  Based on LBXHCY.}
    \item{\code{z}}{z=1 for a daily smoker, z=0 for a never smoker.  Based on SMQ020, SMQ040, SMD641, SMD650, SMQ680.}
    \item{\code{female}}{1=female, 0=male.  Based on RIAGENDR}
    \item{\code{age}}{Age in years.  Based on RIDAGEYR.}
    \item{\code{education}}{Education.  Based on DMDEDUC2.}
    \item{\code{povertyr}}{Ratio of family income to the poverty level, capped at five times the poverty level.  Based on INDFMPIR.}
    \item{\code{bmi}}{BMI = body-mass-index.  Based on BMXBMI.}
    \item{\code{cotinine}}{Cotinine level (ng/mL), a marker for recent smoking.  Based on LBXCOT.}
    \item{\code{st}}{Numeric strata indicating female, age, education, BMI and poverty.}
    \item{\code{stf}}{A factor for strata indicating female, age, education, BMI and poverty.}
    \item{\code{age3}}{Three age categories, 20-39, 40-50, >=60.  Used to define the strata.}
    \item{\code{ed3}}{Three education categories, <High School, High School, at least some College.  Used to define the strata.}
    \item{\code{bmi3}}{Three categories of the body-mass-index, BMI, <30, [30,35), >= 35.  Used to define the strata.}
    \item{\code{pov2}}{TRUE=income at least twice the poverty level, FALSE otherwise.  Used to define the strata.}
  }
}
\details{
Bazzano et al. (2003) noted higher homocysteine levels in the blood of
smokers.  This data set reexamines this issue using more recent data
from NHANES 2005-2006, the most recent NHANES that measured homocysteine.

The example reproduces analyses from Rosenbaum (2018). The example illustrates use a sensitivity analysis with 104 strata
defined by covariates, with and without additional adjustment for
continuous versions of these covariates using robust covariance
adjustment; see Rosenbaum (2002).

Other analyses of smoking and homocysteine are in Karmakar et al. (2020) and Pimentel et al. (2015).
}
\source{
NHANES, the US National Health and Nutrition Examination Survey, 2005-2006.
Publicly available from the US National Center for Health Statistics, US Centers for Disease Control.
}
\references{
Bazzano, L. A., He, J., Muntner, P., Vupputuri, S. and Whelton, P. K. (2003) <doi:10.7326/0003-4819-138-11-200306030-00010> "Relationship between cigarette smoking and novel risk factors for cardiovascular disease in the United States".  Annals of Internal Medicine, 138, 891-897.

Karmakar, B., Small, D. S. and Rosenbaum, P. R. (2020)
<doi:10.1093/aje/kwz263> "Using evidence factors to clarify exposure biomarkers". American Journal of Epidemiology, 189, 243–249.

Pimentel, S. D., Small, D. S. and Rosenbaum, P. R. (2016)
<doi:10.1080/01621459.2015.1076342> "Constructed second control groups and attenuation of unmeasured biases".  Journal of the American Statistical Association, 111, 1157-1167.

Rosenbaum, P. R. (2002). <doi:10.1214/ss/1042727942> "Covariance adjustment in randomized experiments and observational studies". Statistical Science, 17(3), 286-327.

Rosenbaum, P. R. (2018) <doi:10.1214/18-AOAS1153> "Sensitivity analysis for stratified comparisons in an observational study of the effect of smoking on homocysteine levels".  Annals of Applied Statistics 12(4):2312–2334.
}
\examples{
data(hsmoke)
attach(hsmoke)
# Calculations discussed in Rosenbaum (2018).

# Stratified analysis of log2(homocysteine)
# Uses Hodges-Lehmann aligned ranks
l2h<-log2(homocysteine)
hll2h<-senstrat::hodgeslehmann(l2h,z,st,align="hl")
senstrat::senstrat(hll2h,z,st,gamma=1.95)
senstrat::senstrat(hll2h,z,st,gamma=2.1)

# Stratification + Covariance Adjustment
# Covariance model does not include the treatment, z
mod<-MASS::rlm(l2h~female+age+povertyr+bmi+education)
l2hr<-as.vector(mod$residual)
hll2hr<-senstrat::hodgeslehmann(l2hr,z,st,align="hl")
senstrat::senstrat(hll2hr,z,st,gamma=2.1)

# Uses M-scores in place of aligned ranks
msr<-senstrat::mscores(l2hr,z,st=st)
senstrat::senstrat(msr,z,st,gamma=2.35)

# Evidence factor analysis from Section 6.2 of Rosenbaum (2018)
# Among smokers, is homocysteine higher with high cotinine?
summary(cotinine[z==1]) # Cotinine among smokers
table(cotinine[z==1]<=185.750)
table(cotinine[z==1]>=342)
use<-(z==1)&((cotinine<=185.750)|(cotinine>=342))
cot<-1*((cotinine>=342))
# Figure 4 in Rosenbaum (2018)
graphics::boxplot(l2hr[use]~cot[use],names=c("Low","High"),
      ylab="Residual",xlab="Cotinine")
cotl2hr<-senstrat::mscores(l2hr[use],cot[use],st=st[use])
senstrat::senstrat(cotl2hr,cot[use],st[use],gamma=2.5)
detach(hsmoke)
}
\keyword{datasets}
