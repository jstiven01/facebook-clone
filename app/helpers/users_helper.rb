# frozen_string_literal: true

module UsersHelper
  def gravatar_for(user, size: 80)
    if user.profile_image
      profile_url = if size >= 200
                      user.profile_image + '?type=large'
                    else
                      user.profile_image + '?type=small'
                    end
    else
      gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
      profile_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    end

    image_tag(profile_url, alt: user.full_name, class: 'gravatar')
  end

  def friendship_requested(user)
    friendship_requested = current_user.friendships.filter { |friendship| friendship.friend_id == user.id }
    if friendship_requested.empty?
      friendship_requested = user.friendships.filter { |friendship| friendship.friend_id == current_user.id }
    end
    friendship_requested
  end

  def delete_friend_link(user)
    return unless current_page?(friendships_path)

    link_to 'Delete', friendship_requested(user), method: :delete, data: { confirm: 'You sure?' }
  end
end
