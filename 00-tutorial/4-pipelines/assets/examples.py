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
import mlrun
from pprint import pprint

inputs = {"dataset": "./artifacts/dataset.csv"}


def run(local=True):
    project = mlrun.load_project("./")

    # run the trainer function using the input data and print outputs
    run_results = project.run_function("trainer", inputs=inputs, local=local)
    print("Outputs:\n")
    pprint(run_results.outputs)


def run_hyper(local=True):
    project = mlrun.load_project("./")

    # run the trainer function with hyper params (Grid search)
    hparams = {"n_estimators": [100, 500, 1000], "max_depth": [5, 15, 30]}
    run_results = project.run_function(
        "trainer", inputs=inputs, hyperparams=hparams, selector="max.accuracy", local=local
    )

    # print outputs and a table of child run results
    print("Outputs:\n")
    pprint(run_results.outputs)
    print("\nExperiment Results:\n")
    print(run_results.artifact("iteration_results").as_df().to_string())


def simple_pipe(max_depth=5):
    project = mlrun.load_project("./")

    # run the data generation function
    get_data = project.run_function("gen-iris", local=True)

    # use the dataset output as input to the training function
    trainer = project.run_function(
        "trainer", local=True,
        inputs={"dataset": get_data.outputs["dataset"]},
        params={"max_depth": max_depth},
    )

    # Import ML Serving function from MLRun marketplace, and add the trained model to it
    serving_fn = mlrun.import_function("hub://v2_model_server", new_name="serving")
    serving_fn.add_model("iris", model_path=trainer.outputs["model"])

    # Create a server simulator (we cannot deploy since we are not attached to a k8s cluster)
    server = serving_fn.to_mock_server()

    # Request prediction from the server API
    resp = server.test(
        "/v2/models/iris/infer",
        body={"inputs": [[5.1, 3.5, 1.4, 0.2], [7.7, 3.8, 6.7, 2.2]]},
    )

    print("Prediction:\n", resp)
