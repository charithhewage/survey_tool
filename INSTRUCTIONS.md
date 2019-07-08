## How to run the Survey Tool

This project is written in Ruby programing language. You can simply clone/copy this project to your development computer and run with the following commands. I recommend, you should have installed Ruby 2.2.2 or higher version in your computer. If you have already installed Ruby in your computer, Use the following command to check the version.

```
$ ruby -v
```

If you don’t have installed Ruby in your computer, see [these instructions](https://www.ruby-lang.org/en/documentation/installation/) on ruby-lang.org


### Unbundle this project
```
$ git clone coding-test-application.bundle
$ cd coding-test-application
```

### Install gem dependencies
```
$ bundle install
```

### Run unit & integration tests
```
$ bundle exec rspec
$ bundle exec cucumber features
```

### Run the application.
This application is developed as a command line interface (CLI). Before running this project, I would like to introduce the files and folder architecure.

* Gemfile:  Used to manage gem dependencies for our library’s development. 

* README: includes all the instructions and guideline for the problem and the expected solution.

* INSTRUCTIONS: This file includes how to run the project and instructions.

bin/survey-tool: This file is the main and executable file of the project. If you want to run this project you have to call this file via command line interface (CLI)

* example-data: This folder includes all the sample survey data with each responses as a .csv file formats. This application will process only the csv file formats at this stage. If you want to improve this with other formats, Pull requests are welcome :)

* lib/survey_tool: This folder should contain all the code (classes, etc.) for the project. This is a nice folder architecture and best practice. 

Furthermore, you can check other relevant classes and modules in the lib/survey_tool folder. 
I have used popular Ruby gem called `Thor` to implement command line interface application.

### Example 1 
```
bundle exec bin/survey-tool exucute --survey example-data/survey-1.csv --survey_response example-data/survey-1-responses.csv
```
### Expected Output
```
The participation percentage:         83.33 %
Total participant count:              6
The average for each rating question: 21
```

### Example 2
```
bundle exec bin/survey-tool exucute --survey example-data/survey-2.csv --survey_response example-data/survey-2-responses.csv
```
### Expected Output
```
The participation percentage:           100.0 %
Total participant count:                5
The average for each rating question:   22
```

### Example 3
```
bundle exec bin/survey-tool exucute --survey example-data/survey-3.csv --survey_response example-data/survey-3-resonses.csv
```
### Expected Output
```
The participation percentage:           0.0 %
Total participant count:                5
The average for each rating question:   19
```



