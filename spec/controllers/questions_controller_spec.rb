require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  before :each do
      @question = Question.new({
        question: 'What is 5 * 5',
        answer: '25'
        })
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates the question' do
        post :create, question: @question.attributes

        expect :created
        expect(Question.count).to eq(1)
      end
    end

    context 'with invalid attributes' do
      it 'does not create the question' do
        @question.question = ''
        post :create, question: @question.attributes

        expect :unprocessable_entity
        expect(JSON.parse(response.body)).not_to be_nil
      end
    end
  end

  describe 'PUT #update' do

  end

  describe 'GET #index' do

  end

  describe 'DELETE #destroy' do

  end
end
