class EventAttendancesController < ApplicationController
  before_action :authenticate_user!
  def new
    @event_attendance = EventAttendance.new
  end
  def create
    event = Event.find(eventattendparams[:attended_event_id])
    @event_attendance = EventAttendance.new(eventattendparams)
    unless event.creator_id == current_user.id
      redirect_to event, notice: "only the creator can create attendances"
      return
    end
    if @event_attendance.save
      redirect_to event, notice: "attendance added"
    else
      render :new, status: :unprocessable_entity
    end
  end
  def eventattendparams
    params.expect(event_attendance: [ :attended_event_id, :attendee_id ])
  end
end
