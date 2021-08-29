# A simple Robot Framework API automation

This project is a simple example on how to make HTTP requests on Robot Framework using the Requests Library.

The project counts on examples that make Get and Post HTTP calls, new examples on Delete and Put will be added in the near future.

## Infos on how to install dependencies and run the project

First of all, for running the tests and using the project structure, you should have Python and Robot Framework installed on your local environment, after that, you can follow the steps explained in this file.

For installing dependencies, on the terminal, you should type:
```
pip install -r requirements.txt
```

For running specific tests, on the terminal, you should type:
```
robot -d .\logs tests\<name_of_the_file>.robot
```

For running all tests, on the terminal, you should type:
```
robot -d .\logs tests
```
