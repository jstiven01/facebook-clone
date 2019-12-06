# frozen_string_literal: true

module PostsHelper
  def likeable_data(post)
    { reaction: { post_id: post.id } }
  end

  def liked?(post)
    !post.reactions.find_by(user_id: current_user.id).nil?
  end

  def like_id(post)
    post.reactions.find_by(user_id: current_user.id).id
  end

  def edit_delete_links_post(post)
    return unless current_user == post.user && current_page?(user_path(current_user))

    content_tag(:span, class: %w[card-footer links-post-options]) do
      link_to('Edit Post ',
              edit_post_path(post)) + link_to('Delete Post', post, method: :delete, data: { confirm: 'You sure?' })
    end
  end

  def likes_total_comments(post)
    return unless current_page?(root_path)

    content_tag(:div, class: %w[card-footer d-flex justify-content-between]) do
      concat(content_tag(:div, class: %w[d-flex like-unlike-button]) do
        if liked?(post)
          concat(content_tag(:button, class: %w[btn btn-primary like-unlike-btn]) do
            link_to 'Unlike ', reaction_path(like_id(post)), method: :delete
          end)
        else
          concat(content_tag(:button, class: %w[btn btn-primary like-unlike-btn]) do
            link_to 'I like it', reactions_path(likeable_data(post)), method: :post
          end)
        end
        concat(content_tag(:div, class: %w[count-likes pl-2]) do
          pluralize(post.reactions.length, 'like')
        end)
      end)

      concat(content_tag(:button, class: %w[btn btn-link count-comments],
                                  data: { toggle: 'collapse', target: "#collapse#{post.id}" },
                                  aria: { expanded: 'false', controls: "collapse#{post.id}" }) do
               pluralize(post.comments.length, 'comment')
             end)
    end
  end
end
