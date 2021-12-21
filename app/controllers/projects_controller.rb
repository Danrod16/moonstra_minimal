class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_data, only: [:create]

  def index
    @public_projects = policy_scope(Project).order("created_at DESC")
  end

  def new
    @project = Project.new
    authorize @project
  end

  def create

    if @project.save! && @project.private # When project is private to the team
      create_project_category
      asign_member_to_project
      TeamsProject.create(team: @team, project: @project)
      redirect_to team_overview_path(@team)
    elsif @project.save! # When project is public
      create_project_category
      asign_member_to_project
      redirect_to projects_path
    else
      flash[:alert] = "We couldn't create your project, try again later"
    end
    authorize @project
  end

  private

  def set_data
    @project = Project.new(project_params)
    @project.user = current_user
    @team = current_user.team
    @categories = Category.where(id: params[:project][:category_ids]) # Finds instances from category ids from simple form when creating a project
    @members = User.where(id: params[:project][:user])
  end

  def create_project_category
    @categories.each do |category_instance|
      ProjectCategory.create(project: @project, category: category_instance)
    end
  end

  def asign_member_to_project
    @members.each do |project_member|
      ProjectMember.create(project: @project, user: project_member)
    end
  end

  def project_params
    params.require(:project).permit(:name, :description, :finders_fee, :private)
  end
end
