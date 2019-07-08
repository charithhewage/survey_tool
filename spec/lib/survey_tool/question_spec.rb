require 'survey_tool/question'

RSpec.describe SurveyTool::Question do

  let(:question) { SurveyTool::Question.new({
    theme: "Work", 
    type: "ratingquestion", 
    text: "This is a sample question"
  }) }

  context "validate attributes" do
    it { expect(question).to have_attributes(   theme: "Work", 
                                                type: "ratingquestion", 
                                                text: "This is a sample question") }
  end
end
