# frozen_string_literal: true

module ApplicationHelper
  def notif_friend_requests
    if current_user.friend_requests.empty?
      content_tag(:li, 'No Notifications ')
    else
      content_tag(:li) do
        link_to friendships_path do
          content_tag(:span, 'Friend Requests ') + content_tag(:span,
                                                               current_user.friend_requests.length.to_s,
                                                               class: 'badge badge-light')
        end
      end
    end
  end
end
