require 'survey_tool/survey'
require 'survey_tool/response'


module SurveyTool
  class SurveyFactory

    attr_reader :survey_data, :survey_responses_data, :survey

    def initialize(survey_data:, survey_responses_data:, survey: nil)
      @survey_data            = survey_data
      @survey_responses_data  = survey_responses_data
      @survey                 =  nil
    end

    def build_survey
      @survey = Survey.new({
                  survey_data: @survey_data,
                  survey_responses_data: @survey_responses_data })
    end

  end
end