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
    if question.update(question_params)
      render json: nil, status: :no_content
    else
      render json: question.errors.full_messages, status: :unprocessable_entity
    end
  end

  def index
    render json: Question.all, status: :ok
  end

  def quiz
    render json: Question.select(:id, :question).shuffle(), status: :ok
  end

  def show
    id = params[:id]
    question = Question.find(id)
    if question.valid?
      render json: question, status: :ok
    else
      render json: question.errors.full_messages, status: :not_found
    end
  end

  def destroy
    id = params[:id]
    if Question.delete(id)
      render json: nil, status: :no_content
    else
      render json: question.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def question_params
    params.require('question').permit(:question, :answer)
  end
end
