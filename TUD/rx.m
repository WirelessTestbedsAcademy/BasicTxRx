%% init TestMan
% load default HaLo config
[ halo ] = halo_defaultConfig('halo');

%% init RX Hardware    
halo_init_rx(halo); 

%% run RX and make sure it does!
halo_start_rx(halo);

%% Receive signal
rec = halo_getSignal(halo);
% It could be empty, if something went wrong
if (~isempty(rec))
    figure(1);
    spectrum = 10*log10(abs(fft(rec)));
    plot(spectrum);
end