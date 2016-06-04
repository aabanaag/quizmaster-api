require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  describe 'POST #create' do
    before :each do
        @question = Question.new({
          question: 'What is 5 * 5',
          answer: '25'
          })
    end

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
    before :each do
        @question = Question.new({
          question: 'What is the color of the Sun',
          answer: 'yellow'
          })
    end

    context 'with valid params' do
      it 'updates the question' do
        put :update, id: 1, question: @question.attributes

        model = Question.find(1).as_json
        expect :no_content
        expect(model['question']).to eq(@question.question)
        expect(model['answer']).to eq(@question.answer)
      end
    end

    context 'with invalid params' do
      it 'does not update the question' do
        @question.question = ''
        @question.answer = ''
        put :update, id: 1, question: @question.attributes

        res = JSON.parse(response.body)
        expect :unprocessable_entity
        expect(res).to include('Question can\'t be blank',
        'Answer can\'t be blank')
      end
    end
  end

  describe 'GET #index' do
    it 'returns list of questions' do
      get :index

      res = JSON.parse(response.body)
      expect :success
      expect(res).not_to be_nil
      expect(Question.count).to be >= 1
    end
  end

  describe 'GET #show' do
    it 'returns one question' do
      get :show, id: 1

      res = JSON.parse(response.body)
      expect :success
      expect(res).not_to be_nil
    end
  end

  describe 'DELETE #destroy' do
    context 'with valid params' do
      it 'deletes the question' do
        delete :destroy, id: 1

        expect :no_content
        expect { Question.find(1) }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
