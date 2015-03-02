# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Job.delete_all
Category.delete_all

category = ['Design',
            'QA',
            'programming',
            'Bussiness Exec',
            'System Administrator',
            'Copywriter',
            'Service Support',
            'Miscellaneous']

category.each do |category|
  Category.create(name: category)
end

Category.all.each do |category|
  40.times do |n|
    Job.create!(
           title: "title_#{n}",
           description: "description_#{n}",
           location: "location_#{n}",
           email: "email_#{n}_#{rand(10000)}@example.net",
           contact: "Send me an email here email_#{n}@example.net",
           url: "www.google.com/#{n}",
           is_active: true,
           company_name: "foo_#{n}_bar",
           category: category
    )
  end
end

Job.create!(
    title: "title_#{rand}",
    description: "description_#{rand}",
    location: "location_#{rand}",
    email: "email_#{rand}_#{rand(10000)}@example.net",
    contact: "Send me an email here email_#{rand}@example.net",
    url: "www.google.com/#{rand}",
    company_name: "foo_#{rand}_bar",
    highlight: true,
    category: Category.first
)
