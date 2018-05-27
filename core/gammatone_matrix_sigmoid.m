% gammatone_matrix_sigmoid
function [wts,cfreqs] = gammatone_matrix_sigmoid(nfft, sr, nfilts, cntfreq, width, maxlen)

    if nargin < 2;    sr = 250000; end
    if nargin < 3;    nfilts = 64; end
    if nargin < 4;    cntfreq = 75000; end
    if nargin < 5;    width = 0.5; end
    if nargin < 6;    maxlen = nfft/2; end

    wts = zeros(nfilts, nfft);

    % ERB filters
    slope = 14.2;
    cfreqs = fix( cntfreq - 1 / (slope * (2/sr)) * log((nfilts+1-[0:nfilts]) ./ [1:nfilts+1] ));

    GTord = 4;

    ucirc = exp(1i*2*pi*[0:(nfft/2)]/nfft);

    for i = 1:nfilts
      cf = cfreqs(i);
      cfn = cfreqs(i+1);
      ERB = width*(cfn-cf);
      B = 1.019*2*pi*ERB;
      r = exp(-B/sr);

      theta = 2*pi*cf/sr;
      pole = r*exp(1i*theta);

      % poles and zeros, following Malcolm's MakeERBFilter
      T = 1/sr;
      A11 = -(2*T*cos(2*cf*pi*T)./exp(B*T) + 2*sqrt(3+2^1.5)*T*sin(2* ...
                                                        cf*pi*T)./exp(B*T))/2;
      A12 = -(2*T*cos(2*cf*pi*T)./exp(B*T) - 2*sqrt(3+2^1.5)*T*sin(2* ...
                                                        cf*pi*T)./exp(B*T))/2;
      A13 = -(2*T*cos(2*cf*pi*T)./exp(B*T) + 2*sqrt(3-2^1.5)*T*sin(2* ...
                                                        cf*pi*T)./exp(B*T))/2;
      A14 = -(2*T*cos(2*cf*pi*T)./exp(B*T) - 2*sqrt(3-2^1.5)*T*sin(2* ...
                                                        cf*pi*T)./exp(B*T))/2;
      zros = -[A11 A12 A13 A14]/T;

      gain(i) =  abs((-2*exp(4*1i*cf*pi*T)*T + ...
                  2*exp(-(B*T) + 2*1i*cf*pi*T).*T.* ...
                  (cos(2*cf*pi*T) - sqrt(3 - 2^(3/2))* ...
                   sin(2*cf*pi*T))) .* ...
                 (-2*exp(4*1i*cf*pi*T)*T + ...
                  2*exp(-(B*T) + 2*1i*cf*pi*T).*T.* ...
                  (cos(2*cf*pi*T) + sqrt(3 - 2^(3/2)) * ...
                   sin(2*cf*pi*T))).* ...
                 (-2*exp(4*1i*cf*pi*T)*T + ...
                  2*exp(-(B*T) + 2*1i*cf*pi*T).*T.* ...
                  (cos(2*cf*pi*T) - ...
                   sqrt(3 + 2^(3/2))*sin(2*cf*pi*T))) .* ...
                 (-2*exp(4*1i*cf*pi*T)*T + 2*exp(-(B*T) + 2*1i*cf*pi*T).*T.* ...
                  (cos(2*cf*pi*T) + sqrt(3 + 2^(3/2))*sin(2*cf*pi*T))) ./ ...
                 (-2 ./ exp(2*B*T) - 2*exp(4*1i*cf*pi*T) +  ...
                  2*(1 + exp(4*1i*cf*pi*T))./exp(B*T)).^4);
      wts(i,1:(nfft/2+1)) = ((T^4)/gain(i)) ...
          * abs(ucirc-zros(1)).*abs(ucirc-zros(2))...
          .*abs(ucirc-zros(3)).*abs(ucirc-zros(4))...
          .*(abs((pole-ucirc).*(pole'-ucirc)).^-GTord);
    end

    wts = wts(:,1:maxlen);
    wts = wts./repmat(max(wts')',1,size(wts,2));

end