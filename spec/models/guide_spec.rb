require 'rails_helper'

RSpec.describe Guide, type: :model do
  before do
    @guide = Guide.create(title: "My first guide", content: "First guide first content")
  end
  
  it 'guide can be created' do
    expect(@guide).to be_valid
  end
  
  it 'cannot be created without a title and content' do
  		@guide.title = nil
  		@guide.content = nil
  		expect(@guide).to_not be_valid
  end
end