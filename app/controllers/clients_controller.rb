class ClientsController < ApplicationController

  def create
  @client = Client.new(cleint_params)
  if @client.save
    render json: @client
  else
    render json: {errors: @client.errors.full_messages}
  end

  private

  def client_params
    param.require(:client).permit(:company_name, :first_name, :last_name, :addess, :cif, :email)
  end
end
