class DashboardsController < ApplicationController
  skip_after_action :verify_policy_scoped
  before_action :set_team, only: [:overview, :find_team_projects, :proposals, :projects]
  before_action :set_team_projects, only: [:overview, :proposals, :projects]

  def overview
    @last_projects = TeamsProject.where(team_id: current_user.team).order("updated_at DESC").limit(5)
    @last_proposals = Proposal.where(teams_project: TeamsProject.where(team:current_user.team)).order("updated_at DESC").limit(5)
  end

  def proposals
    @user_projects = ProjectMember.where(user: current_user)
  end

  def projects
    @user_projects = ProjectMember.where(user: current_user)
  end

  def overview_user

  end

  private

  def set_team
    if params[:team_id]
      @team = Team.find(params[:team_id])
    end
  end

  def set_team_projects
    if params[:team_id]
      @teams_projects = @team.teams_projects
    end
  end
end
