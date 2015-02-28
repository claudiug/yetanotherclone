# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

describe Category do
  it 'is valid with name' do
    c = build(:category)
    c.valid?
    expect(c).to be_valid
  end

  it 'is invalid with no name' do
    c = build(:category, name: nil)
    c.valid?
    expect(c.errors['name']).to include("can't be blank")
  end
end
