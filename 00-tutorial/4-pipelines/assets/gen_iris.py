# Copyright 2021 Iguazio
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
import pandas as pd
import mlrun
from sklearn.datasets import load_iris


def iris_generator(context, format="csv"):
    """a function which generates the iris dataset"""
    iris = load_iris()
    iris_dataset = pd.DataFrame(data=iris.data, columns=iris.feature_names)
    iris_labels = pd.DataFrame(data=iris.target, columns=["label"])
    iris_dataset = pd.concat([iris_dataset, iris_labels], axis=1)

    context.logger.info("saving iris dataframe to {}".format(context.artifact_path))
    context.log_result("label_column", "label")
    context.log_dataset("dataset", df=iris_dataset, format=format, index=False)


if __name__ == "__main__":
    with mlrun.get_or_create_ctx("iris_generator", upload_artifacts=True) as context:
        iris_generator(context, context.get_param("format", "csv"))
