require 'thor'

require 'survey_tool/cli/input_parser'
require 'survey_tool/survey_factory'
require 'survey_tool/data_analyzer'

module SurveyTool
  class CLI < Thor

    desc "Provide Survey and Survey Response", "Provide Survey and Survey Response as a file inputs."
    
    method_option :survey, 
                  aliases: :survey, 
                  required: true, 
                  banner: "Please provide the servey file with this" 

    method_option :survey_response, 
                  aliases: :survey_response, 
                  required: true, 
                  banner: "Please provide the servey response file with this" 

    #bundle exec bin/survey-tool exucute --survey [path/to/survey.csv] --survey_response [path/to/survey_response.csv]
    def exucute
      @file_inputs  = SurveyTool::Cli::InputParser.new(options[:survey], options[:survey_response])
      
      @survey_data            = @file_inputs.generate_survey_data
      @survey_responses_data  = @file_inputs.generate_survey_responses_data

      @survey_factory   = SurveyFactory.new({
                            survey_data: @survey_data,
                            survey_responses_data: @survey_responses_data
                          })

      @survey   = @survey_factory.build_survey

      @data_analyzer = DataAnalyzer.new({survey: @survey})
      @data_analyzer.analize!
    end

  end
end