class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      # Options for using redirect with flash:
      #flash[:notice] = "Project had been created"
      #redirect_to @project
      #redirect_to @project, notice: "Project has been created."   # Can also use "alert:"
      redirect_to @project, flash: { success:"Project has been created."}
    else
      flash.now[:alert] = "Project has not been created"
      render "new"
    end
  end

  def show
    #@project = Project.find(params[:id]) # Is now in before_action
  end

  def edit
    #@project = Project.find(params[:id]) # Is now in before_action
  end

  def update
    #@project = Project.find(params[:id]) # Is now in before_action
    if @project.update(project_params)
      flash[:notice] = "Project has been updated."
      redirect_to @project
    else
      flash.now[:alert] = "Project has not been updated."
      render "edit"
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    flash[:notice] = "Project has been deleted."
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end

  def set_project
    @project = Project.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The project you were looking for could not be found."
    redirect_to projects_path
  end

end
