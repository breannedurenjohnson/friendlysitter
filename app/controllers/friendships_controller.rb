class FriendshipsController < ApplicationController
    def friend_request
        @parent_to_friend = Parent.find_by(id: params[:parent_id])
        if @parent_to_friend
            if !(@parent_to_friend.friends.include?(current_parent_user))
                Friendship.create(parent_id: current_parent_user.id, friend_id: @parent_to_friend.id)
            end
        end
        redirect_to "/parents/" + params[:parent_id].to_s
    end
    def accept_request
        @parent_to_friend = Parent.find_by(id: params[:parent_id])
        if @parent_to_friend
            if !(current_parent_user.friends.include?(@parent_to_friend)) && (@parent_to_friend.friends.include?(current_parent_user))
                Friendship.create(parent_id: current_parent_user.id, friend_id: @parent_to_friend.id)
            end
        end
        redirect_to "/parents/" + params[:parent_id].to_s
    end
    def remove_friend
        @parent_to_friend = Parent.find_by(id: params[:parent_id])
        if @parent_to_friend
            if (@parent_to_friend.friends.include?(current_parent_user))
                Friendship.find_by(parent_id: current_parent_user.id, friend_id: @parent_to_friend.id).destroy
            end
        end
        redirect_to "/parents/" + params[:parent_id].to_s
    end
end
