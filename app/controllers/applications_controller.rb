class ApplicationsController < ApplicationController
  def index
    @user = current_user
    @applications = Application.all
  end

  def show
    @application = Application.find(params[:id])
    @events = @application.events.group_by(&:name)
  end

  def new
    @application = Application.new 
  end

  def create
    @user = current_user 
    @application = Application.new
    @application.name = params[:application][:name]
    @application.url = params[:application][:url]
    @application.user = @user

    if @application.save
      flash[:notice] = "Your application is registered"
      redirect_to applications_path
    else
      flash[:alert] = "There was a problem registering your application"
      render :new
    end
  end

  def edit
    @application = Application.find(params[:id])
  end

   def update 
    @application = Application.find(params[:id])
    @application.name = params[:application][:name]
    @application.url = params[:application][:url]

    if @application.save
      flash[:notice] = "Your application is edited"
      redirect_to applications_path
    else
      flash[:alert] = "There was a problem editing your application"
      render :new
    end
  end

  def destroy
    @application = Application.find(params[:id])

    if @application.destroy
      flash[:notice] = "Your registered application has been deleted"
      redirect_to applications_path
    else
      flash[:alert] = "There was a problem deleting your application"
      redirect_to applications_path
    end
  end
end
