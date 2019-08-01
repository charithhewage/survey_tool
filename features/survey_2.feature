Feature: Survey 1 with example data should Analize Following information
  The participation percentage and total participant counts of the survey.
  The average for each rating question

  Scenario: Return participation percentage, participant counts and average for each rating question
    Given a file named "survey-2.csv" with:
    """
    theme,type,text
    The Work,ratingquestion,I like the kind of work I do.
    The Work,ratingquestion,"In general, I have the resources (e.g., business tools, information, facilities, IT or functional support) I need to be effective."
    The Work,ratingquestion,We are working at the right pace to meet our goals.
    The Work,ratingquestion,I feel empowered to get the work done for which I am responsible.
    The Work,singleselect,Manager
    """

    Given a file named "survey-2-responses.csv" with:
    """
    ,1,2014-07-28T20:35:41+00:00,5,5,5,4,Sally
    ,2,2014-07-29T07:05:41+00:00,4,5,5,3,Jane
    ,3,2014-07-29T17:35:41+00:00,5,5,5,5,John
    ,4,2014-07-30T04:05:41+00:00,5,5,5,4,Bob
    ,5,2014-07-31T11:35:41+00:00,4,5,5,2,Mary
    """

    When I run "bin/survey-tool execute --survey survey-2.csv --survey_response survey-2-responses.csv"
    Then the output should contain "The participation percentage:\t\t 100.0 %"
    Then the output should contain "Total participant count:\t\t 5"
    Then the output should contain "The average for each rating question: \t 4"