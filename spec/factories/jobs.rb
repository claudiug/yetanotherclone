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
#  latitude     :float
#  longitude    :float
#

FactoryGirl.define do
  factory :job do
    title "amazin "
    description "amazing job here"
    price 100
    location "Berlin"
    contact "send an email here: email@example.net"
    company_name "MakeHugeMoney"
    url "www.google.com"
    email "email@example.net"
    highlight false
    valid_time "2015-02-27 15:01:33"
    total_price 100
  end

end
