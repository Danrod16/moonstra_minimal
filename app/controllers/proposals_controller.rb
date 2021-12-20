class ProposalsController < ApplicationController
  before_action :set_team
  def new
    @proposal = Proposal.new
    authorize @proposal
    @teams_projects = @team.projects
  end

  def create
    @proposal = Proposal.new(proposal_params)
    @proposal.teams_project = TeamsProject.find_by(team: @team, teams_project_id: params[:proposal][:teams_projects_id])
    if @proposal.save!
      redirect_to team_proposal_path(@team,@proposal)
    else
      flash[:alert] = "Error saving: try again"
      redirect_to :new
    end
    authorize @proposal
  end

  private

  def set_team
    @team = Team.find(params[:team_id])
  end

  def proposal_params
    params.require(:proposal).permit(:title, :overview, :goals, :total_price, :expiry_date, client_attributes: [:id, :company_name, :first_name, :last_name, :address, :cif, :email, :_destroy])
  end
end
