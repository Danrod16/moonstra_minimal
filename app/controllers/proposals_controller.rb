class ProposalsController < ApplicationController
  before_action :set_team
  def new
    @proposal = Proposal.new
    authorize @proposal
    @teams_projects = @team.projects
  end

  def create
    @proposal = Proposal.new(proposal_params)
    if params[:proposal][:client_id] != ""
      @proposal.client = Client.find(params[:proposal][:client_id])
    else
      @proposal.client = Client.create(params[:client_attributes])
    end
    @proposal.teams_project = TeamsProject.find_by(team: @team, project_id: params[:proposal][:teams_project_id])
    if @proposal.save!
      redirect_to team_proposal_path(@team,@proposal)
    else
      flash[:alert] = "Error saving: try again"
      redirect_to :new
    end
    authorize @proposal
  end

  def show
    @proposal = Proposal.find(params[:id])
    authorize @proposal
  end

  private

  def set_team
    @team = Team.find(params[:team_id])
  end

  def proposal_params
    params.require(:proposal).permit(:title, :overview, :goals, :total_price, :expiry_date, client_attributes: [:id, :company_name, :first_name, :last_name, :address, :cif, :email, :_destroy], deliverable_attributes: [:title, :price])
  end
end
