class ClassChangesController < ApplicationController
  before_action :set_class_change, only: [:show, :edit, :update, :destroy]

  # GET /class_changes
  # GET /class_changes.json
  #def index
  #  @class_changes = ClassChange.all
  #end

  # GET /class_changes/1
  # GET /class_changes/1.json
  #def show
  #end

  # GET /class_changes/new
  def new
    @class_change = ClassChange.new
    @url = group_timetable_class_changes_path(params[:group_id])
  end

  # GET /class_changes/1/edit
  #def edit
  #end

  # POST /class_changes
  # POST /class_changes.json
  def create
    group = Group.find(params[:group_id])
    @class_change = group.timetable.class_changes.new(class_change_params)

    respond_to do |format|
      if @class_change.save
        format.html { redirect_to group, notice: 'Class change was successfully created.' }
        format.json { render action: 'show', status: :created, location: @class_change }
      else
        @url = group_timetable_class_changes_path(params[:group_id])
        format.html { render action: 'new' }
        format.json { render json: @class_change.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /class_changes/1
  # PATCH/PUT /class_changes/1.json
  #def update
  #  respond_to do |format|
  #    if @class_change.update(class_change_params)
  #      format.html { redirect_to @class_change, notice: 'Class change was successfully updated.' }
  #      format.json { head :no_content }
  #    else
  #      format.html { render action: 'edit' }
  #      format.json { render json: @class_change.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # DELETE /class_changes/1
  # DELETE /class_changes/1.json
  #def destroy
  #  @class_change.destroy
  #  respond_to do |format|
  #    format.html { redirect_to class_changes_url }
  #    format.json { head :no_content }
  #  end
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_change
      @class_change = ClassChange.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def class_change_params
      params.require(:class_change).permit(:date1, :index1, :date2, :index2)
    end
end
