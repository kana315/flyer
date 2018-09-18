module TroupesHelper
  def choose_new_or_edit
    if action_name == 'new'
      troupes_path
    elsif action_name == 'edit'
      troupe_path
    end
  end
end
