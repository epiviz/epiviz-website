+++
date = "2017-01-17T14:08:04-05:00"
title = "Visual Analysis of MSD16s Dataset"
author = "Justin Wagner"
weight = 1
toc = true
draft = true

+++

Today we will discuss using all the UI features of Metaviz to examine the Moderate to Severe childhood diaherrial disease dataset.  This dataset consists of case and control samples from children under the age of 6.  A total of 992 samples are present that are spread across 4 countries.  We will explore one country in detail and use heatmaps and stacked line plots to examine the differences in observed abundance of microbiome features at all levels a taxonomic hierarchy.

## Creating a Navigation Widget for Exploration of a Taxonomic Hierarchy of Features

The landing page of metaviz.cbcb.umd.edu will show a blank workspace and a tool bar at the top.  We will first choose a dataset and add a navigation device to the workspace in these next steps.

![InitialMetavizView](/images/metaviz/LandingPage.png)

The first interaction we have with the Metaviz app is to click on the 'Add Visualizations' icon.  

![Add Visualizations](/images/metaviz/VisualizationsTab.png)

A drop-down menu will appear from which 'Add new icicle' can be selected.

![Add Visualizations](/images/metaviz/DropDownSelection.png)

A pop-up measurement browser displays all datasets available in the UMD Metaviz database.  For this workflow, click on the 'msd16s' datasource and then click 'Finish'.  

![Select From Popup](/images/metaviz/PopupSelection.png)

What is displayed in the Metaviz workspace is called a 'FacetZoom' object that shows the a limited section of the taxonomic hierarchy at one time.  A 'FacetZoom' object can be used to explore the observed features in the dataset and aggregate counts to specific nodes or levels in the hierarchy.  We will introduce 'FacetZoom' functionality as needed throughout this workflow.  A 'FacetZoom' object controls the views of data visualizations we will add in the next sections.

![Facet Zoom Initial View](/images/metaviz/FacetZoomInitial.png)

## Creating Heatmap linked to taxonomic hierarchy and navigation updates

The next step will be to add a heatmap that is linked to the 'FacetZoom' navigation widget and show how the components are linked to allow us to explore the data.  For this demonstration, we focus on 50 samples from the same country.  For this dataset, we chose to focus on the samples from Bangladesh as they are evenly split between case and control. In order to add a heatmap, we will need to click 'Add Visualizations' then 'Add new heatmap'.  Once the measurement browser pop-up appears, select the 'msd16s' datasource and click 'next'.The lowest level of the FacetZoom is the level of aggregation for data visualizations we will add next.  

![](/images/metaviz/HeatmapPopup1.png)

Now the samples in the dataset are listed. Click on the 'Selected Columns' tab.    

![](/images/metaviz/HeatmapPopup2.png)

The 'Selected Columns' tab lists all the data fields available for the samples and will be different across datasets.  

![](/images/metaviz/HeatmapMeasurementSelection3.png)

In order to select an equal number of case and control samples from one country, click on 'Country' and 'Dysentery'.

![](/images/metaviz/HeatmapMeasurementSelection4.png)

Then select '25' for the 'Show Entries' drop-down configuration.

![](/images/metaviz/HeatmapMeasurementSelection5.png)

Clicking on a column header will sort the samples based on that attribute.  First click on 'Dysentery'

![](/images/metaviz/HeatmapMeasurementSelection6.png)

Next sort by country by clicking the column header for 'Country'

![](/images/metaviz/HeatmapMeasurementSelection7.png)

Now highlight 25 'Control' samples from Bangladesh and follow this by selecting 25 Bangladesh Case samples followed by clicking 'Finish'.

![](/images/metaviz/HeatmapMeasurementSelection8.png)

We now see a blank heatmap added to the Metaviz workspace above the 'FacetZoom' object.  We also can notice a dark grey bar at the top of the Navigation Widget.  This selects which features in the hierarchy are plotted in the heatmap.  The samples we selected appear to have no observed counts for those features and we therefore need to modify the selection of features to visualize.

![](/images/metaviz/HeatmapFacetZoomInitial.png)

On the 'FacetZoom' navigation widget, expand the navigation bar to include on features by clicking on the red end of the navigation bar and dragging to the specified length. The buttons with arrows in the upper left hand corner of the Navigation Widget control the navigation bar and can be used to move left, right, and expand to cover all features. 

![](/images/metaviz/HeatmapFacetZoomNavBarExpandFinished.png)

Now that we can see entries in the heatmap, we can change the settings by clicking the fourth icon in the upper right-hand menu of the heatmap object. Every component in Metaviz has a settings menu from which to modify many of the charts attributes.  

![](/images/metaviz/HeatmapFacetZoomCustomSettings.png)

Now adjust the settings in the pop-up menu.  The first is 'row labels', which will be done by clicking on the drop-down menu by clicking 'name' and changing the selection to 'Dysentery'.

![](/images/metaviz/HeatmapFacetZoomCustomSettingsPopup.png)

Next Toggle the 'Row labels as colors' to 'ON'.

![](/images/metaviz/HeatmapFacetZoomCustomSettingsComplete.png)

The 'Max Value' settings is the count value that the intensity of the heatmap is mapped to. Set this value to '100' and propagate these changes by clicking 'OK'.

![](/images/metaviz/HeatmapFacetZoomCustomSettingsDone.png)

Next, to modify the color scheme for the row label colors, click on the secocnd icon 'Colors' in the heatmap object.  

![](/images/metaviz/HeatmapFacetZoomColors.png)

The color scheme pop-up now appears. From the drop-down menu select 'D3 Category 10' followed by 'Ok'. 

![](/images/metaviz/HeatmapFacetZoomColorsDropDown.png)

Now observe the color settings modification.

![](/images/metaviz/HeatmapFacetZoomColorsCompleted.png)

##  Creating PCA Plot

The next step will be to generate a PCA ordination plot over the samples selected.  First, from the 'Add Visualizations' drop down menu.

![](/images/metaviz/AddPCADropDown.png)

Click 'Add new PCA scatter'

![](/images/metaviz/AddPCAPopupInit.png)

Select the Heatmap samples, this is designated by msd16s_plot-heatmap-EU1va which is a random id assigned to every chart on the Metaviz workspace, then click 'next'.

![](/images/metaviz/AddPCAPopupSelected.png)

Chose 'Select All' and Finish.

![](/images/metaviz/AddPCASelectedAll.png)

Now a PCA plot will appear

![](/images/metaviz/PCAPlotAdded.png)

Then adjust the 'settings' to have the Min Y and Min X as -1 along with Max X and Max Y to 1.  Also, chose 'Color By' on 'Dysentery' Status.

![](/images/metaviz/PCASettingsSelected.png)

## Creating Stacked Line Plots for Case and Control

The next step will be to add stacked line plots for Case and Control samples.  In order to do this, again click on 'Add Visualizations' then 'Add new stacked plot'.  

![](/images/metaviz/AddStackedPlot.png)

In the pop-up measurement browser, there will be a new entry 'msd16s_plot-heatmap-yxy3D' which is the measurements that were selected to build the heatamp and PCA scatter plot.  Click on this datasource then 'Next'.  

![](/images/metaviz/AddStackedPlotHeatmapMeasurements.png)

Click on the 'Selected Columns' tab to add 'Dysentery' status, select '25' for the 'Show Entries' drop-down configuration, then click on the 'Dysentery' column heading to arrange by status.  Highlight the Case samples and click 'Finish'.  

![](/images/metaviz/AddStackedPlotChooseCaseReal.png)

A new Stacked Line Plot for the case samples is now present in the workspace.

![](/images/metaviz/AddStackedPlotCaseChosen.png)

Then perform the same process but selecting the control samples. 

![](/images/metaviz/AddStackedPlotChooseControl.png)

Now another Stacked Line Plot for the control samples is present in the workspace.

![](/images/metaviz/AddStackedPlotCaseandControl.png)

In order for all the components to fit in the screen, we can resize each component by selecting and dragging its border.

![](/images/metaviz/AddStackedPlotsResizing.png)

Also, we can show how to write custom Javascript within Metaviz for display, in this case we want to order the stacked-plot entries by AgeFactor. In the case samples stacked line plot, click on the third icon 'Code'.

![](/images/metaviz/StackedPlotCodeHover.png)

Now click the 'Order By' tab.

![](/images/metaviz/StackedPlotCodePopup.png)

In order for any modifications to take effect, we will need to set the radio button in the upper left corner to 'On'.

![](/images/metaviz/StackedPlotCodeOn.png)

Under the Mark method, we will change the function to take the current measurement 'm', retrieve its metadata by calling .annotation(), and choosing the 'AgeFactor' field to order by.

![](/images/metaviz/StackedPlotControlCodeHover.png)

Now we can modifying the settings for the Stacked Line Plot to show sample 'AgeFactor' instead of 'name'.

![](/images/metaviz/StackedPlotControlSettingsAgeFactor.png)

Now we have both case and control ordered by AgeFactor.

![](/images/metaviz/StackedPlotControlSettingsAgeFactorChanged.png)

Now we can group-by AgeFactor in the control samples by choosing the settings tab and setting 'group-by' to 'On' and choosing 'AgeFactor' as the field. 

![](/images/metaviz/StackedPlotControlGroupBy.png)

We can also perform that for the case samples.

![](/images/metaviz/StackedPlotCaseGroupBy.png)

## Adjusting the view navigation bar of the FacetZoom object

We can focus on specific features by adjusting the navigation bar in the FacetZoom object.  One specific function is the text-based search which can be used by typing in the text box in the menu bar 'Text Based Search'.  

![](/images/metaviz/TextSearchInitialBox.png)

To show the search through the feature space, start by typing the first few characters of 'Gammaproteobacteria' to see the auto-complete options in a drop down menu appear.   

![](/images/metaviz/TextSearchTyping.png)

We will then start typing 'Firmucutes'.

![](/images/metaviz/TextSearchTypingFirmicutes.png)

Choose 'Firmucutes', 'phylum' from the drop down menu. This will move the navigation bar to encompass that item. 

![](/images/metaviz/NavigationWidgetNavBarExpandAll.png)

Beyond text-based search, the navigation bar can be moved, expanded, and reduced by using either the controls in the left-hand corner of the FacetZoom object or by dragging the red ends of the navigation bar.

![](/images/metaviz/TextSearchFirmicutesComplete.png)


##  Navigate to see data visualizations update

Now we will navigate the FacetZoom object to see selections update the heatmap and stacked line plots. 

Now you can interact with the FacetZoom object by clicking on any node.  Clicking on a node at a lower level than the root of the hierarchy will render a new subtree.  Each node can is in one of three states: (1) expanded, which means that the children of the node are shown in visualizations, (2) aggregated, which means that the counts for all children nodes are summed to that node, or (3) removed, which means that the node and all of its children are removed from visualizations.

To show the states, we click through on the first node of the second row 'Proteobacteria' and then we also click directly on the node to show a new subtree and explore the feature hierarchy. To set aggregation for an entire level, adjust the row control to set the aggregation to another level.  Click on the fourth item, with an 'F' standing for 'Family' and now all counts are summed to the Family level nodes across the samples in the charts. 

![](/images/metaviz/NavigationWidgetTraverseHierarchySetFamily.png)

Next, we change the aggregation level back to Order and navigate to have 'Bacteria' as the root of the FacetZoom.  We then set some nodes to 'expanded', 'removed', and 'aggregated'. We made the following selections based on the appearance of the heatmap.  

![](/images/metaviz/NavigationBarRemovingAggregatingNodes.png)

Finally, all charts in the Metavize workspace are linked to the features on the FacetZoom control.  By hovering over any chart, we see that feature highlighted in all other charts as well as the path in the FacetZoom hierarchy. 

![](/images/metaviz/NavigationBarHighlightingPath.png)
