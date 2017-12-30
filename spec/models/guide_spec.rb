require 'rails_helper'

RSpec.describe Guide, type: :model do
  it 'guide can be created' do
    guide = Guide.create(title: "My first guide", content: "First guide first content", published: true)
    expect(guide).to be_valid
  end
end