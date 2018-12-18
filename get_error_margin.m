function [error_margin] = get_error_margin(original,predicted)
%GET_ERROR_MARGIN Calculate error margin between the actual location and
%predicted location.

    X = [original; predicted];
    error_margin = pdist(X,'euclidean');
    disp(['Error margin is ' , num2str(error_margin)]);
    
end

