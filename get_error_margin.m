function error_margin = get_error_margin(original, predicted)
%GET_ERROR_MARGIN Calculate error margin between the actual location and
%predicted location.

    X = [original; predicted];
    error_margin = pdist(X,'euclidean');
<<<<<<< Updated upstream
    disp(['Error margin is ' , num2str(error_margin)]);
=======
    % disp("Error margin is " + error_margin);
>>>>>>> Stashed changes
    
end

