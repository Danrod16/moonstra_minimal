class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @invitation = Invitation.new
  end

  def styleguide
  end
end
