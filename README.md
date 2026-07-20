# First and Second-Round Effects of Inflation: A Comparative Analysis of Inflation Dynamics of Emerging Economies

This repository hosts the data cleaning pipelines, replication scripts, and time-series econometric workflows for analyzing macroeconomic parameters across the BRICS nations (Brazil, Russia, India, China, and South Africa) from 1971–2024.

---

## Empirical Framework & Methodology

The study examines headline-to-core reversions and core-to-headline spillovers using multi-decade monthly time-series data to isolate structural inflationary persistence and demand-side state optimizations.

### 1. Headline-to-Core Reversion (First-Round Transitory Spikes)
Following Cecchetti and Moessner (2008), the model tests whether headline inflation reverts to core inflation:
$$\pi_{i,t}^{\text{headline}} - \pi_{i,t-12}^{\text{headline}} = \alpha_i + \beta_i (\pi_{i,t-12}^{\text{headline}} - \pi_{i,t-12}^{\text{core}}) + \varepsilon_{i,t}$$

*   **Hypothesis:** A negative and statistically significant $\beta_i$ signals a transitory spike in headline inflation. The hypothesis of full reversion requires that $\alpha_i = 0$ and $\beta_i = -1$ jointly.

### 2. Core-to-Headline Reversion (Second-Round Effects)
To capture the potential spillover of initial supply shocks into wages, core prices, and unanchored expectations:
$$\pi_{i,t}^{\text{core}} - \pi_{i,t-12}^{\text{core}} = \alpha_i + \delta_i (\pi_{i,t-12}^{\text{core}} - \pi_{i,t-12}^{\text{headline}}) + \varepsilon_{i,t}$$

*   **Hypothesis:** A negative and statistically significant $\delta_i$ indicates that core inflation catches up to headline spikes, confirming entrenched second-round effects.

### 3. Association of Aggregate Demand Components with Headline and Core Inflation
To challenge the traditional demand-pull paradigm, OLS specifications isolate disaggregated quarterly aggregate demand components:
$$\pi_{i,t}^{\text{headline}} = \gamma_0 + \gamma_1 C_i + \gamma_2 I_i + \gamma_3 G_i + \gamma_4 XN_i + \nu_i$$
$$\pi_{i,t}^{\text{core}} = \delta_0 + \delta_1 C_i + \delta_2 I_i + \delta_3 G_i + \delta_4 XN_i + \phi_i$$

Where:
*   $C_i$: Domestic Consumption Growth (YoY)
*   $I_i$: Gross Fixed Capital Formation / Investment Growth (YoY)
*   $G_i$: Government Expenditure Growth (YoY)
*   $XN_i$: Net Exports Growth (YoY)

---

## Project Structure

*   `/Data/Raw`: Raw macroeconomic variables sourced from national statistical agencies, the IMF, and Bloomberg Terminal (1971–2024).
*   `/Scripts`: Cleaned, automated R production scripts detailing variable transformations, time-series alignments, OLS model metrics, and matrix exports.

_Replication data and automated analysis code are fully open-source and structured above._
