# Project05 PSS Synchronization

We verify step-by-step that PSS (Primary synchronization signal) can be synchronized via the lowest sampling rate (1.92MHz), no matter what the actual signal bandwidth is.

1. We generate OFDM symbols with PSS via different sampling rates (bandwidths).
2. We	show that the same sampled signal can be obtained from the above OFDM symbols via lowpass filter and sampling rate 1.92 MHz.
3. We Show the detection procedure of $N_{ID}^{(2)}$ from the above sampled signal.
