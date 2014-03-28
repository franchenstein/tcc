function [alligndSig allignOffset] = ELGate2(inSig, downFactor, del)
%ELGate2 - Previous implementation of the Early-Late Gate algorithm, used
%for testing.
%--------------------------------------------------------------------------
%   INPUTS:
%       inSig - matched filtered signal, with its peaks at the optimum
%               moments for sampling;
%       downFactor - the downsampling factor; 
%       del - the stepsize of the function.
%   OUTPUTS:
%      synchdSig - the resampled signal, now correctly synchronized;
%       allignOffset - the allignment offset measured by the algorithm.
%   DESCRIPTION:
%    Using the Early-Late Gate algorithm, the signal will have its symbols
%    synchronized.
%--------------------------------------------------------------------------

        tnow=del*downFactor+1;
        tau=0;
        xs=zeros(1,length(inSig));                                 % initialize variables
        tausave=zeros(1,length(inSig));
        tausave(1)=tau; 
        cont2=0;
        mu=0.01;                                                            % algorithm stepsize
        delta=0.1;                                                          % time for derivative
        while tnow<length(inSig)-del*downFactor                  % run iteration
          cont2=cont2+1;
          xs(cont2)=interpsinc(inSig,tnow+tau,del);                % interpolated value at tnow+tau
          x_deltap=interpsinc(inSig,tnow+tau+delta,del);           % get value to the right
          x_deltam=interpsinc(inSig,tnow+tau-delta,del);           % get value to the left
          dx=x_deltap-x_deltam;                                             % calculate numerical derivative  
          tau=tau+mu*dx*xs(cont2);                                          % alg update (energy)
          tnow=tnow+downFactor; tausave(cont2)=tau;                       % save for plotting
        end

        alligndSig=xs;                                                          % Decisão de Símbolo Recebido

        allignOffset=alligndSig>0;                                                   %Estimação dos bits recebidos;

end