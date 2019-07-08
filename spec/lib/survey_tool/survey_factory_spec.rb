require 'survey_tool/survey_factory'
require 'survey_tool/survey'

RSpec.describe SurveyTool::SurveyFactory do

  let(:survey_factory) { SurveyTool::SurveyFactory.new({
    survey_data: {}, 
    survey_responses_data: {}, 
    survey: nil
  }) }

  context "validate attributes" do
    it { expect(survey_factory).to have_attributes(  survey_data: {}, 
                                                      survey_responses_data: {}, 
                                                      survey: nil) }
  end

  context "#build_survey" do
    it "should return survey object" do
      expect(SurveyTool::Survey).to receive(:new).with(any_args).and_return({survey: {}})

      expect(survey_factory.build_survey).to eq({survey: {}})
    end
  end
end


