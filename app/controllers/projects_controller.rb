class ProjectsController < ApplicationController

  def new
    @project = Project.new
    authorize @project
  end

  def create
    @project = Project.new(project_params)

    if @project.save!
      redirect_to projects_path(@project)
    else
      flash[:alert] = "We couldn't create your project, try again later"
    end
  end

  def index
    @projects = Project.all
  end


  private

  def teams_params
    params.require(:project).permit(:name, :description)
  end
end
