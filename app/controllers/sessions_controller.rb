class SessionsController < ApplicationController
    before_action :require_parent_login, only: [:parent_destroy]
    before_action :require_sitter_login, only: [:sitter_destroy]
    def new 
    end
    def create
        @parent = Parent.find_by_email(params[:email])
        if @parent != nil
            if @parent.try(:authenticate, params[:password]) == false
                flash[:errors] = "Invalid Combination"
                redirect_to "/"
            else
                session[:parent_id] = @parent.id
                redirect_to "/parents/dashboard"
            end
        else
            @sitter = Sitter.find_by_email(params[:email])
            if @sitter != nil
                if @sitter.try(:authenticate, params[:password]) == false
                    flash[:errors] = "Invalid Combination"
                    redirect_to "/"
                else
                    session[:sitter_id] = @sitter.id
                    redirect_to "/sitters/dashboard"
                end
            else 
            flash[:errors] = "Account does not exist"
            redirect_to "/"
            end
        end
    end
    def parent_destroy
        session[:parent_id] = nil
        redirect_to "/"
    end
    def sitter_destroy
        session[:sitter_id] = nil
        redirect_to "/"
    end

    private
    def require_parent_login
        if session[:parent_id] == nil
            redirect_to "/"
        end
    end
    def require_sitter_login
        if session[:sitter_id] == nil
            redirect_to "/"
        end
    end
end
