class SendEmailJob < ActiveJob::Base
  queue_as :default

  def perform(job)
    UserInvoice.recipe_email(job).deliver_later
  end
end
