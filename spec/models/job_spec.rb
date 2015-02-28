# == Schema Information
#
# Table name: jobs
#
#  id           :integer          not null, primary key
#  title        :string
#  description  :string
#  price        :integer          default("100")
#  location     :string
#  contact      :string
#  company_name :string
#  url          :string
#  email        :string
#  highlight    :boolean          default("f")
#  valid_time   :datetime
#  total_price  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  category_id  :integer
#  is_active    :boolean          default("f")
#

require 'rails_helper'

describe Job do
  it 'is valid with all fields' do
    job = build(:job)
    job.valid?
    expect(job).to be_valid
  end

  it 'is invalid with no title' do
    job = build(:job, title: nil)
    job.valid?
    expect(job.errors['title']).to include("can't be blank")
  end

  it 'is invalid with no no description' do
    job = build(:job, description: nil)
    job.valid?
    expect(job.errors['description']).to include("can't be blank")
  end

  it 'is invalid with no no location' do
    job = build(:job, location: nil)
    job.valid?
    expect(job.errors['location']).to include("can't be blank")
  end

  it 'is invalid with no no contact' do
    job = build(:job, contact: nil)
    job.valid?
    expect(job.errors['contact']).to include("can't be blank")
  end

  it 'is invalid with no no company_name' do
    job = build(:job, company_name: nil)
    job.valid?
    expect(job.errors['company_name']).to include("can't be blank")
  end

  it 'is invalid with no no url' do
    job = build(:job, url: nil)
    job.valid?
    expect(job.errors['url']).to include("can't be blank")
  end

  it 'is invalid with no no email' do
    job = build(:job, email: nil)
    job.valid?
    expect(job.errors['email']).to include("can't be blank")
  end

  it 'is invalid with proper email format' do
    job = build(:job, email: "foo@foo")
    job.valid?
    expect(job.errors['email']).to include("is invalid")
  end

  xit 'is invalid with proper url format' do
    job = build(:job, url: "ww.goo.com")
    job.valid?
    expect(job.errors['url']).to include("can't be blank")
  end

  it 'is invalid with more than 100 chars for contact'do
    job = build(:job, contact: "a"*101)
    job.valid?
    expect(job.errors['contact']).to include("is too long (maximum is 100 characters)")
  end

  it 'is invalid with less than 3 char for contact' do
    job = build(:job, contact: "aa")
    job.valid?
    expect(job.errors['contact']).to include("is too short (minimum is 3 characters)")
  end

  it 'is invalid with more than 1000 char for description' do
    job = build(:job, description: "a"*1001)
    job.valid?
    expect(job.errors['description']).to include("is too long (maximum is 1000 characters)")
  end

  it 'is invalid with less than 3 char for description' do
    job = build(:job, description: "aa")
    job.valid?
    expect(job.errors['description']).to include("is too short (minimum is 3 characters)")
  end

  it 'is invalid with more than 200 chars for url'do
    job = build(:job, url: "www.google.com/#{'a'*200}")
    job.valid?
    expect(job.errors['url']).to include("is too long (maximum is 200 characters)")
  end

  it 'is invalid with more than 100 char for location' do
    job = build(:job, location: "a"*101)
    job.valid?
    expect(job.errors['location']).to include("is too long (maximum is 100 characters)")
  end

  it 'is invalid with less than 3 char for location' do
    job = build(:job, location: "a")
    job.valid?
    expect(job.errors['location']).to include("is too short (minimum is 3 characters)")
  end

  it 'is invalid with more than 100 chars for company name'do
    job = build(:job, company_name: "a"*101)
    job.valid?
    expect(job.errors['company_name']).to include("is too long (maximum is 100 characters)")
  end

  it 'is invalid with less than 3 char for company name' do
    job = build(:job, company_name: "a")
    job.valid?
    expect(job.errors['company_name']).to include("is too short (minimum is 3 characters)")
  end

  it 'is invalid with more than 100 char for title' do
    job = build(:job, title: "a"*201)
    job.valid?
    expect(job.errors['title']).to include("is too long (maximum is 100 characters)")
  end

  it 'is invalid with less than 3 char for title' do
    job = build(:job, title: "3")
    job.valid?
    expect(job.errors['title']).to include("is too short (minimum is 3 characters)")
  end
end
