class MembersController < ApplicationController
  def index
    @members = Member.all
	end

  def new
    if team_signed_in?
      @members = OrderCollection.new
    else
      return redirect_to new_team_session_path
    end
  end

  def create
    @members = OrderCollection.new(orders_params)
    binding.pry
    if @members.valid?
      @members.save
      return redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      return redirect_to members_path
    else
      render :edit
    end
  end

  def destroy
    @member = Member.find(params[:id])
    if @member.destroy
      return redirect_to members_path
    else
      render :index
    end
  end



  private

  def member_params
    params.require(:member).permit(:uniform_number, :grade, :first_name,:last_name).merge(team_id: current_team.id)
  end

  def orders_params
    params.require(:members)
  end
end
