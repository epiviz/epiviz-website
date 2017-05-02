+++
categories = [
  "news"
]
date = "2017-05-01T12:52:12-05:00"
title = "Epiviz Updates"
tags = [
  "update"
]
draft = true
+++

We have implemented several new features into the epiviz library and the web application. 


## Table of Contents
* [epivizR updates](#epivizr)
* [Introducing Epiviz desktop application](#epiviz-desktop)

<a name="epivizr">
## epivizR updates
</a>
    
* __`Save` and `Restart` an epivizR session__

    We are introducing shareable workspaces in epivizR R/Bioconductor package. Users can use the `save` method to write the current epivizR R-session to disk (as a .rda file) and load it back later using the `restartEpiviz` method. This helps users/researchers to share their epivizr sessions with collaborators. Option to include and exclude data are available when saving the session.

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

* __Serving data from epiviz server__

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

* __Load Workspace__

    We also added `load_workspace` method to load a workspace from an epivizR session. For example, if you know the `workspace_id` 

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



