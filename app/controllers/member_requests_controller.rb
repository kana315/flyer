class MemberRequestsController < ApplicationController
  before_action :authenticate_user!

  def create
    member_request = current_user.member_requests.create(troupe_id: params[:troupe_id])
    redirect_to troupe_path(member_request.troupe.id), notice: "#{member_request.troupe.name}へのメンバー申請をしました"
  end

  def destroy
    member_request = current_user.member_requests.find_by(id: params[:id]).destroy
    redirect_to troupe_path(member_request.troupe.id), notice: "#{member_request.troupe.name}へのメンバー申請を解除しました"
  end
end
