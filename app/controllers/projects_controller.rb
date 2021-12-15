class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @projects = policy_scope(Project)
  end

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
    authorize @project
  end



  private

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
