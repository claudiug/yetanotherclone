class ListingController < ApplicationController
  def index
    @jobs = Job.where(is_active: true).group('category_id').order('created_at DESC').limit(10)
  end
end
