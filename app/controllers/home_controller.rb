class HomeController < ApplicationController
  def index
    # @tasks = Task.where("is_deleted = ? OR is_deleted IS NULL", false)
    @tasks = Task.all
    @task = Task.new
  end
end
