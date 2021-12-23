class DashboardsController < ApplicationController
  skip_after_action :verify_policy_scoped
  before_action :set_team, only: [:overview, :find_team_projects, :proposals]
  before_action :set_team_projects, only: [:overview, :proposals]

  def overview
    @last_projects = TeamsProject.where(team_id: current_user.team).order("updated_at DESC").limit(5)
  end

  def proposals
    @user_projects = ProjectMember.where(user: current_user)
  end

  private

  def set_team
    @team = Team.find(params[:team_id])
  end

  def set_team_projects
    @teams_projects = @team.teams_projects
  end
end
