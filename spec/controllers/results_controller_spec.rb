require 'rails_helper'

RSpec.describe ResultsController, type: :controller do
  describe 'POST #verify' do
    before :each do
      @questions = [
        {id: '2', answer: 'Alaska'},
        {id: '3', answer: 'Bob Marley'},
        {id: '4', answer: 'Sugar'},
        {id: '5', answer: 'Eric Clapton'},
        {id: '6', answer: 'Steve McQueen'},
        {id: '7', answer: 'San Francisco Bay'},
        {id: '8', answer: 'Poseidon'}
      ]
    end

    context 'with valid params' do
      it 'does verify answers with perfect results' do
        post :verify, questions: @questions
        res = JSON.parse(response.body)
        expect :success
        expect(res['results']).to eq(@questions.count)
      end

      it 'does verify answers with 1 incorrect result' do
        @questions[1][:id] = 1
        post :verify, questions: @questions
        res = JSON.parse(response.body)
        expect :success
        expect(res['results']).to eq(@questions.count - 1)
      end
    end

    context 'with invalid params' do
      it 'does not verify answers' do
        post :verify, questions: nil
        res = JSON.parse(response.body)
        expect :unprocessable_entity
        expect(res['error']).to match(/param is missing/)
      end
    end
  end
end
