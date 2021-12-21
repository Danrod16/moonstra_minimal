class DashboardsController < ApplicationController
  skip_after_action :verify_policy_scoped
  before_action :set_team

  def overview
    @team_projects = @team.teams_projects
  end

  def proposals
    @teams_projects = @team.teams_projects
  end

  private

  def set_team
    @team = Team.find(params[:team_id])
  end
end
