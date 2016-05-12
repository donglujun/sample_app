class UsersController < Admin::ApplicationController
	before_action :find, only: [:show, :edit, :update, :destroy]
	def index		
		@users = User.all
		@users = @users.where('username like ?', "%#{params[:username]}%") unless params[:username].nil?
		@users = @users.order('updated_at desc').page(params[:page])
	end

	def edit
		@users = find
	end

	def update
		if @users.update(users_params)
	   	redirect_to admin_users_url, notice: '用户修改成功.' 
	  else
       render :edit, notice: '用户修改失败.'
    end
	end

	def new
		@users = User.new
	end

	def destroy
		if @users.destroy 
       redirect_to admin_users_url, notice: '用户删除成功.'
		end
	end

	def create 
		@users = User.new(users_params)
		@users.sign_in_count = 0
		@users.email = @users.username
		@users.status = '0'
		@users.admin = 0
		if @users.save
	     redirect_to admin_users_url, notice: '用户创建成功.' 
	  else
	     render :edit ,notice: '用户创建失败.'
	  end
	end

	def updstatus
		@users = find
		if @users.update_attribute(:status, params[:status])
		   redirect_to admin_users_url,notice:'状态修改成功.' 
		end
	end

private 
	def find
		@users = User.find_by_id(params[:id])
	end

	def users_params
 	    params.require(:user).permit(:username,:password,:email,:sign_in_count)
	end
end