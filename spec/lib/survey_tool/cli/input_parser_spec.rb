require 'csv'
require 'survey_tool/cli/input_parser'

RSpec.describe SurveyTool::Cli::InputParser do

  let(:file_object) { double("file like object") }

  let(:input_parser) { SurveyTool::Cli::InputParser.new({
                                          survey_file: "path/to/file.csv", 
                                          survey_responses_file: "path/to/file.csv", 
                                          }) }


  context "validate attributes" do
    it "should have attributes survey_file and survey_responses_file" do
      allow(File).to receive(:new).and_return(file_object)

      expect(input_parser).to have_attributes(  survey_file: file_object, 
                                                survey_responses_file: file_object )
    end
  end

end
