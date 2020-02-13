class ComplimentsController < ApplicationController
    def create
        @parent = Parent.find_by(id: session[:parent_id])
        @sitter = Sitter.find_by(id: params[:sitter_id])
        if @sitter
            @compliment = Compliment.new(content: params['compliment'][:content], parent: @parent, sitter: @sitter)
            if @compliment.valid?
                @compliment.save
            else 
                flash[:errors] = @compliment.errors.full_messages
            end
        end
        redirect_to "/sitters/" + params[:sitter_id].to_s
    end
end
