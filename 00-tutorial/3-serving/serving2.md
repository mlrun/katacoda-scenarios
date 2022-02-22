In this tutorial we build a model serving function with the default `router` topology (root router with one or more models).
Yoy can view the [Serving Graphs](https://docs.mlrun.org/en/stable/serving/serving-graph.html) documentation for more 
advanced topologies and multi-stage real-time pipelines.

We can use built-in (per framework) model server classes or define our own serving class which provides greater flexibility.

**Write a model serving class**

Model serving classes must inherit from `mlrun.serving.V2ModelServer`, and at the minimum implement the 
`load()` (download the model file(s) and load the model into memory) and `predict()` (accept request payload and 
return prediction/inference results) methods.

See the code of our `ClassifierModel` class in `serving.py`{{open}}

Model serving classes implement the full model serving functionality which include loading models, pre- and post-processing, 
prediction, explainability, and model monitoring.

See more details in MLRun documentation:
- [Creating a custom model serving class](https://docs.mlrun.org/en/stable/serving/custom-model-serving-class.html)
- [Model Server API](https://docs.mlrun.org/en/stable/serving/model-api.html)