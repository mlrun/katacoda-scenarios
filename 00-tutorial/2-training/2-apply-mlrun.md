Open the `trainer.py`{{open}} code file, notice the line:

```python
apply_mlrun(model=model, model_name="my_model", 
            x_test=x_test, y_test=y_test)
```

`apply_mlrun()` accepts the model object and various optional parameters. When specifying the 
`x_test` and `y_test` data it will generate various plots and calculations to evaluate the model.
metadata and parameters are automatically recorded (from MLRun `context` object) and dont need to be specified.

`apply_mlrun` is farmework specific and can be imported from [MLRun's **frameworks**](https://docs.mlrun.org/en/latest/api/mlrun.frameworks/index.html) 
package &mdash; A collection of commonly used machine and deep learning frameworks fully supported by MLRun.

`apply_mlrun` can be used with its default settings, but it is highly flexible and rich with different options and 
configurations. We highly suggest reading the docs of your favorite framework:
- [SciKit-Learn](https://docs.mlrun.org/en/latest/api/mlrun.frameworks/mlrun.frameworks.sklearn.html)
- [TensorFlow (and Keras)](https://docs.mlrun.org/en/latest/api/mlrun.frameworks/mlrun.frameworks.tf_keras.html)
- [PyTorch](https://docs.mlrun.org/en/latest/api/mlrun.frameworks/mlrun.frameworks.pytorch.html) 
- [XGBoost](https://docs.mlrun.org/en/latest/api/mlrun.frameworks/mlrun.frameworks.xgboost.html) 
- [LightGBM](https://docs.mlrun.org/en/latest/api/mlrun.frameworks/mlrun.frameworks.lgbm.html) 
- [ONNX](https://docs.mlrun.org/en/latest/api/mlrun.frameworks/mlrun.frameworks.onnx.html)
