# Antimicrobial Resistance Burden Analysis using WHO Priority Pathogens and Global Burden of Disease Data

## Project Overview

Antimicrobial resistance (AMR) is one of the most pressing global public health challenges. To guide research, surveillance, and policy actions, the World Health Organization (WHO) released the Bacterial Priority Pathogens List (BPPL), identifying antibiotic-resistant bacteria of highest concern.

The latest WHO report refines the prioritization of antibiotic-resistant bacterial pathogens and categorizes them into three groups:

- **Critical priority**
- **High priority**
- **Medium priority**

These categories help guide research and development (R&D) of new antibiotics and inform public health interventions.

This project combines the WHO BPPL framework with disease burden data from the Global Burden of Disease (GBD) microbial database to analyze how antimicrobial resistance burden varies across countries and development levels.

Metrics such as **mortality** and **Disability-Adjusted Life Years (DALYs)** are used to evaluate the burden associated with antimicrobial resistance.

WHO report and GBD data reference:  
https://www.who.int/publications/i/item/9789240093461
https://vizhub.healthdata.org/microbe/

---

## Key Concepts

### Attributable vs Associated Burden

The GBD antimicrobial resistance dataset provides two types of burden estimates.

- **Attributable burden** - represents the number of deaths or DALYs **caused directly by antibiotic resistance**, the portion of disease burden that would not occur if antibiotics were still effective.

- **Associated burden** - represents the number of death or DALYs **linked to infection involving resistant bacteria, whether or not resistance was the main cause of the outcome.

### Socio-Demographic Index (SDI)

The **socio-demographic index** is a composite indicator used in the GBD study to measure a country's level of development. SDI is based on three components: income per capita, educational attainment and fertility rate in individuals younger than 25 years.  

Countries are classified into five SDI groups, enables comparision of disease burden across countries with different development levels:

1. **Low SDI** - ex. Niger and Chad
2. **Low-middle SDI** - ex. Laos and India
3. **Middle SDI** - ex. Brazil and Egypt
4. **High-middle SDI** - ex. China and Hungary
5. **High SDI** - ex. United States of America and Germany

Socio-demographic index reference:
https://ghdx.healthdata.org/record/gbd-2023-socio-demographic-index-sdi
