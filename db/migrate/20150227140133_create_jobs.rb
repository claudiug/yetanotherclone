class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :description
      t.integer :price, default: 100
      t.string :location
      t.string :contact
      t.string :company_name
      t.string :url
      t.string :email
      t.boolean :highlight, default: false
      t.datetime :valid_time
      t.integer :total_price

      t.timestamps null: false
    end
  end
end
