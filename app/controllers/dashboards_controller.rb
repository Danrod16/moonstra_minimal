class DashboardsController < ApplicationController
  skip_after_action :verify_policy_scoped
  before_action :set_team, :find_team_projects

  def overview
  end

  def proposals
    @user_projects = ProjectMember.where(user: current_user)

  end

  private

  def set_team
    @team = Team.find(params[:team_id])
  end

  def find_team_projects
    @teams_projects = @team.teams_projects
  end
end
