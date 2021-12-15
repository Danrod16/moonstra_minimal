class DashboardsController < ApplicationController
  skip_after_action :verify_policy_scoped

  def overview
    @team = Team.find(params[:team_id])
    @private_projects = @team.projects
  end
end
