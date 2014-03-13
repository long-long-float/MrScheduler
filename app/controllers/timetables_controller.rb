class TimetablesController < ApplicationController
  before_action :set_timetable, only: [:edit, :update]

  def edit
  end

  def update
    respond_to do |format|
      if @timetable.update(timetable_params)
        format.json { head :no_content }
      else
        format.json { render json: @timetable.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_timetable
    @timetable = Group.find(params[:group_id]).timetable
  end

  def timetable_params
    params.permit(:data)
  end
end
