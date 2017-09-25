class WikisController < ApplicationController

  before_action :private_wiki?, except: [:index, :show, :new, :create]

  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def create
    @wiki = Wiki.new
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.private = params[:wiki][:private]
    @wiki.user = current_user

    if @wiki.save
      flash[:notice] = "Wiki was posted."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was a problem posting a wiki."
      render :new
    end
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.private = params[:wiki][:private]

    if @wiki.save
      flash[:notice] = "Wiki was updated."
      redirect_to @wiki
    else
      flash.now[:alert] = "Error saving wiki. Please try again."
      render :edit
    end

  end

  def destroy
    @wiki = Wiki.find(params[:id])

    if @wiki.destroy
      flash[:notice] = "Wiki was deleted."
      redirect_to action: :index
    else
      flash.now[:alert] = "There was a problem deleting the wiki. Try again."
      redirect_to @wiki
    end
  end

  def private_wiki?
    wiki = Wiki.find(params[:id])
    if wiki.private?
      if current_user != wiki.user
        flash.now[:notice] = "This wiki is private."
        redirect_to wiki_path
      end
    end
  end
end
