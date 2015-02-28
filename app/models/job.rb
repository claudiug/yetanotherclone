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

class Job < ActiveRecord::Base
  belongs_to :category
  EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :title, presence: true, length: {within: 3..100}
  validates :description, presence: true, length: {within: 3..1000}
  validates :location, presence: true, length: {within: 3..100}
  validates :contact, presence: true, length: {within: 3..100}
  validates :company_name, presence: true, length: {within: 3..100}
  validates :url, presence: true, length: {maximum: 200}
  validates :email, presence: true,
            length: {maximum: 100},
            format: {with: EMAIL_FORMAT}

  before_save do
    self.email = email.downcase
    set_total_price
  end

  def set_total_price
    if self.highlight
      self.total_price = self.price + 50
    else
      self.total_price = self.price
    end
  end

  def price_in_cents
    total_price * 100
  end
end
