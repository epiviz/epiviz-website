+++
date = "2017-02-17T14:08:04-05:00"
title = "Visual Analysis of MSD16s Dataset - videos"
author = "Jayaram Kancherla, Justin Wagner"
weight = 3
toc = true
draft = true

+++

Today we will discuss using all the UI features of Metaviz to examine the Moderate to Severe childhood diaherrial disease (msd16s) dataset. This dataset consists of case and control samples from children under the age of 6. A total of 992 samples are present that are spread across 4 countries. We will explore one country in detail and use heatmaps and stacked line plots to examine the differences in observed abundance of microbiome features at all levels a taxonomic hierarchy.

We provide a video showing the workflow in each section and also provide a step by step walkthrough with screenshots after the video.

## Create a Navigation widget and visualizing count values

The following video describes the workflow to add a FacetZoom navigation widget to explore the taxonomic feature hierarchy and also add a heatmap to visualize the abundance matrix.

![Facet Zoom Tutorial](/images/metaviz/videos/Video1.gif)

<details>
<summary>
**Click Here for a step by step walkthrough of this section**
</summary>

The landing page of http://metaviz.cbcb.umd.edu will show a blank workspace and a tool bar at the top. To explore the feature hierarchy of a dataset, We click on the 'Add Visualizations' button and
choose the 'Add new Navigation Control' from the drop-down menu. Then, a pop-up measurement browser displays all datasets available in the UMD Metaviz database.  

![Select From Popup](/images/metaviz/PopupSelection.png)

For this tutorial, choose the 'msd16s' datasource and then click 'Finish'.  

What is displayed in the Metaviz workspace is called a 'FacetZoom' object that shows the a limited section of the taxonomic hierarchy at one time.  A 'FacetZoom' object can be used to explore the observed features in the dataset and aggregate counts to specific nodes or levels in the hierarchy.  We will introduce 'FacetZoom' functionality as needed throughout this workflow.  A 'FacetZoom' object controls the views of data visualizations that we will add in the next sections.

![Facet Zoom Initial View](/images/metaviz/FacetZoomInitial.png)

The next step will be to add a heatmap that visualizes the abundance matrix and is linked to the 'FacetZoom' navigation widget. For this dataset, we chose to focus on the samples from Bangladesh as they are evenly split between case and control. In order to add a heatmap, we click 'Add Visualizations' then select 'Add new heatmap'.  Once the measurement browser pop-up appears, select the 'msd16s' datasource and click 'next'.

![](/images/metaviz/HeatmapPopup1.png)

To show more annotations in the measurement browser, click on the 'Selected Columns' tab. The 'Selected Columns' tab lists all the data annotation fields available for the samples and will be different across datasets. In order to select an equal number of case and control samples from one country,click on 'Country' and 'Dysentery'.

![](/images/metaviz/HeatmapMeasurementSelection4.png)

To show more than '10' samples, select '25' from the 'Show Entries' drop-down configuration. Clicking on a column header will sort the samples based on that attribute. First sort samples by 'Dysentery' and then by 'Country'. Now highlight 25 'Control' samples from Bangladesh and follow this by selecting 25 Bangladesh Case samples followed by clicking 'Finish'.

![](/images/metaviz/HeatmapMeasurementSelection8.png)

We now see a blank heatmap added to the Metaviz workspace above the 'FacetZoom' object. We also can notice a dark grey bar at the top of the Navigation Widget. This selects which features in the hierarchy are plotted in the heatmap.  
The samples we selected appear to have no observed counts for those features and we therefore need to modify the selection of features to visualize.

![](/images/metaviz/HeatmapFacetZoomInitial.png)

On the 'FacetZoom' navigation widget, expand the navigation bar to include on features by clicking on the red end of the navigation bar and dragging to the specified length. The buttons with arrows in the upper left hand corner of the Navigation Widget control the navigation bar and can be used to move left, right, and expand to cover all features. 

![](/images/metaviz/HeatmapFacetZoomNavBarExpandFinished.png)

Now that we can see entries in the heatmap, we can change the settings by clicking the settings (fourth) icon in the upper right-hand menu of the heatmap object. Every component in Metaviz has a settings menu to modify many of the charts attributes. To change row labels from the currently displayed sample id's , change the row label setting to 'Dysentery'. Next Toggle the 'Row labels as colors' to 'ON'.

![](/images/metaviz/HeatmapFacetZoomCustomSettingsDone.png)

Next, to modify the color scheme for the row label colors, click on the second icon 'Colors' in the heatmap object. The color scheme pop-up now appears. From the drop-down menu select 'D3 Category 10' followed by 'Ok'. 

![](/images/metaviz/HeatmapFacetZoomColorsDropDown.png)

Now observe the color settings modification.

![](/images/metaviz/HeatmapFacetZoomColorsCompleted.png)
</details>

##  Creating PCA Plot

This tutorial continues from the previous video and adds a PCA Plot to examine variance for the same set of samples to the existing workspace

![PCA Plot Tutorial](/images/metaviz/videos/Video2.gif)

<details>
<summary>
**Click Here for a step by step walkthrough of this section**
</summary>

The next step will be to generate a PCA ordination plot over the samples selected. Select 'Add new PCA scatter' from the 'Add Visualization' drop down menu. Select the Heatmap samples, this is designated by msd16s_plot-heatmap-EU1va which is a random id assigned to every chart on the Metaviz workspace, then click 'next'. Chose 'Select All' to select all samples and Finish to add a PCA plot to the workspace.

![](/images/metaviz/PCAPlotAdded.png)

To differentiate between case and control 'Dysentery' status, we can adjust the 'Color By' setting and set it to 'Dysentery' Status.

![](/images/metaviz/PCASettingsSelected.png)

</details>

## Creating Stacked Line Plots for Case and Control

This section describes the workflow to visualize feature profiles across case and control samples using Stacked Line plots.

![Stacked Line Plot Tutorial](/images/metaviz/videos/Video3.gif)

<details>
<summary>
**Click Here for a step by step walkthrough of this section**
</summary>

The next step will be to add stacked line plots for Case and Control samples. In order to do this, again click on 'Add Visualizations' then select 'Add new stacked plot'. In the pop-up measurement browser, there will be a new entry 'msd16s_plot-heatmap-yxy3D' which is the measurements that were selected to build the heatmap and PCA scatter plot. Click on this datasource then 'Next'. Click on the 'Selected Columns' tab to show 'Dysentery' status, select '25' for the 'Show Entries' drop-down configuration. To add a stacked plot for the case samples,  click on the 'Dysentery' column heading to arrange by status. Highlight the Case samples and click 'Finish'.  

![](/images/metaviz/AddStackedPlotChooseCaseReal.png)

A new Stacked Line Plot for the case samples is now present in the workspace.

![](/images/metaviz/AddStackedPlotCaseChosen.png)

Then perform the same process but selecting the control samples. Now another Stacked Line Plot for the control samples is present in the workspace.

![](/images/metaviz/AddStackedPlotCaseandControl.png)

Also, we can show how to write custom Javascript within Metaviz for display, in this case we want to order the stacked-plot entries by AgeFactor. In the case samples stacked line plot, click on the third icon 'Code'. Now click the 'Order By' tab.

![](/images/metaviz/StackedPlotCodePopup.png)

In order for any modifications to take effect, we will need to set the radio button in the upper left corner to 'On'. Under the Mark method, we will change the function to take the current measurement 'm', retrieve its metadata by calling .annotation(), and choosing the 'AgeFactor' field to order by.

![](/images/metaviz/StackedPlotCodeOn.png)

After setting your changes, the stacked plot will now change columns to 'ageFactor' instead of sample Id's.

![](/images/metaviz/StackedPlotControlCodeHover.png)

Now we can modifying the settings for the Stacked Line Plot to show sample 'AgeFactor' instead of 'name'. we can apply this process to both case and control Stacked Line plots and order them by AgeFactor.

![](/images/metaviz/StackedPlotControlSettingsAgeFactorChanged.png)

Now we can group-by AgeFactor in the control samples by choosing the settings tab and setting 'group-by' to 'On' and choosing 'AgeFactor' as the field. We can also perform that for the case samples.

![](/images/metaviz/StackedPlotCaseGroupBy.png)

</details>

## Exploring workspace and analysis using the FacetZoom navigation widget

This video describes how to modify the state of the FacetZoom navigation widget and propagating feature node states to other visualizations in the workspace.
We also provide a text based search to quickly navigate to the feature of interest.

![Facet Zoom Tutorial](/images/metaviz/videos/Video4.gif)

<details>
<summary>
**Click Here for a step by step walkthrough of this section**
</summary>

Now that we have added a FacetZoom navigation widget and different charts that show different views of the abundace matrix, we can now focus on exploring the dataset and how changing state of the features effect the analysis. We can focus on a specific features by adjusting the navigation bar in the FacetZoom object. We provide text-based search to quickly navigate the FacetZoom widget to a feature. This can be done by typing in the text box in the menu bar 'Text Based Search'. Lets update the navigation bar in the FacetZoom widget to 'Firmicutes' by typing 'Firmucutes' in the text box.

![](/images/metaviz/TextSearchTypingFirmicutes.png)

Choose 'Firmucutes', 'phylum' from the drop down menu. This will move the navigation bar to encompass that item. 

![](/images/metaviz/NavigationWidgetNavBarExpandAll.png)

Beyond text-based search, the navigation bar can be moved, expanded, and reduced by using either the controls in the left-hand corner of the FacetZoom object or by dragging the red ends of the navigation bar.

![](/images/metaviz/TextSearchFirmicutesComplete.png)


###  Navigate to see data visualizations update

Now we will modify the state of the feature nodes in the FacetZoom object to see selections propagate to the heatmap and stacked line plots. You can interact with the FacetZoom object by clicking on any node. Clicking on a node at a lower level than the root of the hierarchy will render a new subtree with the clicked node as the root. This helps navigate the hierarchy.  Each node can be in one of three states: 
(1) expanded, which means that the children of the node are shown in visualizations, 
(2) aggregated, which means that the counts for all children nodes are summed to that node, or 
(3) removed, which means that the node and all of its children counts are removed from visualizations.

To show the states, we click through on the first node of the second row 'Proteobacteria' and then we also click directly on the node to show a new subtree and explore the feature hierarchy. To set aggregation for an entire level, adjust the row control to set the aggregation to another level.  Click on the fourth item, with an 'F' standing for 'Family' and now all counts are summed to the Family level nodes across the samples in the charts. 

![](/images/metaviz/NavigationWidgetTraverseHierarchySetFamily.png)

Next, we change the aggregation level back to Order and navigate to have 'Bacteria' as the root of the FacetZoom.  We then set some nodes to 'expanded', 'removed', and 'aggregated'. We made the following selections based on the appearance of the heatmap.  

![](/images/metaviz/NavigationBarRemovingAggregatingNodes.png)

Finally, all charts in the Metavize workspace are linked to the features on the FacetZoom control.  By hovering over any chart, we see that feature highlighted in all other charts as well as the path in the FacetZoom hierarchy. 

![](/images/metaviz/NavigationBarHighlightingPath.png)

</details>
