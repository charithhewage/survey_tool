require 'csv'

module SurveyTool
  module Cli
    class InputParser
      attr_reader :survey_file, :survey_responses_file
      
      def initialize(survey_file: , survey_responses_file: )
        @survey_file            = File.new(survey_file)
        @survey_responses_file  = File.new(survey_responses_file)
      end

      #Generate hash object for survey data
      def generate_survey_data
        @survey_data = CSV.parse(@survey_file, headers: true, header_converters: :symbol).map(&:to_hash)
      end

      #Generate hash object for survey responses
      def generate_survey_responses_data
        @survey_responses_data = []
        
        CSV.open(@survey_responses_file).map do |line|
          @survey_responses_data << {
            email:        line[0],
            employee_id:  line[1],
            submitted_at: line[2],
            responses:    line[3..-1]
          }
        end

        @survey_responses_data
      end
    
    end
  end
end