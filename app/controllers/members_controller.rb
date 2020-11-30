class MembersController < ApplicationController
  def index
    @members = Member.all
	end

	def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.valid?
      @member.save
      return redirect_to members_path
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


end
