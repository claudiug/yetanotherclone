class JobsController < ApplicationController

  def index
    @jobs = Category.find(params[:category_id]).jobs.where(is_active: true)
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to @job
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
  end

  def publish
    @amount = 10000
    if params[:is_active]
      @job = Job.find(params[:id])
      @job.is_active= true
      @job.save!
      redirect_to @job
    end
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to @job
    else
      render :edit
    end
  end

  private

  def job_params
    params.require(:job).permit(:title,
                                :description,
                                :location,
                                :category_id,
                                :contact,
                                :company_name,
                                :url,
                                :highlight,
                                :email)
  end
end
