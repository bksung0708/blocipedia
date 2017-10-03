class CollaboratorsController < ApplicationController
  before_action :set_wiki

  def create
    @collaborator = Collaborator.new
    @user = User.find(params[:id])

    if @collaborator.save
      redirect_to @wiki, notice: "Collaborator #{@user} was saved successfully."
    else
      flash.now[:alert] = "There was an error saving the collaborator. Try again."
      render :new

      post = Post.find(params[:post_id])
      favorite = current_user.favorites.build(post: post)

  if favorite.save
    flash[:notice] = "Post favorited."
  else
    flash[:alert] = "Favoriting failed."
  end

# #13
  redirect_to [post.topic, post]

    @wiki = Wiki.find(params[:wiki_id])
    collaborator =
  end

  def edit
    @collaborator = Collaborator.find(params[:id])
  end

  def destroy
  end

  private
  def set_wiki
    @wiki = Wiki.find(params[:id])
  end
end
