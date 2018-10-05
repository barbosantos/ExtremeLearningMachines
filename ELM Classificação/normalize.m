function [ norm_data ] = normalize( data )
%NORMALIZE Summary of this function goes here
%   Detailed explanation goes here

    n_patterns = size(data, 1);
    min_vector = repmat(min(data), n_patterns, 1);
    max_vector = repmat(max(data), n_patterns, 1);
    norm_data  = (data - min_vector) ./ (max_vector - min_vector);

end

