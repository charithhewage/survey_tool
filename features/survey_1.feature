Feature: Survey 1 with example data should Analize Following information
  The participation percentage and total participant counts of the survey.
  The average for each rating question

  Scenario: Return participation percentage, participant counts and average for each rating question
    When I run "bundle exec bin/survey-tool exucute --survey example-data/survey-1.csv --survey_response example-data/survey-1-resonses.csv"
    #Then the output should contain "The participation percentage:    83.33 %"