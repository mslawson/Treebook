class UserFriendshipsController < ApplicationController
	before_filter :authenticate_user!
	
	def index
		@user_friendships = current_user.user_friendships.all 
	end

	def edit
		@user_friendship = current_user.user_friendships.find(params[:id])
		@friend = @user_friendship.friend
	end

	def accept
		@user_friendship = current_user.user_friendships.find(params[:id])
		if @user_friendship.accept!
			flash[:success] = "You are now friends with #{@user_friendship.friend.first_name}"
		else
			flash[:error] = "That friendship could not be accepted."
		end
		redirect_to user_friendships_path 
	end

	def new
		if params[:friend_id]
			@friend = User.where(profile_name: params[:friend_id]).first
			raise ActiveRecord::RecordNotFound if @friend.nil?
			@user_friendship = current_user.user_friendships.new(friend: @friend)
		else
			flash[:error] = "Friend Required"
		end
	rescue ActiveRecord::RecordNotFound 
		render file: 'public/404', status: :not_found
	end

	def create
		if params[:user_friendship] && params[:user_friendship].has_key?(:friend_id)
			@friend = User.where(profile_name: params[:user_friendship][:friend_id]).first
			@user_friendship = current_user.user_friendships.new(friend: @friend)
			@user_friendship.save
			redirect_to profile_path(@friend)
			flash[:success] = "You are now friends with #{@friend.full_name}"
		else
			flash[:error] = "Friend Required"
			redirect_to root_path
		end
	end



end


