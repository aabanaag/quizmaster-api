class ResultsController < ApplicationController
  def verify
    results = 0
    questions = Question.all.to_a

    questions_params.each do |e|

      id = e['id']
      answer = e['answer'] || ""
      question = questions.find { |i| i.id == id  }
      if question.answer.downcase == answer.downcase
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
end
