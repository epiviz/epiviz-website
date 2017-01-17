+++
date = "2017-01-17T14:08:04-05:00"
title = "Metaviz Visual Analysis of MSD16s Dataset"
author = "Justin Wagner"
weight = 5
toc = true
draft = true

+++

Today we will discuss using the all the UI features of Metaviz to examine the Moderate to Severe childhood diaherrial disease dataset.  

I. Creating a Navigation Widget showing taxonomic hierarchy of features discovered through sequencing

![InitialMetavizView](/images/metaviz/LandingPage.png)

The first step will be to click on the 'Add Visualizations' icon.  

![Add Visualizations](/images/metaviz/VisualizationsTab.png)

A drop-down menu will appear from which 'Add new icicle' should be selected.

![Add Visualizations](/images/metaviz/DropDownSelection.png)

A pop-up measurement browser will now be shown, click on the msd16s datasource and then click 'Finish'.  

![Select From Popup](/images/metaviz/PopupSelection.png)


What is displayed on the screen is called a 'FacetZoom' object that shows the a limited section of the taxonomic hierarchy at one time.  The lowest level of the FacetZoom is the level of aggregation for data visualizations we will add next.  

![Facet Zoom Initial View](/images/metaviz/FacetZoomInitial.png)

II. Creating Heatmap linked to taxonomic hierarchy and navigation updates

The next step will be to add a heatmap that is linked to the navigation widget and show how the linked visualizations allow us to explore the data.  For this demonstration, we focus on 50 case and 50 control samples from the same country in order to show specific utilities.  In order to accomplish this, you will need to click 'Add Visualizations' then 'Add new heatmap'.  Once the measurement browser pop-up appears, select the 'msd16s' datasource, click 'next', then click on the 'Selected Columns' tab, click on 'Country' and 'Dysentery', then select '25' for the 'Show Entries' drop-down configuration.  

![](/images/metaviz/HeatmapPopup1.png)

![](/images/metaviz/HeatmapPopup2.png)


![](/images/metaviz/HeatmapMeasurementSelection3.png)

![](/images/metaviz/HeatmapMeasurementSelection4.png)

![](/images/metaviz/HeatmapMeasurementSelection5.png)

![](/images/metaviz/HeatmapMeasurementSelection6.png)

![](/images/metaviz/HeatmapMeasurementSelection7.png)

![](/images/metaviz/HeatmapMeasurementSelection8.png)


You will then need to click on the 'Country' then 'Dysentery' column headers to arrange the data.  Select the first Bangladesh Case samples then click the right arrow to move to the Control samples where you then select the first 25 Control samples followed by clicking 'Finish'.  

![](/images/metaviz/HeatmapFacetZoomInitial.png)

On the Navigation Widget, expand the navigation bar to include on features by clicking the button with arrows pointing both ways.  You can then change the settings of the heatmp by clicking the fourth icon (settings icon pic) in the upper right-hand menu in the heatmap object.  

![](/images/metaviz/HeatmapFacetZoomNavBarExpand.png)

![](/images/metaviz/HeatmapFacetZoomNavBarExpandFinished.png)


In the settings menu, you can change many of the charts attributes.  

![](/images/metaviz/HeatmapFacetZoomCustomSettings.png)

Click on this icon

![](/images/metaviz/HeatmapFacetZoomCustomSettingsPopup.png)



Now adjust the settings in the pop-up menu.  The first is 'row labels', which will be done by clicking on the drop-down menu by clicking 'name'.  Select the item 'Dysentery', toggle the 'Row labels as colors' to 'ON', and set the 'Max Value' to 100.  

![](/images/metaviz/HeatmapFacetZoomCustomSettingsComplete.png)

Propagate these changes by clicking 'OK'.

![](/images/metaviz/HeatmapFacetZoomCustomSettingsDone.png)

Next, to modify the color scheme, click on the secocnd icon in the heatmap object to change the color scheme.  

![](/images/metaviz/HeatmapFacetZoomColors.png)

The color scheme pop-up now appears.    

![](/images/metaviz/HeatmapFacetZoomColorsInitialPopup.png)

From the drop-down menu select 'D3 Category 10' followed by 'Ok'. 

![](/images/metaviz/HeatmapFacetZoomColorsDropDown.png)

Now observe the color settings modification

![](/images/metaviz/HeatmapFacetZoomColorsCompleted.png)

III.  Creating PCA Plot

The next step will be to generate a PCA ordination plot over the samples selected.  First, from the 'Add Visualizations' drop down menu  

![](/images/metaviz/AddPCADropDown.png)

Click 'Add new PCA scatter'

![](/images/metaviz/AddPCAPopupInit.png)

Select the Heatmap samples, this is designated by msd16s_plot-heatmap-XXX010 (Random ID) then click 'next'.

![](/images/metaviz/AddPCAPopupSelected.png)

Chose 'Select All' and Finish.

![](/images/metaviz/AddPCASelectedAll.png)

Now a PCA plot will appear

![](/images/metaviz/PCAPlotAdded.png)

Then adjust the `settings` to have the Min Y and Min X as -1 along with Max X and Max Y to 1.  Also, chose `Color By` Dysentery Status.

![](/images/metaviz/PCASettingsSelected.png)


IV. Creating Stacked Line Plots for Case and Control

The next step will be to add stacked line plots for Case and Control samples.  In order to do this, again click on 'Add Visualizations' then 'Add new stacked plot'.  

![](/images/metaviz/AddStackedPlot.png)


In the pop-up measurement browser, there will be a new entry 'msd16s_plot-heatmap-XYXYXY' which is the measurements that were selected to build the heatamp and PCA scatter plot.  Click on this datasource then 'Next'.  

![](/images/metaviz/AddStackedPlotHeatmapMeasurements.png)

Click on the 'Selected Columns' tab to add 'Dysentery' status, select '25' for the 'Show Entries' drop-down configuration, then click on the 'Dysentery' column heading to arrange by status.  Highlight the Case samples and click 'Finish'.  

![](/images/metaviz/AddStackedPlotChooseCaseReal.png)

![](/images/metaviz/AddStackedPlotCaseChosen.png)


Then perform the same process but selecting the control samples. 

![](/images/metaviz/AddStackedPlotChooseControl.png)

![](/images/metaviz/AddStackedPlotCaseandControl.png)

Now we can resize the different components to fit the screen.

![](/images/metaviz/AddStackedPlotsResizing.png)

Also, we can show how to write custom Javascript within Metaviz for display, in this case we want to order the stacked-plot entries by AgeFactor. Click on the third icon `Code`.

![](/images/metaviz/StackedPlotCodeHover.png)

![](/images/metaviz/StackedPlotCodePopup.png)

![](/images/metaviz/StackedPlotCodeOn.png)

![](/images/metaviz/StackedPlotControlCodeHover.png)

![](/images/metaviz/StackedPlotControlSettingsAgeFactor.png)

![](/images/metaviz/StackedPlotControlSettingsAgeFactorChanged.png)


![](/images/metaviz/StackedPlotControlGroupBy.png)

![](/images/metaviz/StackedPlotCaseGroupBy.png)

Now you can interact with the FacetZoom object by clicking on any node.  Clicking on a node at a lower level than the root of the hierarchy will render a new subtree.  Each node can is in one of three states: (1) expanded, which means that the children of the node are shown in visualizations, (2) aggregated, which means that the counts for all children nodes are summed to that node, or (3) removed, which means that the node and all of its children are removed from visualizations.

To show the states, we click through on the first node of the second row 'Proteobacteria' and then we also click directly on the node to show a new subtree and explore the feature hierarchy.

V. Adjusted the view navigation bar of the FacetZoom object

We can focus on specific features by adjusting the navigation bar in the FacetZoom object.  One specific function is the text-based search which can be used by typing in the text box in the menu bar 'Text Based Search'.  Type 'Bacilli' to see a drop down menu appear and chose the first item 'Bacilli X'.  This will move the navigation bar to encompass that item.  

![](/images/metaviz/TextSearchInitialBox.png)


![](/images/metaviz/TextSearchTyping.png)

![](/images/metaviz/TextSearchTypingFirmicutes.png)

![](/images/metaviz/TextSearchFirmicutesComplete.png)

Beyond text-based search, the navigation bar can be moved, expanded, and reduced by using either the controls in the left-hand corner of the FacetZoom object or by dragging the red ends of the navigation bar.

![](/images/metaviz/NavigationWidgetNavBarExpandAll.png)

VI.  Navigate to see data visualizations update

Now we will navigate the FacetZoom object to see selections update the heatmap and stacked line plots. Now, to set aggregation for an entire level, adjust the row control to set the aggregation to another level.  Click on the third-item, with a 'C' standing for 'Class' and now all counts are summed to the Class level nodes across the samples in the charts.  Next, navigate down the hierarchy by clicking on the 'Proteobacteria' node, followed by the 'YXY' node, then the 'ZYZ' node.  Click the aggregation level to 'S' then traverse back to the original FacetZoom by clicking on the highest-level node of the hierarchy until it is set to 'Bacteria'.  

![](/images/metaviz/NavigationWidgetTraverseHierarchySetFamily.png)





Next, set some nodes to 'expanded', 'removed', and 'aggregated'. We made the following selections based on the appearance of the heatmap.  

![](/images/metaviz/NavigationBarRemovingAggregatingNodes.png)

Finally, we see the highlight of the path in the hierarchy and across the heatmaps and stacked plots.

![](/images/metaviz/NavigationBarHighlightingPath.png)





