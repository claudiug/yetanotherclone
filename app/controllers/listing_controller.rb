class ListingController < ApplicationController
  def index
    @categories_jobs = Category.joins(:jobs).where({jobs:{is_active: true}}).group('category_id')
  end
end
