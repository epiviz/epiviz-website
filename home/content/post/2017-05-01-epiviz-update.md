+++
categories = [
  "news"
]
date = "2017-05-15T12:52:12-05:00"
title = "Epiviz Updates for Bioconductor 3.5 Release"
tags = [
  "update",
  "metaviz",
  "polymer",
  "epivizr"
]
draft = true
+++

Bioconductor version 3.5 was released last month: http://bioconductor.org/news/bioc_3_5_release/. 
This Bioconductor version
includes updates to `epivizr` and a new package, `metavizr`, for interactive visualization 
of metagenomic data. In this post we describe these, and take the opportunity to update
on other developments in the Epiviz project.



## What's new!  
* [epivizr updates](#epivizr)
* [Introducing Epiviz desktop application](#epiviz-desktop)
* [Metavizr now on R/Bioconductor](#metavizr)
* [Introducing Polymer](#polymer)

<a name="epivizr">
## epivizr updates
</a>
    
* __`Save` and `Restart` an epivizr session__

    We are introducing shareable workspaces in epivizr R/Bioconductor package. Users can use the `save` method to write the current epivizr R-session to disk (as a .rda file) and load it back later using the `restartEpiviz` method. This helps users/researchers to share their epivizr sessions with collaborators. Options to include and exclude data are available when saving the session.

    ```{r}
        require(epivizr)
        app <- startEpiviz()

        ....
        add plots and data
        ....

        # to save the session 
        app$save(file="path/to/file/app.rda", include_data=TRUE)

        # to reload a saved session
        app <- restartEpiviz(file="path/to/file/app.rda", open_browser=TRUE)
    ```

* __`revisualize` method__

    The revisualize method makes it easy to use existing measurements from another epiviz chart object and create a new chart object for a different chart type. 

    ```{r}
        means_track <- app$plot(tcga_colon_curves, datasource_name="450kMeth",type="bp",columns=c("cancerMean","normalMean"))

        heatmap_plot <- app$chart_mgr$revisualize(chart_type = "HeatmapPlot", chart = means_track)
    ```

* __Visualizing data hosted in a remote epiviz server__

    We added a `load_remote_measurements` method that loads measurements and visualize data hosted at UMD with an interactive r-session. This helps develop integrative analysis workflows. 

    ```{r}
        # start an epivizr session
        app <- startEpiviz()

        # load remote measurements
        app$load_remote_measurements()
        remote_measurements <- app$data_mgr$get_remote_measurements()

        # For example, lets find measurements to visualize data from gene expression barcode project for tumor and normal samples from lung, colon and breast tissues.
        measurementList <- lapply(remote_measurements, function(m) {
            if(m@name %in% c("colon normal", "lung normal", "breast normal", "colon tumor", "lung tumor", "breast tumor") && m@datasourceId == "gene_expression_barcode_subtype") {
                m
            }
        })
        measurements <- Filter(Negate(is.null), measurementList)

        # add a heatmap with the queried measurements
        app$chart_mgr$visualize("HeatmapPlot", measurements = measurements)
    ```

With this new feature we can use the epivizr package to fully reproduce the construction of 
epiviz visualizations using an R script.

* __Load Workspace__

    We also added `load_workspace` method to load a workspace in the epiviz app using epivizr session. For example, if you know the `workspace_id` 

    ```{r}
        app <- startEpiviz()
        app$load_workspace(workspace_id="Ago25FdPLVb")
    ```

<a name="epiviz-desktop">
## Introducing Epiviz Desktop Application
</a>

We packaged Epiviz into a self contained desktop application for PC, Linux and Mac using the electron framework. Electron framework is being used by several applications including slack, git-kraken, microsoft visual code editor, atom editor etc.. Similar to the epiviz web application, the desktop application can be used as a standalone app where it serves data hosted at UMD. The desktop application can also visualize data from an interactive r-session by using [`epivizrStandalone` R/Bioconductor package] (https://bioconductor.org/packages/release/bioc/html/epivizrStandalone.html). 

To install the epiviz standalone application for your platform, please visit- **[Epiviz-desktop github release page] (https://github.com/epiviz/epiviz-desktop-app/releases/tag/0.0.1)**


To launch the desktop app that can load data from an R session - 

```
    require(epivizrStandalone)
    require(epivizr)

    app <- startStandaloneApp()

    # to add data, the api is similar to epivizr
    data(tcga_colon_blocks)
    app$plot(tcga_colon_blocks)

    # to load a workspace,
    app$load_workspace(workspace_id="Ago25FdPLVb")
```

Note: Please allow installation of epiviz as a system application so that it can be launched from the command line.

<a name="metavizr">
## Metavizr now on Bioconductor (release 3.5)
</a>

We recently released our [metaviz](http://metaviz.org) application for interactive analysis
of metagenomic data. It's companion R/Bioconductor pacakge, `metavizr`, implements two-way communication between the R/Bioconductor environment and the metaviz web app. The hierarchy of features from a microbiome sequencing result can be visualized with a hierarchical navigation utility and count values are displayed dynamically updated heatmaps or stacked bar plots. `metavizr` uses Websockets for communication between the browser Javascript client and the R environment. The `metavizr` package was released in Bioconductor 3.5.

To install metavizr through Bioconductor and try the package vignette, 

```{r}
    # install packahe
    BiocInstaller::biocLite("metavizr")

    #load vignette
    require(metvizr)
    browseVignettes("metavizr")
```

There are multiple tutorials on metaviz available on the metaviz [tutorial page](https://epiviz.github.io/tutorials/metaviz/), covering the application interactive visualization facilities and how to perform visual and statistical analysis using metavizr and metagenomeSeq.
For more information, please visit the [R/Bioconductor page](http://www.bioconductor.org/packages/release/bioc/html/metavizr.html). If you have any problems, please post an issue on our [Github page](http://github.com/epiviz/metavizr). A preprint describing metaviz and metavizr is available on biorxiv: http://biorxiv.org/content/early/2017/03/06/105205.

<a name="polymer">
## Introducing epiviz polymer components
</a>

Note: This is currently a work in progress.

We have been developing and exploring new ways to make our chart components versatile and extensible across various platforms and applications. We are developing epiviz [webcomponents](https://developer.mozilla.org/en-US/docs/Web/Web_Components) using the [Google Polymer library](https://www.polymer-project.org/). We developed custom web components for 

* Handling data requests([epiviz-data-source](https://github.com/epiviz/epiviz-data-source))

    This components handles data requests from a websocket/webserver connection. To add this element to a page, 

    ```{html}
        <epiviz-data-source
            provider-type="epiviz.data.WebServerDataProvider" 
            provider-id="umd" 
            provider-url="http://epiviz.cbcb.umd.edu/data/main.php">
        </epiviz-data-source>
    ```

* Visualizing data ([epiviz-charts-* components](https://github.com/epiviz/epiviz-chart))

    We are developing epiviz chart components for our existing track and plot based charts. This includes genes track, blocks track, scatter plots, line plots, stacked-line plots, heatmaps etc.

    To add any of these to your page, for example a genes track

    ```{html}
        <epiviz-genes-track use-default-data-provider="true"></epiviz-genes-track>
    ```

    Some of the new components we are developing are epiviz-environment and epiviz-navigation components. 

    ### epiviz-environment
    The main purpose of this component is to enable brushing and event handling across all its child elements. `epiviz-environment` can contain multiple charts as its children. When you hover over one of the charts, this sends an event to the environment. The environment then handles brushing of the key or region corresponding to the datapoint that was hovered across all the other charts in the environment.

    For example, to add an environment on your page

    ```{html}
        <epiviz-environment>
            <epiviz-genes-track class="charts" use-default-data-provider="true"></epiviz-genes-track><br/>
            <epiviz-scatter-plot class="charts" use-default-data-provider="true"></epiviz-scatter-plot><br/>
            <epiviz-blocks-track class="charts" use-default-data-provider="true"></epiviz-blocks-track><br/>
            <epiviz-stacked-line-plot class="charts" use-default-data-provider="true"></epiviz-stacked-line-plot><br/>
            <epiviz-stacked-line-track class="charts" use-default-data-provider="true"></epiviz-stacked-line-track><br/>
            <epiviz-heatmap-plot class="charts" use-default-data-provider="true"></epiviz-heatmap-plot><br/>
        </epiviz-environment>
    ```

    ### epiviz-navigation
        
    Our current epiviz application has genomic location defined at the application level. So all charts visualize data to only that region in the genome. To simultaneosuly look at data from multiple regions in the genome, we are adding a new component - `epiviz-navigation`. `epiviz-navigation` inherits from `epiviz-environment` and in addition, adds ui elements to easily navigate (change genomic location) or search (for genes/targets) the genome. A page can have multiple navigation components and navigation components can also be enclosed within an environment element. This enables us to visualize an entire dataset (using `epiviz-environment`) and also look at a specific region (using `epiviz-navigation`) at the same time. 

    ```{html}
        <epiviz-environment
            chr="chr6">
            # these charts show data from the entire chromosome (chr6)
            <epiviz-genes-track class="charts" use-default-data-provider="true"></epiviz-genes-track><br/>
            <epiviz-scatter-plot class="charts" use-default-data-provider="true"></epiviz-scatter-plot><br/>

            # the charts inside the navigation only show data for the region defined below
            <epiviz-navigation                   
                chr="chr6"
                start="64076201"
                end="95088740" 
                class="charts">
                    <epiviz-genes-track class="charts" dim-s='["genes"]'></epiviz-genes-track>
                    <epiviz-scatter-plot class="charts" dim-s='["affy1", "affy2"]'></epiviz-scatter-plot>
            </epiviz-navigation>
        </epiviz-environment>
    ```

### To install epiviz webcomponents (through [bower](http://bower.io/))

    ```{JavaScript}
        bower init
        bower install --save epiviz/epiviz-chart
        bower install --save epiviz/epiviz-data-source
    ```

These webcomponents are the building blocks for our upcoming update to the epiviz and metaviz web applications and, more importantly, the ability to embed epiviz visualizations in rmarkdown documents.
To be part of our development, please install our components and let us know if you have any feedback or issues (through [Github](http://github.com/epiviz/epiviz-chart)).


