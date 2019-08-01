Feature: Survey 1 with example data should Analize Following information
  The participation percentage and total participant counts of the survey.
  The average for each rating question

  Scenario: Return participation percentage, participant counts and average for each rating question
    Given a file named "survey-1.csv" with:
    """
    theme,type,text
    The Work,ratingquestion,I like the kind of work I do.
    The Work,ratingquestion,"In general, I have the resources (e.g., business tools, information, facilities, IT or functional support) I need to be effective."
    The Work,ratingquestion,We are working at the right pace to meet our goals.
    The Place,ratingquestion,I feel empowered to get the work done for which I am responsible.
    The Place,ratingquestion,I am appropriately involved in decisions that affect my work.
    """

    Given a file named "survey-1-responses.csv" with:
    """
    employee1@abc.xyz,1,2014-07-28T20:35:41+00:00,5,5,5,4,4
    ,2,2014-07-29T07:05:41+00:00,4,5,5,3,3
    ,3,2014-07-29T17:35:41+00:00,5,5,5,5,4
    employee4@abc.xyz,4,2014-07-30T04:05:41+00:00,5,5,5,4,4
    ,5,2014-07-31T11:35:41+00:00,4,5,5,2,3
    employee5@abc.xyz,6,,,,,,
    """

    When I run "bin/survey-tool execute --survey survey-1.csv --survey_response survey-1-responses.csv"
    Then the output should contain "The participation percentage:\t\t 83.33 %"
    Then the output should contain "Total participant count:\t\t 5"
    Then the output should contain "The average for each rating question: \t 4"