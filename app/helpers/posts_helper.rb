module PostsHelper
  def post_url_choose_new_or_edit
    if action_name == 'new'
      confirm_posts_path
    elsif action_name == 'edit'
      post_path
    end
  end

  def find_troupe(post)
    Troupe.find(post.troupe_id).name
  end

end
