class ChargesController < ApplicationController

  def new
    @job = Job.find(params[:job_id])
  end

  def create
    @job = Job.find(params[:job])
    customer = Stripe::Customer.create(
        :email => @job.email,
        :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @job.price_in_cents,
        :description => @job.title,
        :currency    => 'eur'
    )
      @job.is_active = true
      @job.save
      SendEmailJob.set(wait: 20.seconds).perform_later(@job)
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to @job
  end
end
