class ClientsController < ApplicationController

  def create
    @client = Client.new(client_params)
    if @client.save!
      render json: @client
    else
      render json: {errors: @client.errors.full_messages}
    end
    authorize @client
  end

  private

  def client_params
    params.require(:client).permit(:company_name, :first_name, :last_name, :address, :cif, :email)
  end
end
