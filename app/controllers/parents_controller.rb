class ParentsController < ApplicationController
    # before_action :require_parent_login, except: [:new, :create]
    def new
    end
    def create
        @parent = Parent.new(parent_params)
        if @parent.valid?
            @parent.save
            session[:parent_id] = @parent.id
            redirect_to "/parents/dashboard"
        else
            flash[:errors] = @parent.errors.full_messages
            redirect_to "/parents/new"
        end
    end
    def dashboard
        @parent = Parent.find_by(id: session[:parent_id])
        @parents = Parent.all
        @not_friends = Parent.where.not(id: @parent).where.not(id: @parent.friends)
        @sitters = Sitter.order('hourly_rate DESC')
        @sitters_hired = @parent.sitters_hired.group(:id)
    end
    def network
        @parent = Parent.find_by(id: session[:parent_id])
        @parents = Parent.all
        @not_friends = Parent.where.not(id: @parent).where.not(id: @parent.friends)
        @sitters = Sitter.order('hourly_rate DESC')
        @sitters_hired = @parent.sitters_hired.group(:id)
    end
    def profile
        @parent = Parent.find_by(id: params[:parent_id])
    end
    def edit
        @parent = Parent.find_by(id: params[:parent_id])
    end
    def update
        @parent = Parent.find_by(id: params[:parent_id])
        if @parent && Parent.find_by(id: current_parent_user) == @parent
            @parent.update(parent_params)
            if @parent.valid?
                session[:parent_id] = @parent.id
                redirect_to "/parents/dashboard"
            else
                flash[:errors] = [@parent.errors.full_messages]
                redirect_to "/parents/edit/" + session[:parent_id].to_s
            end
        end
    end
    private
    def parent_params
        params.require(:parent).permit(:first_name, :last_name, :email, :password, :password_confirmation, :city, :state, :avatar, :about)
    end
    # def require_parent_login
    #     if session[:parent_id] == nil
    #         redirect_to "/"
    #     end
    # end
end
