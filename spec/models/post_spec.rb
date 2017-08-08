require 'rails_helper'

describe Post do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title).is_at_least(5) }
end
