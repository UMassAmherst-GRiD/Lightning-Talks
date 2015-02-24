Principal Component Analysis
========================================================
author: Kostis G.
date: 

What are the principal components?
==================================
* Dynamics with the largest variance. 
* Easy to see in low dimensional datasets, not so much when $d>2$.

Trying to generate an "Aha" moment.
========================================================

<img src="pac-figure/unnamed-chunk-1-1.png" title="plot of chunk unnamed-chunk-1" alt="plot of chunk unnamed-chunk-1" style="display: block; margin: auto;" />


Trying to generate an "Aha" moment.
========================================================
<img src="pac-figure/unnamed-chunk-2-1.png" title="plot of chunk unnamed-chunk-2" alt="plot of chunk unnamed-chunk-2" style="display: block; margin: auto;" />

```
Importance of components:
                          PC1     PC2
Standard deviation     1.4110 0.09563
Proportion of Variance 0.9954 0.00457
Cumulative Proportion  0.9954 1.00000
```

Result of PCA
=========================================================

<img src="pac-figure/unnamed-chunk-3-1.png" title="plot of chunk unnamed-chunk-3" alt="plot of chunk unnamed-chunk-3" style="display: block; margin: auto;" />
* The dataset after doing PCA. 


Why do it?
=========================================================
* Allows us to see the important directions/dynamics of the dataset. 
* Sometimes suggests variables to drop because of not important interactions with the rest of the set! 




References
===========
* A tutorial on Principal Components Analysis, Jonathon Shlens
* Computing and visualizing PCA in R, R-bloggers.
* Principal Component Analysis, a how-to manual for R.
