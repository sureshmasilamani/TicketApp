class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
  end
  def show
   @excavators = Excavator.where(ticket_id: params[:id])
  end
end
