+++
date = "2017-02-17T14:08:04-05:00"
title = "Visual Analysis of MSD16S Dataset"
author = "Justin Wagner"
weight = 3
toc = true
+++

Metaviz is a tool for interactive visualization and exploration of metagenomic sequencing data. It provides a novel navigation tool for exploring hierarchical feature data that is coupled with multiple data visualizations including heatmaps, stacked bar charts, and scatter plots. Metaviz supports a flexible plugin framework so users can add new d3 visualizations. 
This post shows how to use all the UI features of Metaviz to examine the Moderate to Severe childhood diaherrial disease (msd16s) dataset. 
A post providing an overview of Metaviz can be found [here](overview.html). 


The dataset we use here consists of case and control samples from children under the age of 6. A total of 992 samples are present that are spread across 4 countries. We will explore one country in detail and use heatmaps and stacked line plots to examine the differences in observed abundance of microbiome features at all levels a taxonomic hierarchy.

We provide a video showing the workflow in each section and also provide a step by step walkthrough with screenshots after the video.

## Create a Navigation widget and visualizing count values

The following video describes the workflow to add a navigation control to explore the taxonomic feature hierarchy and also add a heatmap to visualize the abundance matrix.

<video class="mejs-player" height=750 width=1200 controls>
    <source src="/videos/Video1.mp4" />
</video>


<details>
<summary>
**Click Here for a step by step walkthrough of this section**
</summary>

The landing page of http://metaviz.cbcb.umd.edu will show a blank workspace and a tool bar at the top. To explore the feature hierarchy of a dataset, We click on the 'Add Visualizations' button and
choose the 'Add new Navigation Control' from the drop-down menu. Then, a pop-up measurement browser displays all datasets available in the UMD Metaviz database.  

For this tutorial, choose the 'msd16s' datasource and then click 'Finish'.  

What is displayed in the Metaviz workspace is called a 'FacetZoom' control that shows a limited section of the taxonomic hierarchy at one time.  A 'FacetZoom' control can be used to explore the observed features in the dataset and aggregate counts to specific nodes or levels in the hierarchy.  We will introduce 'FacetZoom' functionality as needed throughout this workflow.  A 'FacetZoom' object controls the views of data visualizations that we will add in the next sections.

The next step will be to add a heatmap that visualizes the abundance matrix and is linked to the 'FacetZoom' navigation widget. For this dataset, we chose to focus on the samples from Bangladesh. In order to add a heatmap, we click 'Add Visualizations' then select 'Add new heatmap'.  Once the measurement browser pop-up appears, select the 'msd16s' datasource and click 'next'.

To show more annotations in the measurement browser, click on the 'Selected Columns' tab. The 'Selected Columns' tab lists all the data annotation fields available for the samples and will be different across datasets. In order to select an equal number of case and control samples from one country,click on 'Country' and 'Dysentery'.

To show more than '10' samples, change the 'Show Entries' configuration to '25'. Clicking on a column header will sort the samples based on that attribute. First sort samples by 'Dysentery' and then by 'Country'. Now highlight 25 'Control' samples from Bangladesh and follow this by selecting 25 'Case' samples followed by clicking 'Finish'.

We now see a blank heatmap added to the Metaviz workspace above the 'FacetZoom' control. We also can notice a dark grey bar at the top of the Navigation Widget. This sets the range of features in the hierarchy that are plotted in the heatmap.  
The samples we selected appear to have no observed counts for those features and we therefore need to modify the selection of features to visualize.

On the 'FacetZoom' navigation widget, expand the navigation bar to include on features by clicking on the red end of the navigation bar and dragging to the specified length. The buttons with arrows in the upper left hand corner of the Navigation Widget control the navigation bar and can be used to move left, right, and expand to cover all features. 

Now that we can see entries in the heatmap, we can change the settings by clicking the settings (fourth) icon in the upper right-hand menu of the heatmap object. Every component in Metaviz has a settings menu to modify many of the charts attributes. To change row labels from the currently displayed sample id's , change the row label setting to 'Dysentery'. Next Toggle the 'Row labels as colors' to 'ON'.

</details>

##  Adding a PCA Plot

This tutorial continues from the previous video and adds a PCA Plot to examine variance for the same set of samples to the existing workspace

<video class="mejs-player" height=750 width=1200 controls>
    <source src="/videos/Video2.mp4" />
</video>


<details>
<summary>
**Click Here for a step by step walkthrough of this section**
</summary>

The next step will be to generate a PCA ordination plot over the samples selected. Select 'Add new PCA scatter' from the 'Add Visualizations' button. Select the Heatmap samples, this is designated by msd16s_plot-heatmap-EU1va which is a random id assigned to every chart on the Metaviz workspace, then click 'next'. Chose 'Select All' to select all samples and 'Finish' to add a PCA plot to the workspace.

To differentiate between samples, we can adjust the 'Color By' setting and set it to 'Dysentery' Status.

</details>

## Creating Stacked Line Plots for Case and Control

This section describes the workflow to visualize feature proportions across case and control samples using Stacked Bar plots.

<video class="mejs-player" height=750 width=1200 controls>
    <source src="/videos/Video3.mp4" />
</video>


<details>
<summary>
**Click Here for a step by step walkthrough of this section**
</summary>

The next step will be to add stacked bar plots for case and control samples. In order to do this, again click on 'Add Visualizations' then select 'Add new stacked plot'. In the pop-up measurement browser, there will be an entry 'msd16s_plot-heatmap-yxy3D' which is the measurements that were selected to build the heatmap and PCA scatter plot. Click on this datasource then 'Next'. Click on the 'Selected Columns' tab to show 'Dysentery' status, select '25' from the 'Show Entries' drop-down configuration. To add a stacked plot for the case samples,  click on the 'Dysentery' column heading to arrange by status. Highlight the case samples and click 'Finish'.  

Now perform the same process and select control samples.

Also, we can show how to write custom JavaScript within Metaviz for display, in this instance we want to order the stacked plot entries by AgeFactor. In the case samples stacked bar plot, click on the third icon 'Code'. With the pop-up window, click the 'Order By' tab.

For any modifications to take effect, we will need to set the radio button in the upper left corner to 'On'. Under the 'Mark' method, we change the function to take the current measurement 'm', retrieve its metadata by calling .annotation(), and choosing the 'AgeFactor' field to order by.

Now we can modifying the settings for the stacked bar plot to show sample 'AgeFactor' instead of 'name'. We can apply this process to both case and control stacked bar plots and order them by 'AgeFactor'.

Now we can 'Group-by' 'AgeFactor' in the control samples by choosing the settings tab and setting 'Group-by' to 'On' and choosing 'AgeFactor' as the field. We can also perform that for the case samples.

</details>

## Exploring workspace and analysis using the FacetZoom navigation widget

This video describes how to modify the state of the FacetZoom navigation widget and propagating feature node states to other visualizations in the workspace.
We also provide a text based search to quickly navigate to the feature of interest.

<video class="mejs-player" height=750 width=1200 controls>
    <source src="/videos/Video4.mp4" />
</video>


<details>
<summary>
**Click Here for a step by step walkthrough of this section**
</summary>

Now that we have added a FacetZoom navigation widget and different charts that show different views of the abundace matrix, we can now focus on exploring the dataset and how changing state of the features effect the analysis. We can focus on a specific features by adjusting the navigation bar in the FacetZoom object. We provide text-based search to quickly navigate the FacetZoom widget to a feature. This can be done by typing in the text box in the menu bar 'Text Based Search'. Lets update the navigation bar in the FacetZoom widget to 'Firmicutes' by typing 'Firmucutes' in the text box.

Choose 'Firmucutes', 'phylum' from the drop down menu. This will move the navigation bar to encompass that item. 

Beyond text-based search, the navigation bar can be moved, expanded, and reduced by using either the controls in the left-hand corner of the FacetZoom object or by dragging the red ends of the navigation bar.

All charts in the Metavize workspace are linked to the features on the FacetZoom control.  By hovering over any chart, we see that feature highlighted in all other charts as well as the path in the FacetZoom hierarchy. 

Now we will modify the state of the feature nodes in the FacetZoom object to see selections propagate to the heatmap and stacked line plots. You can interact with the FacetZoom object by clicking on any node. Clicking on a node at a lower level than the root of the hierarchy will render a new subtree with the clicked node as the root. This helps navigate the hierarchy.  Each node can be in one of three states: 
(1) expanded, which means that the children of the node are shown in visualizations, 
(2) aggregated, which means that the counts for all children nodes are summed to that node, or 
(3) removed, which means that the node and all of its children counts are removed from visualizations.

To show the states, we click through on the first node of the second row 'Proteobacteria' and then we also click directly on the node to show a new subtree and explore the feature hierarchy. To set aggregation for an entire level, adjust the row control to set the aggregation to another level.  Click on the fourth item, with an 'F' standing for 'Family' and now all counts are summed to the Family level nodes across the samples in the charts. 

Next, we change the aggregation level back to Order and navigate to have 'Bacteria' as the root of the FacetZoom.  We then set some nodes to 'expanded', 'removed', and 'aggregated'. We made the following selections based on the appearance of the heatmap.  

</details>
