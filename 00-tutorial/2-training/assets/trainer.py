from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split

import mlrun
from mlrun.frameworks.sklearn import apply_mlrun


def train(
    dataset: mlrun.DataItem,
    label_column: str = "label",
    n_estimators: int = 100,
    max_depth: int = None,
):
    # Initialize our dataset dataframes:
    df = dataset.as_df()
    x = df.drop(label_column, axis=1)
    y = df[label_column]

    # Split our data into training set and testing set:
    x_train, x_test, y_train, y_test = train_test_split(
        x, y, test_size=0.2, random_state=42
    )

    # Initialize our model:
    model = RandomForestClassifier(
        n_estimators=n_estimators, max_depth=max_depth
    )

    # Apply MLRun's interface to the model, enabling logging and evaluating the model:
    apply_mlrun(model=model, model_name="my_model", x_test=x_test, y_test=y_test)

    # Train our model
    model.fit(x_train, y_train)
