class TimetablesController < ApplicationController
  before_action :set_timetable, only: [:edit, :update, :history]

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

  def edit_detail
  end

  def update_detail
  end

  def history
  end

  private

  def set_timetable
    @timetable = Group.find(params[:group_id]).timetable
  end

  def timetable_params
    params.permit(:data)
  end
end
