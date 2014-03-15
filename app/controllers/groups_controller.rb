class GroupsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_group, only: [:show, :join_authorization, :join, :edit, :update, :destroy]
  before_filter :joining_check, only: [:show]

  # GET /groups
  # GET /groups.json
  def index
    @groups = params[:joining] ? current_user.groups : Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  end

  # GET /groups/new
  def new
    @group = Group.new(owner: current_user.id)
  end

  def join_authorization
  end

  def join
    unless params[:answer] == @group.answer
      flash[:notice] = '回答が違います'
      return redirect_to join_group_path(@group)
    end

    @group.users.each do |user|
      user.notify "#{current_user.name}が#{@group.name}に参加しました!"
    end
    @group.users << current_user

    flash[:notice] = "#{@group.name}に参加しました!"
    redirect_to @group
  end

  # GET /groups/1/edit
  #def edit
  #end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    @group.tag_list = params[:tags]

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render action: 'show', status: :created, location: @group }
      else
        format.html { render action: 'new' }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  #def update
  #  @group.tag_list = params[:tag]
  #  respond_to do |format|
  #    if @group.update(group_params)
  #      format.html { redirect_to @group, notice: 'Group was successfully updated.' }
  #      format.json { head :no_content }
  #    else
  #      format.html { render action: 'edit' }
  #      format.json { render json: @group.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # DELETE /groups/1
  # DELETE /groups/1.json
  #def destroy
  #  @group.destroy
  #  respond_to do |format|
  #    format.html { redirect_to groups_url }
  #    format.json { head :no_content }
  #  end
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    def joining_check
      unless @group.users.include? current_user
        flash[:notice] = "まだ#{@group.name}に参加していません"
        redirect_to :back
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name, :owner, :quiz, :answer)
    end
end
