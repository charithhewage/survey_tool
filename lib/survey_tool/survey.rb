require 'survey_tool/question'

module SurveyTool
  class Survey

    attr_reader :questions, :responses

    def initialize(survey_data:, survey_responses_data:)
      @questions ||= generate_questions(survey_data)
      @responses ||= generate_responses(survey_responses_data)
    end

    private
    def generate_questions(survey_data)
      survey_data.map do |question|
        Question.new(question)
      end
    end

    def generate_responses(survey_responses_data =[])
      survey_responses_data.each do |response|
        Response.new({
          email:        response[:email],
          employee_id:  response[:employee_id],
          submitted_at:  response[:submitted_at],
          responses:    response[:responses]
        })
      end
    end
  end
end