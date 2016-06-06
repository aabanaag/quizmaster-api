class ResultsController < ApplicationController
  def verify
    results = 0

    questions_params.each do |e|
      id = e['id']
      answer = e['answer']
      question = Question.find_by id: id, answer: answer
      if question
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
