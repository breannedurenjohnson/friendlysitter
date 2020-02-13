class Friendship < ApplicationRecord
  belongs_to :parent, :foreign_key => "parent_id", :class_name => "Parent"
  belongs_to :friend, :foreign_key => "friend_id", :class_name => "Parent"

  # after_create :create_inverse

  # def create_inverse
  #     self.class.create(parent: self.friend, friend: self.parent)
  # end

  # reverse will run over and over until below statement stops it
  validates_uniqueness_of :parent, scope: :friend
end
