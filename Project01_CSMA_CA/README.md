# Project01 CSMA/CA simulation
We use Mento-Carlo simulation to demonstrate the average transmission efficiency versus the number of STAs in a BSS, where 

$$
\text{Transmission Efficiency} = \frac{\text{Time for Frame Transmission and Acknowledge}}{\text{Time for Frame Transmission+Overhead(SIFS,DIFS,contention)}}.
$$

We assume all the STAs always have data for transmission. Given a fixed number of STAs, more than 1000 transmissions are generated to measure the average transmission efficiency (Because of random backoff). And we show the efficiency versus number of STAs.

![a](project01.png)
