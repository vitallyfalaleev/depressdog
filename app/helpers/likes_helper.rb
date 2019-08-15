module LikesHelper
  def likes_user(type)
    type.likes.where("user_id = #{current_user.id}").any?
  end

  def like_id(type)
    type.likes.where("user_id = #{current_user.id}").ids[0]
  end
end
