module SurveyTool
  class Response
    attr_reader :email, :employee_id, :submitted_at, :responses

    def initialize(email:, employee_id:, submitted_at:, responses:)
      @email        = email
      @employee_id  = employee_id
      @submitted_at = submitted_at
      @responses    = responses
    end
  end
end