class QuestionsController < ApplicationController
  def create
    question = Question.create(question_params)
    if question.valid?
      render json: question, status: :created
    else
      render json: question.errors, status: :unprocessable_entity
    end
  end

  private

  def question_params
    params.require('question').permit(:question, :answer)
  end
end
