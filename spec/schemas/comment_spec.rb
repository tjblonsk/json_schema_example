require 'rails_helper'

describe 'Comment Schema' do
  def validate_json(params)
    JSON::Validator.fully_validate(Schemas::Comment.load, params)
  end

  let(:required_params) { {title: 'required'} }

  context 'title' do
    it 'is required' do
      errors = validate_json({})
      expect(errors.length).to eq(1)

      errors = validate_json(required_params)
      expect(errors.length).to eq(0)
    end

    it 'must be a string' do
      errors = validate_json({title: 1})
      expect(errors.length).to eq(1)
    end

    it 'must be at least 5 characters' do
      errors = validate_json({title: '0123'})
      expect(errors.length).to eq(1)
    end
  end
end
