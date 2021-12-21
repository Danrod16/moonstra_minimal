class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @public_projects = policy_scope(Project).order("created_at DESC")
  end

  def new
    @project = Project.new
    authorize @project
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    @team = current_user.team
    @categories = Category.where(id: params[:project][:category_ids])

    if @project.save! && @project.private
      # params {categories: [instance_1, ]}
      TeamsProject.create(team: @team, project: @project)
      redirect_to team_overview_path(@team)

    elsif @project.save!
      @categories.each do |category_instance|
        ProjectCategory.create(project: @project, category: category_instance)
      end
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
