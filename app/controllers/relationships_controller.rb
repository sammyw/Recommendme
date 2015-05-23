class RelationshipsController < ApplicationController
	
	def create
		@user = User.find(params[:relationship][:friendee_id])
		current_user.request_friendship!(@user)
		respond_to do |format|
			format.html { redirect_to account_path(@user.account) }
			format.js
		end
	end

	def destroy
		@relationship = Relationship.find(params[:id])
		@relationship.delete
		redirect_to :back
	end

	def accept
		@account = Account.find(params[:id])
		@relationship = Relationship.find(params[:rel])
		@relationship.update_attributes(approved: true)
		redirect_to account_path(@account)
	end

end