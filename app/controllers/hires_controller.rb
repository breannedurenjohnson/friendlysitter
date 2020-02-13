class HiresController < ApplicationController
    def add_sitter
        @parent = Parent.find_by(id: session[:parent_id])
        @sitter = Sitter.find_by(id: params[:sitter_id])
        if @sitter
            if !(@sitter.parents_who_hired.include?(current_parent_user))
                Hire.create(parent: @parent, sitter: @sitter)
            end
        end
        redirect_to "/sitters/" + params[:sitter_id].to_s
    end
    def remove_sitter
        @parent = Parent.find_by(id: session[:parent_id])
        @sitter = Sitter.find_by(id: params[:sitter_id])
        if @sitter
            if (@sitter.parents_who_hired.include?(current_parent_user))
                Hire.find_by(parent: @parent, sitter: @sitter).destroy
            end
        end
        redirect_to "/parents/network/" + session[:parent_id].to_s
    end
end
