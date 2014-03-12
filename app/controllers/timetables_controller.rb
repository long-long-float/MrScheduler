class TimetablesController < ApplicationController
  def update
    group = Group.find(params[:group_id])
    @timetable = group.timetable
    respond_to do |format|
      if @timetable.update(timetable_params)
        format.json { head :no_content }
      else
        format.json { render json: @timetable.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def timetable_params
    params.permit(:data)
  end
end
