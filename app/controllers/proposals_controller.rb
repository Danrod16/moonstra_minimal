class ProposalsController < ApplicationController
  before_action :set_team
  def new
    @proposal = Proposal.new
    authorize @proposal
    @teams_projects = @team.projects
  end

  def create
    @proposal = Proposal.new(proposal_params)
    @proposal.client = Client.find_or_create_by(params[:proposal][:client])
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

  def accepted
    @proposal = Proposal.find(params[:proposal_id])
    @proposal.teams_project.team = @team
    @proposal.status = "accepted"
    @proposal.save

    @teams_project = @proposal.teams_project
    @teams_project.status = "accepted"
    @teams_project.save

    redirect_to team_proposals_path(@team)
    authorize @proposal
  end

  def declined
    @proposal = Proposal.find(params[:proposal_id])
    @proposal.teams_project.team = @team
    @proposal.status = "declined"
    @proposal.save

    @teams_project = @proposal.teams_project
    if Proposal.where(status: "pending", teams_project: @teams_project).present?
      @teams_project.status = "penbding"
    elsif Proposal.where(status: "accepted", teams_project: @teams_project).blank?
      @teams_project.status = "declined"
    end

    @teams_project.save
    redirect_to team_proposals_path(@team)
    authorize @proposal
  end

  private

  def set_team
    @team = Team.find(params[:team_id])
  end

  def proposal_params
    params.require(:proposal).permit(:title, :status, :overview, :goals, :total_price, :expiry_date, :teams_project_id, proposal_deliverables_attributes: [:title, :price])
  end
end
