class UserInvoice < ApplicationMailer

  def recipe_email(job)
    @company_name = job.company_name
    mail(to:'claudiu.garba@gmail.com')
  end
end