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
    get_data = project.run_function("gen-iris")

    # use the dataset output as input to the training function
    trainer = project.run_function(
        "trainer",
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
