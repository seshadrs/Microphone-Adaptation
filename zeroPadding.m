function X_ = zeroPadding(varargin)
%%
% Takes as input an array and outputs the zero padded array of length the
% closest 2^N value, greater than the length of the input array.
% Usage:
%    X_ = zeroPadding2N(X)
%    X_ = zeroPadding2N(X, N)

%%
switch(nargin)
    case 0
        error('No args given');
        
    case 1
        X = varargin{1};
        
        d = size(X);
        if numel(d) >= 3 || (d(1)~=1 && d(2)~=1)
            error('Input must be a 1D vector');
        else
        
            noElements = numel(X);
            N = nextpow2(noElements);
        
            X_ = zeros(1,2^N);
            X_(1:noElements) = X;
        end
        
    case 2
        

        X = varargin{1};
        N = varargin{2};
        

        d = size(X);
        if numel(d) >= 3 || (d(1)~=1 && d(2)~=1)
            error('Input must be a 1D vector');
        else
            noElements = numel(X);
            X_ = zeros(1,2^N);
            X_(1:noElements) = X;
        end
        
    otherwise
        error('Too many args');        
end