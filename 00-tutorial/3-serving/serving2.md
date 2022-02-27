In this tutorial we build a simple model serving function with a `router` object and one or more models.
See the [Serving Graphs](https://docs.mlrun.org/en/stable/serving/serving-graph.html) documentation for more 
advanced topologies and multi-stage real-time pipelines.

<img src="./assets/pipeline.png" alt="pipeline" width="300"/>

We can use built-in (per framework) model server classes or define your own serving class ([**see documentation**](https://docs.mlrun.org/en/stable/serving/custom-model-serving-class.html)) which provides greater flexibility.

**Write a model serving class**

Model serving classes must inherit from `mlrun.serving.V2ModelServer`, and at the minimum implement the 
`load()` (download the model file(s) and load the model into memory) and `predict()` (accept request payload and 
return prediction/inference results) methods.

See the code of our `ClassifierModel` class in `serving.py`{{open}}

Model serving classes implement the full model serving functionality which include loading models, pre- and post-processing, 
prediction, explainability, and model monitoring. 

MLRun Serving API is compatible with Triton and [KFServing v2](https://github.com/kubeflow/kfserving/blob/master/docs/predict-api/v2/required_api.md).
See the [**full API documentation**](https://docs.mlrun.org/en/stable/serving/model-api.html).