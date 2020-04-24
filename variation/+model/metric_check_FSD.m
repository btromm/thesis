function model_ok = metric_check(gbars,metrics_V,metrics0,F,Fbar,S,Sbar,D,Dbar)

  model_ok = 0;

  % check that it has converged, and that the bursts are OK
  %{
  if ((abs(Fbar - F)/Fbar > .1) || (abs(Sbar - S)/Sbar > 0.1) || (abs(Dbar - D)/Dbar > 0.1));
    disp('Model did not converge')
    return
  end
  %}

  metrics = xtools.V2metrics(metrics_V,'sampling_rate',10);

  if (metrics0.burst_period - metrics.burst_period)/metrics0.burst_period > .2
    disp('Burst periods not OK')
    return
  end

  if (metrics0.duty_cycle_mean - metrics.duty_cycle_mean)/metrics0.duty_cycle_mean > .1
    disp('Duty cycle not OK')
    return
  end
  % if it makes it through, then model is ok
  model_ok = 1;
end