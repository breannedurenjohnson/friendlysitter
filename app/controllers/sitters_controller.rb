class SittersController < ApplicationController
    # before_action :require_sitter_login, except: [:new, :create]
    def new 
    end
    def create
        @sitter = Sitter.new(sitter_params)
        if @sitter.valid?
            @sitter.save
            session[:sitter_id] = @sitter.id
            redirect_to "/sitters/dashboard"
        else
            flash[:errors] = @sitter.errors.full_messages
            redirect_to "/sitters/new"
        end
    end
    def dashboard
        @sitter = Sitter.find_by(id: session[:sitter_id])
        @parents = Parent.all
        @parents_hired_by = @sitter.parents_who_hired.group(:id)
    end
    def network
        @sitter = Sitter.find_by(id: session[:sitter_id])
        @parents = Parent.all
        @parents_hired_by = @sitter.parents_who_hired.group(:id)
    end
    def profile
        @sitter = Sitter.find_by(id: session[:sitter_id])
        @sitter = Sitter.find_by(id: params[:sitter_id])
        @compliments = Compliment.where(sitter: @sitter).group(:id)
    end
    def edit
        @sitter = Sitter.find_by(id: session[:sitter_id])
    end
    def update
        @sitter = Sitter.find_by(id: params[:sitter_id])
        if @sitter && Sitter.find_by(id: current_sitter_user) == @sitter
            @sitter.update(sitter_params)
            if @sitter.valid?
                session[:sitter_id] = @sitter.id
                redirect_to "/sitters/" + session[:sitter_id].to_s
            else
                flash[:errors] = [@sitter.errors.full_messages]
                redirect_to "/sitters/" + session[:sitter_id].to_s
            end
        end
    end
    private
    def sitter_params
        params.require(:sitter).permit(:first_name, :last_name, :email, :password, :password_confirmation, :city, :state, :about, :hourly_rate, :avatar)
    end
    # def require_sitter_login
    #     if session[:sitter_id] == nil
    #         redirect_to "/"
    #     end
    # end
end
