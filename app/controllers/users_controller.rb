class UsersController < ApplicationController

	def index
		@users = User.all
		render json: @users
	end

	def show
		find_user
		render json: @user
	end

	def create
		@user = User.new(user_params)
		if @user.save
			render json: @user
		else
			render json: { error: 'Unable to create user' }, status: 400
		end
	end

	def update
		find_user
		if @user
			@user.update(user_params)
			render json: { message: 'User updated' }, status: 200
		else
			render json: { error: 'Unable to update user' }, status: 400
		end
	end

	def destroy
		find_user
		if @user
			@user.destroy
			render json: { message: 'User deleted' }, status: 200
		else
			render json: { error: 'Unable to delete user' }, status: 400
		end
	end

	private
		def user_params
			params.require(:user).permit(:name)
		end

		def find_user
			@user = User.find(params[:id])
		end
end
