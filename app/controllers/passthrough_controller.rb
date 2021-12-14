class PassthroughController < ApplicationController
  skip_after_action :verify_policy_scoped

  def index
    if user_signed_in?
      if @current_user.regular?
        path = team_overview_path(@current_user.team)
      end
    else
      path = home_path
    end
    redirect_to path
  end
end
