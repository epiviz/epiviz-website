
+++
categories = [
  "features"
]
date = "2014-10-28T12:00:00-05:00"
title = "New Clustering Feature for Heatmap Plots"
tags = [
  "features"
]

+++

* **[See it in Epiviz 4](http://epiviz.cbcb.umd.edu/4/?ws=wZJc0JKhWK&settings=default)**
* **[See it in Epiviz 3](http://epiviz.cbcb.umd.edu/3/?ws=wZJc0JKhWK&settings=default)**
* **[See it in Epiviz 2](http://epiviz.cbcb.umd.edu/2/?ws=UqaReWj5Sd&settings=default)**

We implemented a new **Clustering** feature in the *Heatmap Plot*! You can use it to group together
measurements using the values in the selected region.

For example, we selected the following samples in the *gene expression barcode*: ```kidney normal``` and ```tumor```,
```lung normal``` and ```tumor```, ```esophagus normal``` and ```tumor```, ```breast normal``` and ```tumor```,
```stomach normal``` and ```tumor```.

In the *custom settings* menu of the newly generated chart, we enabled clustering:

![Heatmap Custom Settings](/images/heatmap_clustering_dialog.png)

This causes the rows to be re-ordered according to the clustering, and a dendrogram to be displayed:

![Heatmap Clustering](/images/heatmap_clustering.png)

* **[See it in Epiviz 4](http://epiviz.cbcb.umd.edu/4/?ws=wZJc0JKhWK&settings=default)**
* **[See it in Epiviz 3](http://epiviz.cbcb.umd.edu/3/?ws=wZJc0JKhWK&settings=default)**
* **[See it in Epiviz 2](http://epiviz.cbcb.umd.edu/2/?ws=UqaReWj5Sd&settings=default)**
