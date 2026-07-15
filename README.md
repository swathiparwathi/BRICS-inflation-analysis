# BRICS-inflation-analysis
Replication files and data scripts for inflation dynamics across BRICS economies.
# First and Second-Round Effects of Inflation: A Comparative Analysis of Inflation Dynamics of Emerging Economies

This repository hosts the data cleaning pipelines, replication scripts, and time-series econometric workflows for analyzing macroeconomic parameters across the BRICS nations (Brazil, Russia, India, China, and South Africa). 

## Empirical Framework & Methodology
The study examines headline-to-core price reversions and core-to-headline feedback spillovers using multi-decade monthly time-series data to isolate structural inflationary persistence and supply-side state optimizations.

### 1. Headline-to-Core Reversion (First-Round Transitory Spikes)
Following Cecchetti and Moessner (2008), the model tests whether headline inflation reverts to core inflation:
$$\pi_{i, t}^{headline} - \pi_{i, t-12}^{headline} = \alpha_i + \beta_i (\pi_{i, t-12}^{headline} - \pi_{i, t-12}^{core}) + \varepsilon_{i, t}$$

*   **Hypothesis:** A negative and statistically significant $\beta_i$ signals a transitory spike in headline inflation. The hypothesis of full reversion requires that $\alpha_i = 0$ and $\beta_i = -1$ jointly.

### 2. Core-to-Headline Reversion (Second-Round Propagation)
To capture the potential spillover of initial supply shocks into wages, core prices, and unanchored expectations:
$$\pi_{i, t}^{core} - \pi_{i, t-12}^{core} = \alpha_i + \delta_i (\pi_{i, t-12}^{core} - \pi_{i, t-12}^{headline}) + \varepsilon_{i, t}$$

*   **Hypothesis:** A negative and statistically significant $\delta_i$ indicates that core inflation catches up to headline inflation spikes, confirming entrenched second-round effects.

### 3. Aggregate Demand Disaggregation
To challenge the traditional demand-pull paradigm, OLS specifications isolate disaggregated quarterly aggregate demand components:
$$\pi_{i}^{headline} = \gamma_0 + \gamma_1 C_i + \gamma_2 I_i + \gamma_3 G_i + \gamma_4 XN_i + \upsilon_i$$

$$\pi_{i}^{core} = \delta_0 + \delta_1 C_i + \delta_2 I_i + \delta_3 G_i + \delta_4 XN_i + \phi_i$$

Where:
*   $C_i$: Domestic Consumption Growth (YoY)
*   $I_i$: Gross Fixed Capital Formation / Investment Growth (YoY)
*   $G_i$: Government Expenditure Growth (YoY)
*   $XN_i$: Net Exports Growth (YoY)

## Key Technical Findings
*   **Transitory Regimes:** India ($\beta = -1.11$) and China ($\beta = -1.12$) demonstrate robust headline-to-core reversion, signaling that headline shocks are transitory due to credible frameworks like Flexible Inflation Targeting (FIT).
*   **Second-Round Effects:** Russia ($\delta = -1.25$), Brazil ($\delta = -1.12$), and South Africa ($\delta = -0.74$) exhibit severe core-to-headline propagation.
*   **Supply-Side Tools:** In China, Brazil, and Russia, government expenditure and fixed capital formation are negatively associated with headline inflation, proving that state-led spending functions as a tool for supply-side capacity optimization rather than pure demand stimulation.

## Project Structure
*   `/data`: Raw and processed macroeconomic variables sourced from national statistical agencies, the IMF, and Bloomberg Terminal (1971–2024).
*   `/scripts`: Cleaned R and Python data scripts detailing variable transformations, time-series alignments, OLS model metrics, and ggplot2 visualizations.

*Note: Scripts and underlying matrix sheets are currently being formatted for full open-source compliance and will be live shortly.*
