## Epiviz Component Library

The Epiviz Component Library is a reusable and extensible data visualization library and application framework for genomic data. Epiviz Components can be integrated with most JavaScript libraries and frameworks designed for HTML. The component library is modular by design, reusable and natively extensible and therefore simplifies the process of managing and developing bioinformatic applications.

The library provides multiple data visualizations for both location (visualizing data along the genome genes tracks (epiviz-genes-track) or line tracks (epiviz-line-track)) and feature based data (visualizing quantitative measurements like gene expression with scatterplots (epiviz-scatter-plot) and heatmaps (epiviz-heatmap-plot)). A complete list is available in the documentation.

- [GitHub](http://github.com/epiviz/epiviz-chart)
- [Documentation](http://epiviz.github.io/epiviz-chart)
- [Data Source Components](http://epiviz.github.io/polymer/datasource/)   
- [Chart Components](http://epiviz.github.io/polymer/charts/)

## How to use

### Load dependencies (add this to html head)

<script src="https://gist.github.com/jkanche/9bb7f79637329d15199464afb31ee2a2.js?file=dependencies"></script>

<script src="https://ghcdn.rawgit.org/epiviz/epiviz-chart/master/cdn/jquery/dist/jquery.js"></script>
<script src="https://ghcdn.rawgit.org/epiviz/epiviz-chart/master/cdn/jquery-ui/jquery-ui.js"></script>
<script src="https://ghcdn.rawgit.org/epiviz/epiviz-chart/master/cdn/renderingQueues/renderingQueue.js"></script>

<script src="https://ghcdn.rawgit.org/epiviz/epiviz-chart/master/cdn/webcomponentsjs/webcomponents-lite.js"></script>
<link rel="import" href="https://ghcdn.rawgit.org/epiviz/epiviz-chart/master/cdn/epiviz-components.html">


### Add Visualiation components to the page 

<script src="https://gist.github.com/jkanche/9bb7f79637329d15199464afb31ee2a2.js?file=scatter-plot"></script>

<epiviz-scatter-plot
  dim-s='["ExpressionA", "ExpressionB"]'
  json-data='{
  "rows": {
         "end": [101454659,0,417130,0,0,83502,0,148863,0,0],
         "start": [101322295,0,463451,0,0,132428,0,63018,0,0],
         "chr": ["chr11","chr11","chr11","chr11","chr11","chr11","chr11","chr11","chr11","chr11"]
  },
  "cols": {
         "ExpressionA": [-0.188,0.153,-0.762,0.53,-0.776,-0.32,-0.731,6.503,11.087,10.569],
         "ExpressionB": [-0.325,-0.289,-0.523,1.417,-0.636,-0.89,-0.786,4.885,9.112,8.862]
  }
}'></epiviz-scatter-plot>

### A fancier example

Using data from http://epiviz.cbcb.umd.edu

<script src="https://gist.github.com/jkanche/9bb7f79637329d15199464afb31ee2a2.js?file=epiviz-environment"></script>

<epiviz-data-source provider-type="epiviz.data.WebServerDataProvider" provider-id="umd" provider-url="https://epiviz-dev.cbcb.umd.edu/api/"></epiviz-data-source>

<epiviz-environment chr="chr6" start=40076201 end=45076201 no-logo measurements='{"affy1":{
                    "id":"e070",
                    "name":"Expression Brain Germinal Matrix",
                    "type":"feature",
                    "datasourceId":"roadmap_rnaseq",
                    "datasourceGroup":"roadmap_rnaseq",
                    "dataprovider":"umd",
                    "formula":null,
                    "defaultChartType":null,
                    "annotation":null,
                    "minValue":-3,
                    "maxValue":20,
                    "metadata":["probe"]
                },
                "affy2":{
                    "id":"e071",
                    "name":"Expression Brain Hippocampus Middle",
                    "type":"feature",
                    "datasourceId":"roadmap_rnaseq",
                    "datasourceGroup":"roadmap_rnaseq",
                    "dataprovider":"umd",
                    "formula":null,
                    "defaultChartType":null,
                    "annotation":null,
                    "minValue":-3,
                    "maxValue":20,
                    "metadata":["probe"]
                },
                "genes": {
                    "id": "genes",
                    "name": "Genes",
                    "type": "range",
                    "datasourceId": "genes",
                    "datasourceGroup": "genes",
                    "dataprovider": "umd",
                    "formula": null,
                    "defaultChartType": "Genes Track",
                    "annotation": null,
                    "minValue": null,
                    "maxValue": null,
                    "metadata": ["gene", "exon_starts","exon_ends"]
                }
              }'>
        <epiviz-genes-track id="test" slot="charts" dim-s='["genes"]'></epiviz-genes-track>
        <epiviz-scatter-plot slot="charts" dim-s='["affy1", "affy2"]'></epiviz-scatter-plot>
</epiviz-environment>
