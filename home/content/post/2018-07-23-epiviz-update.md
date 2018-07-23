+++
categories = [
  "news"
]
date = "2018-07-23T12:52:12-05:00"
title = "Epiviz and Metaviz Updates"
tags = [
  "update",
  "metaviz",
  "polymer",
  "epivizr"
]
draft = true
+++

In this post we describe new features added to `epivizrChart` package, `epiviz-chart` the component library, and `metaviz` a metegenomics data browser.

## What's new!

- [Publications](#publications)
- [Updates to our component library](#epiviz-chart)
- [Updates to `epivizrChart`](#epivizrChart)
- [Updates to `Metaviz`](#metaviz)

<a name="publications">
## Publications
</a>

- `Metaviz`
- Our publication describing the component library using WebComponents and the Google Polymer library is available on F1000 (https://f1000research.com/articles/7-1096/v1) and is awaiting peer review.

<a name="epiviz-chart">
## Update to our component library `epiviz-chart`
</a>

- We've made several new updates to the epiviz components, primarily upgrading the library to Polymer 2.0 and optimizing the components for faster performance. We now have a layout system implemented in environment and navigation elements. Visualization components encapsulated in environment/navigation elements can be organized and resized to different layouts.

- We've also developed a new measurement browser (a polymer component) that effeciently renders large lists and has features to select and filter datasets to visualize. The measurement browser component is also published to webcomponents (https://www.webcomponents.org/element/epiviz/data-filter)

<a name="epivizrChart">
## Updates to `epivizrChart`
</a>

Last year, We introduced the `epivizrChart` package, an API to programmatically create and interactively visualize genomic data using our component library (http://github.com/epiviz/epiviz-chart). We've added a number of updates to our Bioconductor package.

- **Integration with Shiny**

We've updated our component library to be used within the shiny framework. The following snippet is a shiny app that creates a navigation element and adds a Heatmap for selected samples from the Gene Expression Barcode Project.

Note: When using epiviz components in a shiny app, set the parameter `shiny = true` to the rendering function. This enables the communication for data requests and events between R-session and the epiviz components in the shiny UI using the Shiny server connection.

```{r}
    library(epivizrChart)
    library(shiny)
    library(Homo.sapiens)
    library(epivizWorkshop)

    epivizNav <- epivizNav(chr="chr11", start=118000000, end=121000000, interactive=TRUE)
    genes_track <- epivizNav$add_genome(Homo.sapiens)
    blocks_track <- epivizNav$plot(cgi_gr, datasource_name="CpG_Islands")
    means_track <- epivizNav$plot(bcode_eset, datasource_name="Gene Expression Barcode", chart="HeatmapPlot")

    app <- shinyApp(
    ui=fluidPage(
        uiOutput("epivizChart")
    ),
    server=function(input, output, session) {

        output$epivizChart <- renderUI({
        epivizNav$render_component(shiny=TRUE)
        })

        # register for shiny events to manage data requests from UI
        epivizNav$register_shiny_handler(session)
    })
    app
```

We have a vignette "IntegrationWithShiny" in the Bioconductor `epivizrChart` package that demonstrates other use cases that include interacting with non epiviz components.

- **Improved API**

We've made several updates to the `epivizrChart` package to explore genomic datasets.

Users can now use `magrittr` with the package when using an environment or navigation elements. we added generic `append_region` that adds new navigational regions and `plot` method to add new charts to a workspace. The `append_region` returns the newly created navigational element and so any plot methods after that are added to this new region instead of the parent.

```{r}
    library(epivizrChart)
    library(Homo.sapiens)
    library(magrittr)

    data(tcga_colon_blocks)
    data(tcga_colon_curves)
    data(sumexp)

    epivizEnv <- epivizEnv()
    epivizEnv %>%
    plot(sumexp, datasource_name="sumExp", columns=c("cancer", "normal")) %>%
    append_region(chr="chr11", start=118000000, end=121000000) %>%
    plot(sumexp, datasource_name="sumExp", columns=c("normal", "cancer"))

    epivizEnv
```

We've also added several new methods to add new charts to either an environment/navigation or simply visualize a bioconductor genomic data object. The methods available are `BlocksTrack`, `StackedBlocksTrack`, `ScatterPlot`, `heatmapPlot`, `LineTrack`, `StackedLineTrack`, `LinePlot`, `StackedLinePlot`.

For example, to add a Heatmap to an environment, we create an environment element and use the HeatmapPlot method to visualize the data, in this case a summarized experiment object.

```{r}
    epivizEnv <- epivizEnv()
    HeatmapPlot(epivizEnv, sumexp, datasource_name="sumExp", columns=c("cancer", "normal"))
    epivizEnv
```

We can also explore data from a bioconductor object without an environment/navigational element.

```{r}
    scatter_plot <- ScatterPlot(tcga_colon_curves, chr="chr11", start=99800000, end=103383180, type="bp", columns=c("cancerMean","normalMean"))
    scatter_plot
```

<a name="metaviz">
## Updates to Metaviz
</a>
