class TapingsController < ApplicationController

  def index
    @tapings = Taping.all
  end

  def show
    @taping = Taping.find(params[:id])
    @status_changes = @taping.ticketStatusChanges
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end

end
