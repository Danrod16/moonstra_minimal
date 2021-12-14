class TeamsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create ]

  def new
    @team = Team.new
    authorize @team
  end

  def create
    @team = Team.new(teams_params)
    # Use these members params to send automatic invitations by email
    @invitations = params[:team][:members]
    if @team.save!
      @teams_projects = TeamsProject.new
      @teams_projects.team = @team
      redirect_to new_user_registration_path(params: {team: @team})
    else
      flash[:alert] = "We couldn't create your team, try again later"
    end
    authorize @team
  end

  private

  def teams_params
    params.require(:team).permit(:name, :description)
  end
end
