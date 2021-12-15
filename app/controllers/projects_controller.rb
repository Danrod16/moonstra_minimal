class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @public_projects = policy_scope(Project)
  end

  def new
    @project = Project.new
    authorize @project
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    @team = current_user.team
    if @project.save! && @project.private
      TeamsProject.create(team: @team, project: @project)
      redirect_to team_overview_path(@team)
    elsif @project.save!
      redirect_to projects_path
    else
      flash[:alert] = "We couldn't create your project, try again later"
    end
    authorize @project
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :finders_fee, :private)
  end
end
