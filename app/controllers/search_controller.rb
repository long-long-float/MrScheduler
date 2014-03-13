class SearchController < ApplicationController
  def search
    @groups = Group.tagged_with(params[:query])
    @tasks = current_user.groups.map{|g| g.tasks.tagged_with(params[:query]).to_a }.flatten
  end
end
