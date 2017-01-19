+++
date = "2017-01-13T14:08:04-05:00"
title = "Longitudinal Data Analysis"
author = "Justin Wagner"
weight = 5
toc = true
draft = true

+++

Today we will discuss using Metaviz along with the Bioconductor package metagenomeSeq for longitudinal analysis.


## Generating metagenomeSeq objects and computing SS-ANOVA testing

We use a dataset from Paulson et al. when analyzing this time series data with a smoothing-spline.

First, import the etec16s dataset, select sample data from the first 9 days. Then use metavizr to launch an instance of the Metaviz app in a local web-browser.

```{r, eval=FALSE}
library(etec16s)
library(metagenomeSeq)
library(metavizr)
data(etec16s)
etec16s <- etec16s[,-which(pData(etec16s)$Day>9)]

app <- startMetaviz("http://metaviz.cbcb.umd.edu") 
```

![](/images/metaviz/SplineAppLaunch.png)

Next, use metagenomeSeq to fit a smoothing-spline to the time series data.

```{r, eval=FALSE}
featureData(etec16s)$Kingdom <- "Bacteria"
feature_order <- c("Kingdom", "Phylum", "Class", "Order", "Family", "Genus", "Species", "OTU.ID")

timeSeriesFits <- fitMultipleTimeSeries(obj=etec16s,
                             formula = abundance~id + time*class + AntiGiven,
                             class="AnyDayDiarrhea",
                             id="SubjectID",
                             time="Day",
                             lvl="Species",
                             feature_order = feature_order,
                             C=0.3,
                             B=1)
```

## Generating metavizR object to plot

For plotting the data using Metaviz, we set the fit values as y-coordinates and timepoints as x-coordinates.  We need to call 'toMRexperiment' with arguments for the sample and feature data, in this case timepoints and annotations, respectively.

```{r, eval=FALSE}
feature_order2 <- c("Kingdom", "Phylum", "Class", "Order", "Family", "Genus", "Species")

splinesMRexp <- ts2MRexperiment(timeSeriesFits, feature_data = featureData(aggregateByTaxonomy(etec16s, lvl="Species", feature_order = feature_order2)), sampleNames = timeSeriesFits[[2]]$fit$timePoints)
etec16s_species <- aggregateByTaxonomy(etec16s, lvl="Species", feature_order = feature_order)
```

## Choosing features to plot and adding a line plot to Metaviz

We select features with a timepoint with absolute log-fold change greater than 2. We add the MRexperiment as a measurement for Metaviz to plot the hierarchy as an icicle.

```{r, eval=FALSE}
splines_to_plot <- sapply(1:nrow(MRcounts(splinesMRexp)), function(i) {max(abs(MRcounts(splinesMRexp[i,]))) >= 2})
splines_to_plot_indices <- which(splines_to_plot == TRUE)

ic_plot <- app$plot(splinesMRexp[splines_to_plot_indices,], datasource_name = "etec16_base", control=metavizControl(norm = FALSE, aggregateAtDepth = 6), feature_order = feature_order2)
```

![](/images/metaviz/SplineAddIcicle.png)

We then use the 'revisualize' method to add a Line Plot for the smoothing spline.

```{r, eval=FALSE}
splineObj <- app$data_mgr$add_measurements(splinesMRexp[splines_to_plot_indices,], datasource_name = "etec16_base", control = metavizControl(norm=FALSE, aggregateAtDepth = 6))
splineMeasurements <- splineObj$get_measurements()
splineChart <- app$chart_mgr$visualize("LinePlot", splineMeasurements)
```

![](/images/metaviz/SplineLinePlotAdded.png)

## Updating chart settings from metavizR

We can update the colors and settings on the spline chart. For example, lets limit the y axis to be between -10 and 10. To do so we use the 'set_chart_settings' method. We can list existing settings for a chart using the 'list_chart_settings' function.

```{r, eval=FALSE, echo=FALSE}
# list available charts
app$chart_mgr$list_chart_types()

# list available settings for "LinePlot"
app$chart_mgr$list_chart_type_settings("LinePlot")

# update settings on splineChart 
settings <- list(yMin = -10, yMax = 10)
colors <- c("#1f77b4", "#ff7f0e", "#2ca02c", "#d62728", "#9467bd", "#8c564b", "#e377c2", "#7f7f7f", "#bcbd22", "#17becf")
app$chart_mgr$set_chart_settings(splineChart, settings=settings, colors = colors)
```

![](/images/metaviz/SplineLinePlotSettings.png)

We can interact with the Metaviz session, such as hovering over the Line Plot to see highlight the path through the hierarchy.

![](/images/metaviz/SplineLinePlotHover.png)

Also, we can hover in the icicle plot to highlight all features under that path in the Line Plot.

![](/images/metaviz/SplineIcicleHover.png)