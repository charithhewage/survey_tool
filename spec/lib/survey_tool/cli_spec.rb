require 'spec_helper'

describe CLI do

  let(:cli) { CLI.new }

  subject { cli }

  specify "instance methods" do
    should respond_to(:execute)
  end

  shared_examples_for "commands executed from a file" do |survey, survey_response, expected_output|
    before do
      allow(cli).to receive(:options).and_return(
        { survey: default_survey_file,
          survey_response: default_survey_response_file
        }
      )
    end

    it { should == expected_output }
  end

  describe "#execute with options[:survey] and options[:survey_response]" do
    
    context "on a valid file" do
      let(:default_survey_file) { "example-data/survey-1.csv" }
      let(:default_survey_response_file) { "example-data/survey-1-responses.csv" }

      context "with valid test data" do
        valid_test_commands.each do |data|
          let(:input) { data[:input] }
          let(:expected_output) { data[:output].join }
          
          #it_should_behave_like "commands executed from a file"
            
        end
      end
    end

  end
end