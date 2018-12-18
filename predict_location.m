function [closest_position] = predict_location(offline_fingerprints,newpoint_fingerprint)
%PREDICT_LOCATION Calculate the distance vector between newpoint and all
%points in the offline database then return the position with least
%distance

    N = size(offline_fingerprints,1);
    distances = zeros(N,1);
    for idx = 1 : N
        distances(idx) = sqrt(sum((offline_fingerprints(idx,3:end) - newpoint_fingerprint).^2));
    end
    [sorted_distances,row_indices] = sort(distances);
    closest_row_index = row_indices(1:1);
    closest_position = offline_fingerprints(closest_row_index,1:2);
    
end