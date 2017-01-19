+++
date = "2017-01-17T14:08:04-05:00"
title = "MetagenomeSeq Differential Analysis"
weight = 5
toc = true
draft = true

+++

Today we will discuss using Metaviz along with the Bioconductor package metagenomeSeq to compute differential abundance and visualize the results.  We will show many utilities of Metaviz to further analyze and explore the data with the goal of statistically-guided interactive visualization.

First, several libraries will need to be downloaded and loaded:

```{r, eval=FALSE}
library(metagenomeSeq)
library(msd16s)
library(metavizr)
```
## Generating metagenomeSeq objects and computing differential abundance

The first step will be in an R session to load metagenomeSeq and compute differential abundance.  We will use the msd16s again and focus on the samples from Bangladesh to subset the 992 'msd16s' samples to those 301 from Bangladesh.  First, we will aggregate the count matrix to the species level.  Once having subset the data, we normalize count data using a metagenomeSeq function. Next, we set aggregation level to "class", will find features DA at this level and then change an push those changes to an MRexperiment that is aggreagted to "species" level, and then explore the hiearchy.

```{r, eval=FALSE}
feature_order <- c("superkingdom", "phylum", "class", "order", "family", "genus", "species", "OTU")
aggregated_feature_order <- feature_order[1:7]

msd16s_species <- msd16s
fData(msd16s) <- fData(msd16s)[feature_order]
fData(msd16s_species) <- fData(msd16s_species)[aggregated_feature_order]
  
bangladesh <- msd16s[, which(pData(msd16s)$Country == "Bangladesh")]
bangladesh_species <- msd16s_species[, which(pData(msd16s_species)$Country == "Bangladesh")]

aggregated_species <-  cumNorm(aggregateByTaxonomy(bangladesh_species, lvl="species"), p = 0.75)

aggregation_level <- "class"
aggregated_bangladesh <- aggregateByTaxonomy(bangladesh, lvl=aggregation_level)

normed_bangladesh <-  cumNorm(aggregated_bangladesh, p = 0.75)
bangladesh_sample_data <-  pData(normed_bangladesh)
mod <-  model.matrix(~1+Dysentery, data = bangladesh_sample_data)
results_bangladesh <-  fitFeatureModel(normed_bangladesh, mod) # Check: ?results_bangladesh
```

```{r, eval=FALSE}
logFC_bangladesh <- MRcoefs(results_bangladesh, number = nrow(normed_bangladesh))

feature_names <- rownames(logFC_bangladesh[which(logFC_bangladesh[which(abs(logFC_bangladesh$logFC) > 1),]$adjPvalues < .1),]) 
fSelection <- metavizr:::generateSelection(feature_names =feature_names , aggregation_level = aggregation_level, selection_type =2)
```

We now have the list of features that have a log fold-change greater than 2 and an adjusted p-value less than .1 between case and control samples from Bangladesh.  

The differential abundance cutoff can be set to a different threshold and the aggregation level can also be changed to examine the dataset.

## Creating metavizR object

The next step will be to launch a Metaviz instance from R, add a FacetZoom object, modify the node selections to show those nodes that are differentially abundant, and add a  heatmap.  In order to accomplish this, you will need to load the 'metavizr' package.  Then we will create a Metaviz instance by calling 

```{r, eval=FALSE}
app <- startMetaviz(host="http://metaviz.cbcb.umd.edu/")
```

This will open a new Metaviz session on the default browser.  

![](/images/metaviz/AppInitial.png)

Then, to add a FacetZoom object of the msd16s hierarchy the following call is made to create a Metaviz control object then add plots: 

```{r, eval=FALSE}
control <- metavizr::metavizControl(featureSelection = fSelection)
icicle_plot <- app$plot(aggregated_species, datasource_name="mmssdd", control=control, feature_order = aggregated_feature_order)
```

The 'plot' function adds the object to the Metaviz session.

![](/images/metaviz/IciclePlotPushed.png)

##  Adding heatmap

This step is simple using metavizr, all that needs to be done is call the 'revisualize' method to add another visualization of the same data.

```{r, eval=FALSE}
heatmap <- app$chart_mgr$revisualize(chart_type = "HeatmapPlot", chart = icicle_plot)
```

![](/images/metaviz/HeatmapAdded.png)

## Modifying Settings and Exploring with the FacetZoom object

First, we group-by Dysentery and modify the color settings.  To accomplish this we click on the 'Custom Settings' icon:

![](/images/metaviz/HeatmapSettingsHover.png)

This launches a pop-up dialog window with all available chart settings.

![](/images/metaviz/HeatmapSettingsPopup.png)

The first setting to change is the 'Row labels' which will be set to 'Dysentery'

![](/images/metaviz/HeatmapSettingsDysentery.png)

Next, move the 'Row labels as colors' radio control to 'On'

![](/images/metaviz/HeatmapSettingsGroupByOn.png)

Now the heatmap rows will color by the dysentery status.

![](/images/metaviz/HeatmapSettingsComplete.png)

We would then like to update the settings of the color scheme.  

![](/images/metaviz/HeatmapColorSettings.png)

We select an RColorBrewer template which is appropriate.

![](/images/metaviz/HeatmapColorSettingsComplete.png)

As with a FacetZoom object added from the UI, a user can modify node states in order to examine the statistical test result.  We modify the navigation widget by modifying the 'Actinobacteria' status from removed to aggregated. 

![](/images/metaviz/NavigationWidgetActino.png)

We can then hover on the new column of the heatmap to highlight the path through the hierarchy.

![](/images/metaviz/NavigationWidgetActinoHover.png)

A user can also traverse the hierarchy and change the aggregation setting for all nodes at a given level. To show this utility, we navigate to a lower level of the hierarchy by clicking on the 'Proteobacteria' node and set the aggregation level to 'Genus' by clicking on the row control node.

![](/images/metaviz/NavigationWidgetDescendProteoBacteriaSetGenusAsAgg.png)

Then we can hover on a column that appears to show a difference between case and control samples.

![](/images/metaviz/NavigationWidgetHeatmapHoverShigella.png)