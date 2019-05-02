# The role of Photosymbiosis in Coral Physiology

### Biological question
Photosymbiosis is a mutualistic relationship between a host organism and photosynthetic microbes or algae. My driven question for this project is how the symbiotic status effect on the hosts’ physiology. In particular, I will look for how symbionts’ presence, density, diversity influent on hosts’ growth rate, calcification rate and gross photosynthetic rate.

### Context (introduction)
Photosymbiosis is a mutualistic relationship between a host organism and photosynthetic microbes or algae. The host takes advantage of photosynthetic energy provided by the symbionts while the symbionts benefit from a safe habitat and inorganic nutrients from host cells, such as nitrogen (Roth 2014). This relationship is crucial to tropical marine ecosystems, including coral reefs, due to its energy advantages in the oligotrophic oceans.  Photosymbioses have evolved between dinoflagellates of the family Symbiodiniaceae and diverse groups of hosts ranging from single-celled foraminiferans, simple multicellular animals such as sponges, to complex organisms such as corals and bivalves (Darling et al. 1996; Steindler, Beer, and Ilan 2002; Kirkendale 2009; Roth 2014). Although corals have become a research focus in recent decades due to the ecological threats they are facing, the research of them have been rarely focusing on large-scale trait-based data. This research gap prevents us from developing an in-depth understanding of the ecology of photosymbiosis.

To our knowledge, only those reef-building corals have established a symbiotic relationship with photosynthetic microbe or algae. The symbionts provide nutrient to the hosts, facilitate the calcification processes and influent the distribution of hosts (Ayre and Hughes 2004). Thus, the symbiotic relationship must have greatly shaped coral’s physiology during their evolution. In this study, I hypothesis that the growth rate of zooxanthellate corals would higher than non-zooxanthellate ones and there is a correlation between symbiotic diversity or density and their rates.

### Methods
#### Data Description
The original study use data science technique to gather data of coral traits. By linking organism’s fitness and function with their ecological and evolutionary research, trait-based study have been used for decades. However, These data are usually limited in small scales thus is not applicable to large-scale question. The goal of this study is 1) to gather disparate data on coral traits in order to link trait data it to large-scale ecological questions, 2) to make the trait data easy to obtain and open to public, 3) to engage the coral reef research community in the gathering and quality-control of coral trait data. Overall, the goal of this study is to produce a high-quality, open source coral trait database for the coral research community (Madin et al. 2016).

The trait data are retrieved from hundreds of published resources, including peer-reviewed papers, book chapters and taxonomic monographs (Detailed are not described in the original paper). In addition, observation records can be continuously imported to the database by the coral research community through the [CoralTrait website](https://coraltraits.org). The author did not conduct any further analyzation upon gathering data.

As for the datafile, all the records are included in a csv file with reference identification number. In addition , there is the other csv file containing reference information. The data file is 14.2 Megabytes containing 84131 records of coral traits. There are 56 traits for 1547 species. Traits are grouped into following categories: biomechanical, conservation, ecological, geographical, morphological, phylogenetic, physiological, reproductive, stoichiometric, and contextual. Overall, the dataset looks good due to the quality control process in data assembling. However, since only a few species have been comprehensively measured in large geographical scales, some gaps do exist.



##### My Analysis:
First, I need to select the traits of interest based on the data availability and quality. There are 107 types of traits in this database. I picked some key symbiotic-related traits such like “Symbiodinium subclade”, “Symbiodinium density” and some key physiological traits like "Growth rate" and  "Calcification rate". I also picked some distribution-related rate like “Geographical region” and “Ocean basin”. Then I subset each trait and counted the number of data of each one. Since my study is about large-scale ecology of corals, only those traits with significant amount of data are selected for future analysis.

Second, I conducted some correlation analyses between some photosymbiotic traits and some physiological traits. For instance, I filtered the datafile and get two subsets, one is growth rate for each species, the other is symbiont density for each species. Then I merged these two data frames by the species name. Based on the new data frame with growth rate and symbiont density for each species, I conducted  correlation analysis using the build-in function in R and then plotted a scatter plot of the two traits using ggplot2 package.

Third, I compared some physiological traits for those with and without symbionts. I conducted a t-test based on the data frame with growth rate and symbiotic status. Then I plotted a box plot suing ggplot2.


### Results and conclusions
Based on the data availability and quality, I finally pick up four physiological traits, including growth rate and calcification rate and three photosymbiotic traits, including chlorophyll a concentration, Symbiodinium subclade and Symbiodinium density. As for the biogeographic analysis, there are some overlaps of species in different geographic regions and the trait data are not distinguished for the same species in different regions. As a result, biogeographic analysis cannot be done based on the information in the database.

As shown in Figure. 1, it is obvious that there is no relationship between symbiotic density and growth rate. Figure. 2 shows that there is no relationship between between symbiotic density and calcification rate either. There are two outliers in those two figures: a species with high symbiotic density but normal calcification/growth rate and a species with normal symbiotic density but extraordinary calcification/growth rate. Overall, the symbiotic density does not effect on the selected physiological trait. However, those rates are highly effected by the environment factors. Those factors are not controlled during the measurement for those species. As a result, we cannot conclude if the symbiotic density effects growth/calcification rate or not. It is possible that the hosts are occupied by symbionts more than they need and the photosynthetic activities are restricted by environment factors such as light availability.

![](https://github.com/Ruiqi-CUB/CompBioLabsAndHomework/blob/master/Project/Assign09/Assign09_Figure1.png)
![](https://github.com/Ruiqi-CUB/CompBioLabsAndHomework/blob/master/Project/Assign09/Assign09_Figure2.png)

As for the symbiotic diversity, there is no apparent pattern found in this study (Figure 3, Figure 4). However, it seems that hosts with the least and most number of symbiotic subclades tend to have higher productivity. There are some possible explanations: First, hosts with only one kind of symbiont might be able to establish a stable relationship with its symbiont. The stability of the photosymbiotic relationship might result in the higher growth rate. Second, hosts with higher numbers of symbionts might have a strong ability to uptake a variety of symbionts, which also favors their growth.

![](https://github.com/Ruiqi-CUB/CompBioLabsAndHomework/blob/master/Project/Assign09/Assign09_Figure3.png)
![](https://github.com/Ruiqi-CUB/CompBioLabsAndHomework/blob/master/Project/Assign09/Assign09_Figure4.png)

The presence of symbionts does not influence the growth rate of corals either. As shown in Figure 5, there is no significant difference between those with and without zooxanthellae. The average of non-zooxanthellate coral growth rate is even higher than zooxanthellate corals’. This might because of the calcification consuming energy in zooxanthellate corals.

![](https://github.com/Ruiqi-CUB/CompBioLabsAndHomework/blob/master/Project/Assign09/Assign09_Figure5.png)

Overall, my project did not find any pattern of how symbionts’ presence, density, diversity influent on hosts’ physiological status. There are some trends like non-zooxanthellate coral have higher average growth rate but more high quality data is needed to draw a concise conclusion.

###Reference

Ayre, David J., and Terence P. Hughes. 2004. “Climate Change, Genotypic Diversity and Gene Flow in Reef-Building Corals.” Ecology Letters 7 (4): 273–78. [https://doi.org/10.1111/j.1461-0248.2004.00585.x](https://doi.org/10.1111/j.1461-0248.2004.00585.x).

Darling, K. F., D. Kroon, C. M. Wade, and A. J. Leigh Brown. 1996. “Molecular Phylogeny of the Planktic Foraminifera.” The Journal of Foraminiferal Research 26 (4): 324–30. [https://doi.org/10.2113/gsjfr.26.4.324](https://doi.org/10.2113/gsjfr.26.4.324).

Kirkendale, Lisa. 2009. “Their Day in the Sun: Molecular Phylogenetics and Origin of Photosymbiosis in the ‘other’ Group of Photosymbiotic Marine Bivalves (Cardiidae: Fraginae).” Biological Journal of the Linnean Society 97 (2): 448–65. [https://doi.org/10.1111/j.1095-8312.2009.01215.x](https://doi.org/10.1111/j.1095-8312.2009.01215.x).

Madin, Joshua S., Kristen D. Anderson, Magnus Heide Andreasen, Tom C.L. Bridge, Stephen D. Cairns, Sean R. Connolly, Emily S. Darling, et al. 2016. “The Coral Trait Database, a Curated Database of Trait Information for Coral Species from the Global Oceans.” Scientific Data 3: 170174. [https://doi.org/10.1038/sdata.2016.17](https://doi.org/10.1038/sdata.2016.17).

Roth, Melissa S. 2014. “The Engine of the Reef: Photobiology of the Coral-Algal Symbiosis.” Frontiers in Microbiology 5 (AUG): 1–22. [https://doi.org/10.3389/fmicb.2014.00422.](https://doi.org/10.3389/fmicb.2014.00422).

Steindler, L, S Beer, and M Ilan. 2002. “Photosymbiosis in Intertidal and Subtidal Tropical Sponges.” Biochemistry 33: 1–11.



