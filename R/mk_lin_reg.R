##pushing to git
##git remote add origin git@github.com:mich625/HW_3.git   ##this probably not needed if connection already set
##git branch -M main
##git push -u origin main

##_____________________________________________
##original function

mtcars = data(mtcars)
orig_lm = lm(formula = mpg ~ cyl + wt, data = mtcars)
orig_lm
summary(orig_lm)

##________________________________________________
##testing

all.equal(mk_lm(formula = mpg ~ cyl + wt, data = mtcars), lm(formula = mpg ~ cyl + wt, data = mtcars))
bench::mark(mk_lm(formula = mpg ~ cyl + wt, data = mtcars), lm(formula = mpg ~ cyl + wt, data = mtcars))

mk_lm(Y = Y,X1 = X1,X2 = X2,data = data)

##________________________________________________
##inputs
data()
data("mtcars")
data = mtcars
X1 = data$wt
X2 = data$cyl
Y = data$mpg
formula = Y ~ X1 + X2
#_________________________________________________

#mk_lm = function(formula, data){
mk_lm = function(Y,X1,X2,data){

##create X matrix
intercept = rep(1, nrow(data))
X_mat = cbind(intercept, X1, X2)

##formulat for coefficients, (tX X)' tX Y
beta = solve(t(X_mat) %*% X_mat) %*% t(X_mat) %*% Y  #note this is beta hat

##residuals -> Y - Y_hat -> Y - X*B
residuals = Y - X_mat %*% beta

##degrees of freedom -> number of observations less number of covariates & the rest are in the df res
df = length(Y) - ncol(X_mat)
df_res = length(Y) - df

##create the variance covariance matrix
SSE = sum(residuals^2)
res_var = SSE/df
var_cov_mat = res_var * solve(t(X_mat) %*% X_mat)

##standard errors -> the sqrt of the diagonal of the var_cov matrix
SE = sqrt(diag(var_cov_mat))
res_std_error = sqrt(SSE/df)

##rank -> the number of covars + 1
rank = ncol(X_mat)

##fitted values -> just run the betas through
Y_fitted = beta[1] + X1*beta[2] + X2*beta[3]

##t_value and p_value
t_stats = beta/SE
p_value = 2*(1 - pt(abs(t_stats), df)) #2 sided


##Output creation__________________________
##Organizing the Outputs to match lm()
regression_summary = list(beta,SE)
#names(regression_summary) = c("estimates")

#print(regression_summary)


  return(regression_summary)
}

##_____________Test Case____________________
mk_lm(Y = Y,X1 = X1,X2 = X2,data = data)
