class DeliverablesController < ApplicationController

  def create
    @deliverable = Deliverable.new(deliverable_params)
    if @deliverable.save!
      render json: @deliverable
    else
      render json: {errors: @deliverable.errors.full_messages}
    end
    authorize @deliverable
  end

  private

  def deliverable_params
    params.require(:deliverable).permit(:title, :price)
  end
end
