class MemberRelationsController < ApplicationController
  before_action :authenticate_user!
  before_action :access_restriction, only: [:create]

  def create
    member_relation = User.find(params[:user_id]).member_relations.create(troupe_id: params[:troupe_id])
    member_request = User.find(params[:user_id]).member_requests.find_by(troupe_id: params[:troupe_id]).destroy
    redirect_to troupe_path(member_relation.troupe_id), notice: "#{member_relation.user.name}さんをメンバー登録しました"
  end

  def destroy
    member_relation = MemberRelation.find_by(id: params[:id]).destroy
    redirect_to troupe_path(member_relation.troupe_id), notice: "#{member_relation.troupe.user.name}さんをメンバー登録解除しました"
  end

  def request_destroy(request_id)
    member_request = current_user.member_requests.find_by(id: request_id).destroy
  end

  private
  def access_restriction
    troupe = Troupe.find_by(id: params[:troupe_id])
    unless current_user.id == troupe.user_id then
      redirect_to troupes_path
    end
  end
end
