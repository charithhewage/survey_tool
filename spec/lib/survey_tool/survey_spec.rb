require 'survey_tool/survey'

RSpec.describe SurveyTool::Survey do

  let(:file_object) { double("file like object") }

  let(:survey) { SurveyTool::Survey.new({
    survey_data: file_object, 
    survey_responses_data: file_object
  }) }

end
