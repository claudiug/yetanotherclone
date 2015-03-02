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
       UserInvoice.recipe_email(@job).deliver_now
      #SendEmailJob.set(wait: 10.seconds).perform_later(@job)
  rescue Stripe::CardError => e
    @job = Job.find(@job.id)
    @job.is_active=false
    @job.save
    flash[:error] = e.message
    redirect_to edit_job_path(@job)
  end
end
