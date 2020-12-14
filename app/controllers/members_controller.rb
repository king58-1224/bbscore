class MembersController < ApplicationController
	def index
		@member = Member.all
	end

	def new
		@members = MemberCollection.new
	end

	def create
		@members = MemberCollection.new(members_collection_params)
		binding.pry
		@members.save
		redirect_to root_path
	end

	def edit
	end

	private

	# def members_params
	# 	params.require(:member).permit(:uniform_number, :grade, :first_name, :last_name).merge(team_id: current_team.id)
	# end

	def members_collection_params
		params.require(:members)
	end
end
