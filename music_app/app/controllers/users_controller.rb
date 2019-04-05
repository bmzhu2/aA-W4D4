class UsersController < ApplicationController
    def index
        render :index
    end
    
    def new
        @user = User.new
        
        render :new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            login!(@user)
            redirect_to users_url
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def show
        @user = User.find_by(id: params[:id])

        if @user
            render :show
        else
            render json: "no such user", status: 404
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :password)
    end
end
