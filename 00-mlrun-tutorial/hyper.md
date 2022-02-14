MLRun support running **hyper-param** jobs in parallel with various strategies and options (read the about MLRun
[Hyper-Param and Iterative jobs](https://docs.mlrun.org/en/latest/hyper-params.html)).
 
We will run a GridSearch with couple of parameters, select the best run (with `max accuracy`) and print the results:

`python -c 'import examples; examples.run_hyper()'`{{execute}}

The returned run object in this case represents the `parent` (and the **best** result),
we can also access the individual child runs (iterations).

check the `artifacts/iteration_results.csv`{{open}} file

or the interactive parallel coordinates plot HTML or UI:

![pcp](./assets/pcp.png)
