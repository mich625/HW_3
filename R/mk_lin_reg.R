#'MK_Regression
#'
#'This function uses ordinary least squares to do linear regression.  It requires an input of Y (outcome) and
#'X (matrix of covariates).  It will then run a linear regression and poutput the beta coefficiants, standard error,
#'t statistic, and p value (using a 2 sided test with alpha = 0.05 significance).
#'
#'
#'@param Y outcome variable must be in vector format
#'@param X covariate matrix, each column is a different covariate. Note, if only one covariate used it is reccomended to still be a matrix.
#'@param X_names the names of the covariates in the model as a vector of string(s)
#'
#'@return a table is returned that specifies the beta estimate, standard error, t statistic, and p value
#'
#'@examples
#'data(mtcars)
#'mk_lm(Y = mtcars$mpg, X = cbind(mtcars$wt, mtcars$cyl), X_names = c("weight", "cylinders"))
#'mk_lm(Y = mtcars$mpg, X = matrix(mtcars$wt, ncol = 1), X_names = c("weight"))
#'
#'@export
#'


mk_lm = function(Y,X, X_names){

##warning for if they put in unequal length arguments
if (length(Y) != nrow(X)){print("warning - inputs not of equal length")}

##na values ruin this data so we need to remove them
clean_data = cbind(Y,X)
clean_data = na.omit(clean_data)
Y = clean_data[,1]
X = clean_data[,2:ncol(clean_data)]


##Add intercept to X matrix
X = matrix(X, nrow = length(Y))
colnames(X) = X_names
intercept = rep(1, nrow(X))
X_mat = cbind(intercept, X)

##formula for coefficients -> (tX X)' tX Y
beta = solve(t(X_mat) %*% X_mat) %*% t(X_mat) %*% Y  #note this is beta hat

##residuals -> Y - Y_hat -> Y - X*B
residuals = Y - X_mat %*% beta

##degrees of freedom -> number of observations less number of covariates & the rest are in the df res
df = length(Y) - ncol(X_mat)
df_res = length(Y) - df  ##

##create the variance covariance matrix
SSE = sum(residuals^2)
res_var = SSE/df
var_cov_mat = res_var * solve(t(X_mat) %*% X_mat)

##standard errors -> the sqrt of the diagonal of the var_cov matrix
SE = sqrt(diag(var_cov_mat))
res_std_error = sqrt(SSE/df)  #

##t_value and p_value
t_stats = beta/SE
p_value = 2*(1 - pt(abs(t_stats), df)) #2 sided

##Output creation
regression_summary = cbind(beta, SE, t_stats, p_value)
colnames(regression_summary) = c("estimate", "std error", "t stat", "p value")

  return(regression_summary)
}
