require 'rails_helper'

RSpec.describe Question, type: :model do
  it 'has valid question' do
    expect(build(:question)).to be_valid
  end

  it 'has invalid question' do
    expect(build(:question, question: '', answer: '')).not_to be_valid
  end

  it 'has no specified answer' do
    expect(build(:question, answer: '')).not_to be_valid
  end

  it 'has no specified question' do
    expect(build(:question, question: '')).not_to be_valid
  end
end
