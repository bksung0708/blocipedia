class CollaboratorsController < ApplicationController
  def create
    wiki = Wiki.find(params[:wiki_id])
    user = User.find(params[:user_id])
    @collaborator = Collaborator.create(wiki_id: wiki.id, user_id: user.id)

    if @collaborator.save
      flash[:notice] = "Collaborator #{user.email} was added to this wiki."
      redirect_to wiki
    else
      flash[:alert] = "Collaborator was not added. Please try again."
    end
  end

  def destroy
    wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.find(params[:id])

    if @collaborator.destroy
      flash[:notice] = "Collaborator was removed from this wiki."
      redirect_to wiki
    else
      flash[:alert] = "Collaborator was not removed. Please try again."
    end
  end
end
