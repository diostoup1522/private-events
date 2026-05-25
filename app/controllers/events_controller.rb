class EventsController < ApplicationController
  def index
    @events = Event.all
  end
  def new
    @event = Event.new
  end
  def create
    @event = current_user.Event.build(event_params)
    if @event.save
      redirect_to @event, notice: "Event sucessfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end
  def show
    @event = Event.find(eventshow_params)
  end
  private
  def eventshow_params
    params.extract_value(:id)
  end
  def event_params
    params.expect(event: [ :title, :date ])
  end
end
