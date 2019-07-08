require 'survey_tool/response'

RSpec.describe SurveyTool::Response do

  let(:sresponse) { SurveyTool::Response.new({
    email: "something@something.com", 
    employee_id: 1, 
    submitted_at: "2019-07-30T04:05:41+00:00", 
    responses: [1,2,3,4,5]
  }) }

  context "validate attributes" do
    it { expect(sresponse).to have_attributes(  email: "something@something.com", 
                                                employee_id: 1, 
                                                submitted_at: "2019-07-30T04:05:41+00:00", 
                                                responses: [1,2,3,4,5]) }
  end
end
