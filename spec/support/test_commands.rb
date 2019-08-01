def valid_test_commands
  [
    { # Provided example 1
      input: 'theme,type,text\r
              The Work,ratingquestion,I like the kind of work I do.\r
              The Work,ratingquestion,"In general, I have the resources (e.g., business tools, information, facilities, IT or functional support) I need to be effective."\r
              The Work,ratingquestion,We are working at the right pace to meet our goals.\r
              The Place,ratingquestion,I feel empowered to get the work done for which I am responsible.\r
              The Place,ratingquestion,I am appropriately involved in decisions that affect my work.\r',
      output: ["0,1,NORTH\n"]
    },

  ]
end