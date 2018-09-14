class TicketsController < ApplicationController
  def create
    ticket = Ticket.new(tickets_params)
    if ticket.save
       excavator = ticket.excavators.new(excavator_params)
       if excavator.save
       render status: :created, json: [ticket,excavator]
       else
         respond_with_errors(excavator)
       end
    else
      respond_with_errors(ticket)
    end
  end

  private

  def tickets_params
    params.permit("RequestNumber","SequenceNumber","RequestType",
                                    "DateTimes" => ["ResponseDueDateTime"],
                                    "ServiceArea" => [
                                       "PrimaryServiceAreaCode" => ["SACode"] ,
                                       "AdditionalServiceAreaCodes" => ["SACode"]
                                    ],
                                    "DigsiteInfo" =>["WellKnownText"])
  end

  def excavator_params
    params.permit("Excavator" => ["CompanyName", "Address","CrewOnsite"])
  end
end
