module SurveyTool
  class DataAnalyzer
    attr_reader :survey

    def initialize(survey:)
      @survey = survey
    end

    def analize!
      puts "The participation percentage:\t\t #{participation_percentage} %"
      puts "Total participant count:\t\t #{responses_count}"
      puts "The average for each rating question: \t#{average_for_rating_question}"
    end

    def participation_percentage
      (total_participants.count.to_f / responses_count * 100).round(2)
    end

    def total_participants
      @survey.responses.select{ |response| response[:submitted_at] != nil }
    end

    #Optimized Solution
    def average_for_rating_question
      rating_question_indexes = []
      rating_sum = 0


      @survey.questions.each_with_index do |q, index|
        if q.type.to_s == "ratingquestion"
          rating_question_indexes << index
        end
      end

      @survey.responses.each do |response|

        rating_sum += response[:responses].select
                                .with_index { |val, index| rating_question_indexes.include?(index) }
                                .inject(0) {|sum,i| sum += i.to_i }
        # is_fibonacci?(index)
      end

      (rating_sum/rating_question_indexes.count)
    end

    private
    def responses_count
      @survey.responses.count
    end

  end
end