# The Role of Photosymbiosis in Coral Physiology

## Introduction

Photosymbiosis is a mutualistic relationship between a host organism and photosynthetic microbes or algae. The host takes advantage of photosynthetic energy provided by the symbionts while the symbionts benefit from a safe habitat and inorganic nutrients from host cells, such as nitrogen. This relationship is crucial to tropical marine ecosystems, including coral reefs, due to its energy advantages in the oligotrophic oceans. My driving questions for this project are how some photosymbiotic-related traits (e.g. Symbiodinium density) are correlated with some physiological traits (e.g. growth rate) and whether the relation is different in different geographical regions. I will use a coral trait database to explore the question.

<hr>

## Summary of Data to be Analyzed

### Goals of original study that produced the data (~1 paragraph)

Coral reefs are ecologically important ecosystem as it provide nutrient and refuges to a range of marine species in oligotrophic tropical seas. For decades, scientists have devoted great efforts to studying scleractiniathe (stony corals), a group of key species of coral reefs. Recently the reef-building corals have become a research focus due to the ecological threats they are facing. By linking organism’s fitness and function with their ecological and evolutionary research, trait-based study have been used for decades. However, These data are usually limited in small scales thus is not applicable to large-scale question. The goal of this study is 1) to gather disparate data on coral traits in order to link trait data it to large-scale ecological questions, 2) to make the trait data easy to obtain and open to public, 3) to engage the coral reef research community in the gathering and quality-control of coral trait data. Overall, the goal of this study is to produce a high-quality, open source coral trait database for the coral research community.

### Brief description of methodology that produced the data

The trait data are retrieved from hundreds of published resources, including peer-reviewed papers, book chapters and taxonomic monographs (Detailed are not described in the original paper). In addition, observation records can be continuously imported to the database by the coral research community through the [CoralTrait website](https://coraltraits.org).

### Type of data in this data set:

Both categorical and continuous data are include in the dataset. For each measurement or observation, primary data source was recorded.

#### Format of data  

All the records are included in a csv file with reference identification number. In addition , there is the other csv file containing reference information.

#### Size of data (i.e., megabytes, lines, etc.)

The data file is 14.2 Megabytes containing 84131 records of coral traits. There are 56 traits for 1547 species. Traits are grouped into following categories: biomechanical, conservation, ecological, geographical, morphological, phylogenetic, physiological, reproductive, stoichiometric, and contextual.

#### Any inconsistencies in the data files?  Anything that looks problematic?  

Overall the dataset looks good due to the quality control process in data assembling. However, since only a few species have been comprehensively measured in large geographical scales, some gaps do exist.

<hr>

## Detailed Description of Analysis to be Done and Challenges Involved

1.  First, I will do data tidying to make the database executable. I will select some continuous traits related to photosymbiosis , such as number of Symbiodinium clades, Symbiodinium density and some physiological traits, such like growth rate, calcification rate. I will filer these traits based on those traits and the geographical region. Second, I will make bar graphs using ggplot2 to see if there are any difference between hard corals from different regions and if there is any correlation between the selected traits. Finally, if I find any obvious patterns in the previous step, I will select a proper model to test the statistical significance and further explore the relationship.

2. The first challenge in my project is the data tidying. The original database contains lots of information but is not executable for statistical analysis. Second, Not all of the species have been comprehensively investigated and measure , especially for the physiological data. Thus, I may not have enough data of some of my candidate traits. Third, statistical tests and models are involved in this project. I need to learn how to select the best model and interpret the results properly.

<hr>

## References 

Madin, J. S., Anderson, K. D., Andreasen, M. H., Bridge, T. C., Cairns, S. D., Connolly, S. R., . . . Baird, A. H. (2016). The Coral Trait Database, a curated database of trait information for coral species from the global oceans. Scientific Data,3, 160017. [doi:10.1038/sdata.2016.17]( https://doi.org/10.1038/sdata.2016.17)

[CoralTrait website](https://coraltraits.org)
