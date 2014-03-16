class TimetablesController < ApplicationController
  before_action :set_timetable, only: [:edit, :update, :history, :edit_detail, :update_detail]

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
    @period_count = JSON.parse(@timetable.data).count
  end

  def update_detail
    #update height of timetable
    timetable = JSON.parse(@timetable.data)
    period_count = Integer(params[:period_count])
    perv_period_count = timetable.size
    timetable = timetable[0...period_count]
    (period_count - perv_period_count).times do |i|
      timetable << [''] * 5
    end
    @timetable.update_attributes(data: timetable.to_json)

    #update subjects
    subjects = JSON.parse(params[:subjects])
    subjects.each do |subject_name|
      next if @timetable.subjects.index{|s| s.name == subject_name }
    
      @timetable.subjects.create(name: subject_name, color: :blue)
    end
    @timetable.subjects.each do |subject|
      next if subjects.include? subject.name

      subject.destroy 
    end

    redirect_to group_path(params[:group_id])
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
