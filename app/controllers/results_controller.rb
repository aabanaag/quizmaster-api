class ResultsController < ApplicationController
  helper_method :is_number?
  def verify
    results = 0
    questions = Question.all.to_a

    questions_params.each do |e|
      id = e['id']
      answer = e['answer'] || ""
      if (!answer.empty?) && (is_number?(answer))
        answer = I18n.with_locale(:en) { Integer(answer).to_words }
      else
        answer = answer.downcase
      end

      question = questions.find { |i| i.id == id  }
      if question.answer.downcase == answer
        results += 1
      end
    end
    render json: { results: {
      correct: results,
      totalItems: questions_params.count
      } }, status: :ok
  rescue => e

    render json: { error: e.message }, status: :unprocessable_entity
  end

  private
  def questions_params
    params.require('questions')
  end

  def is_number? string
    true if Float(string) rescue false
  end
end
