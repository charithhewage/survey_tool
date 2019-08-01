module SurveyTool
  class DataAnalyzer
    attr_reader :survey

    def initialize(survey:)
      @survey = survey
    end

    def analize!
      puts "The participation percentage:\t\t #{participation_percentage} %"
      puts "Total participant count:\t\t #{total_participants.size}"
      puts "The average for each rating question: \t #{average_for_rating_question}"
    end

    def participation_percentage
      (total_participants.count.to_f / responses_count * 100).round(2)
    end

    def total_participants
      @survey.responses.select{ |response| !response[:submitted_at].nil? }
    end

    def average_for_rating_question
      rating_question_indexes               = []
      submited_answers_for_rating_questions = []


      @survey.questions.each_with_index do |qestion, index|
        if qestion.type.to_s == "ratingquestion"
          rating_question_indexes << index
        end
      end

      @survey.responses.each do |response|
        next if response[:submitted_at].nil?

        response[:responses].select
            .with_index { |value, index| submited_answers_for_rating_questions << value.to_i if rating_question_indexes.include?(index) && !value.nil? }

        # response[:responses].select
        #   .with_index do |value, index| 
        #     if rating_question_indexes.include?(index) && !value.nil?
        #       submited_answers_for_rating_questions << value.to_i
        #     end
        #   end
      end
      
      return 0 if submited_answers_for_rating_questions.size.zero?

      (submited_answers_for_rating_questions.sum/ submited_answers_for_rating_questions.size)
      
    end

    private
    def responses_count
      @survey.responses.count
    end

  end
end