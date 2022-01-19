class InvitationsController < ApplicationController
  def create
    @invitation = Invitation.new(invitation_params)
    respond_to do |format|
      if @invitation.save
        cookies[:saved_invite] = true
        format.html { redirect_to home_path }
        format.js
        flash[:notice] = "Submission saved! We will reach out to you shortly!"
      else
        format.html { redirect_to home_path }
        format.js
      end
    end
    authorize @invitation
  end


  private

  def invitation_params
    params.require(:invitation).permit(:email, :token)
  end
end
