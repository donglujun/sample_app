class IssuesController < ApplicationController
  def index
    @issues = Issue.order("created_at desc").page(params[:page]).per(10)
  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = Issue.new(employee_parames)
    if @issue.save
      redirect_to issues_path, notice: 'succeed'
    else
      redirect_to issues_path, notice: 'fail'
    end
  end

  private
  
    def employee_parames
      params.require(:issue).permit(:level, :description, :state, :employee_id)
    end

end