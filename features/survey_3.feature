Feature: Survey 1 with example data should Analize Following information
  The participation percentage and total participant counts of the survey.
  The average for each rating question

  Scenario: Return participation percentage, participant counts and average for each rating question
    Given a file named "survey-3.csv" with:
    """
    type,theme,text
    ratingquestion,The Work,I like the kind of work I do.
    ratingquestion,The Work,I have the resource I need to be effective.
    singleselect,Demographics,City
    ratingquestion,The Work,I feel empowered to get the work done for which I am responsible.
    singleselect,Demographics,Manager
    """

    Given a file named "survey-3-responses.csv" with:
    """
    employee1@abc.xyz,,,5,5,Perth,4,Sally
    employee2@abc.xyz,,,,5,Sydney,3,Jane
    employee2@abc.xyz,,,,5,,5,John
    employee2@abc.xyz,,,5,5,Melbourne,4,Bob
    employee2@abc.xyz,,,4,5,Darwin,2,Mary
    """

    When I run "bin/survey-tool exucute --survey survey-3.csv --survey_response survey-3-responses.csv"
    Then the output should contain "The participation percentage:\t\t 0.0 %"
    Then the output should contain "Total participant count:\t\t 0"
    Then the output should contain "The average for each rating question: \t 0"