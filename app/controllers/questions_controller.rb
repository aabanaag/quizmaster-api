class QuestionsController < ApplicationController
  def create
    question = Question.create(question_params)
    if question.valid?
      render json: question, status: :created
    else
      render json: question.errors, status: :unprocessable_entity
    end
  end

  def update
    id = params[:id]
    question = Question.find(id)
    if question.update_attributes(question_params)
      render json: question, status: :updated
    else
      render json: question.errors.full_message, status: :unprocessable_entity
    end
  rescue => e
    logger.info e
    render json: { message: 'Question not found' }, status: :not_found
  end

  def index
    render json: Question.all, status: :success
  end

  private

  def question_params
    params.require('question').permit(:question, :answer)
  end
end
