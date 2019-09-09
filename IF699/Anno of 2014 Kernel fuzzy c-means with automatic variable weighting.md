# 2014 - Kernel fuzzy c-means with automatic variable weighting

## 1. Intro

* Girolami's first development of kernel k-means algorithm [5], clustering methods such as fuzzy c-means [6] were created;

* Kernelization of the metric, where the centroids are obtained in the original space and the distances between patterns and centroids are computed by means of kernels;

* Important hard clustering algorithms based on kernels were developed in Refs [13-16] and **Kernel-based fuzzy clustering methods have been proposed in Refs [17-20];

* Moreover, various studies have demonstrated that the kernel clustering methods outperform the conventional clustering approaches when the data have a complex structure, because these algorithms my produce non-linear separating hyper-surfaces among clusters [12,13,25-29];

* In Ref [30] the authors developed a kernel-based clustering algorithm able to learn the weights of the variables during the clustering process dynamically. This algorithm belongs to the class of methods based on the kernelization of the metric and can be viewed as a clustering scheme based on a local adaptative distance that changes at each algorithm iteration and is different from one cluster to another. The changes are defined by the weights of the variables within each cluster. They also proved convergence of their algorithm and proposed a slightly modified version for clustering incomplete datasets.

* Is proposed a variable-wise kernel fuzzy c-means clustering method where dissimilarity are obtained as sums of Euclidean distances between patterns and centroids computed individually for each variable by means of kernel functions. The advantage of  the proposed approach over the conventional kernel clustering methods is that it allows us to use adaptive distances which change at each algorithm iteration and can either be the same for all clusters (global adaptive distances) or different from on cluster  to another (local adaptive distances). This kind of dissimilarity measure is suitable to learn the weights of the variables during the clustering process, improving the performance of the algorithms. 

* The method presented in [30] was developed based only in local adaptive distances with the constraint that the weiths must sum one and considering only the approach of kernelization of the metric. In some situations local adaptive distances may not be appropriate because they can lead the algorithm to fall into local minima, providing suboptimal solutions. For this reason, we developed adaptive methods based on both types of adaptive distances, local and global, and we also took into account the approach of clustering in feature space. Moreover, the derivation of the expressions of the relevance weights of the variables was done considering two cases> one assumes that the weights must sum one, whereas the other assumes that the product of the weights must be one [31]. Another advantage of this approach is that it allows the introduction of various fuzzy partition and cluster interpretation tools.

## 2. Conventional kernel fuzzy clustering methods


