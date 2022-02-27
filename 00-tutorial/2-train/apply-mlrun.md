<details>
<summary>The environment is being set up using <code>pip install mlrun[api] scikit-learn plotly</code> (may take a few minutes)</summary>

* `mlrun[api]` &mdash; MLRun including its API requirements
* `scikit-learn`  &mdash; As our ML framework to develop our model.
* `plotly` &mdash; In order to plot some artifacts of our training.

</details>

In the meantime, we will start by reviewing MLRun's model development features.

Developing a model in MLRun is a breeze, allowing you to **focus on the research and training**, and not on battling 
with code, docs, logs collection, plotting, workers, multiprocessing and so on. 

With just one line of code, MLRun is seamlessly being integrated onto your code, enabling essential features for 
**experiment tracking** and **smart resourceful training**. The features includes:

* **Automatic logging** of:
  * Plot Artifacts (like loss convergence, confusion matrix, feature importance and many more)
  * Metrics
  * Dataset Artifacts (like the dataset used for training and / or testing)
  * Custom code (like custom layers, metrics and so on)
  * Model Artifact (enabling versioning and loading the model with ease)
* **Distributed training** using:
  * Horovod (for TensorFlow and PyTorch)
  * Dask (for SciKit-Learn, XGBoost and LightGBM)
* And more.

The MLRun **one line** magic is:

```python
apply_mlrun(model=my_model, model_name="my_model")
```

The function `apply_mlrun` can be imported from [MLRun's **frameworks**](https://docs.mlrun.org/en/latest/api/mlrun.frameworks/index.html) 
package &mdash; A collection of commonly used machine and deep learning frameworks fully supported by MLRun.

`apply_mlrun` can be used with its default settings, but it is highly flexible and rich with different options and 
configurations. We highly suggest reading the docs of your favorite framework.
<details>
<summary>Click here to view docs links to all the machine and deep learning frameworks MLRun is fully supporting.</summary>

You may click on the required framework to go to its documentation in MLRun's docs:

* [SciKit-Learn](https://docs.mlrun.org/en/latest/api/mlrun.frameworks/mlrun.frameworks.sklearn.html)
* [TensorFlow (and Keras)](https://docs.mlrun.org/en/latest/api/mlrun.frameworks/mlrun.frameworks.tf_keras.html)
* [PyTorch](https://docs.mlrun.org/en/latest/api/mlrun.frameworks/mlrun.frameworks.pytorch.html)  
* [XGBoost](https://docs.mlrun.org/en/latest/api/mlrun.frameworks/mlrun.frameworks.xgboost.html) 
* [LightGBM](https://docs.mlrun.org/en/latest/api/mlrun.frameworks/mlrun.frameworks.lgbm.html) 
* [ONNX](https://docs.mlrun.org/en/latest/api/mlrun.frameworks/mlrun.frameworks.onnx.html) 

</details>
