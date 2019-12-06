# frozen_string_literal: true

module CommentsHelper
  def delete_comment_button(comment)
    return unless comment.user == current_user

    content_tag(:li, class: %w[link-delete-comment py2]) do
      link_to 'Delete Comment', comment, method: :delete, data: { confirm: 'You sure?' }
    end
  end
end
