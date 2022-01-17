class PassthroughController < ApplicationController
  skip_after_action :verify_policy_scoped
  skip_before_action :authenticate_user!, only: [:index]


  def index
    if user_signed_in?
      if @current_user.regular?
        if @current_user.team.nil? #Redirect to users overview when no team
          path = user_overview_path(@current_user)
        else
          path = team_overview_path(@current_user.team)
          # Add "else "logic for admin once rails admin is setup
        end
      else
        path = team_overview_path(@current_user.team)
      end
    else
      path = home_path
    end
    redirect_to path
  end
end
