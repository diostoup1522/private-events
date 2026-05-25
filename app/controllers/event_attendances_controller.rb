class EventAttendancesController < ApplicationController
  before_action :authenticate_user!
  def new
    @event_attendance = EventAttendance.new
  end
  def create
    @event_attendance = EventAttendance.new(eventattendparams)
    if @event_attendance.attended_event.creator_id == current_user_id
      render :new, status: :unprocessable_entity
    end
    if @event_attendance.save
      redirect_to attended_event_path, notice: "attendance accepted"
    else
      render :new, status: :unprocessable_entity
    end
  end
  def eventattendparams
    params.expect(event_attendance: [ :attended_event_id, :attendee_id ])
  end
end
