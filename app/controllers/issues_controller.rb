class IssuesController < ApplicationController
  def index
    @issues = Issue.order("created_at desc").page(params[:page]).per(10)
  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = Issue.new(issue_parames)
    if @issue.save
      redirect_to issues_path, notice: 'succeed'
    else
      redirect_to issues_path, notice: 'fail'
    end
  end

  def edit
    @issue = Issue.find(params[:id])
  end

  def update
    @issue = Issue.find(params[:id])
    if @issue.update(issue_parames)
      redirect_to issues_path, notice: 'succeed'
    else
      redirect_to issues_path, notice: 'fail'
    end
  end

  def destroy
    @issue = Issue.find(params[:id])
    if @issue.destroy
      redirect_to action: :index
    else
      redirect_to action: :index
    end
  end

  def state
    @issue = Issue.find(params[:id])
    if @issue.state == '未修复'
      @issue.update(state: 1)
      redirect_to issues_path, notice: 'succeed'
    else
      redirect_to issues_path, notice: 'It was fixed.'
    end
  end

  private
  
    def issue_parames
      params.require(:issue).permit(:level, :description, :state, :employee_id)
    end

end