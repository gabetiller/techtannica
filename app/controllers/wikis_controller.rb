class WikisController < ApplicationController


  def index
    @wikis = policy_scope(Wiki)
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = current_user.wikis.build(wiki_params)
    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.update_attributes(wiki_params)

      authorize @wiki
      if @wiki.update(wiki_params)
        redirect_to @wiki
      else
        render :edit
      end
    end

    #
    # f @post.update_attributes(permitted_attributes(@post))
    #   redirect_to @post
    # else
    #   render :edit

  #   if @wiki.save
  #     flash[:notice] = "Wiki was updated."
  #     redirect_to @wiki
  #   else
  #     flash.now[:alert] = "There was an error saving the wiki. Please try again."
  #     render :edit
  #   end
  # end

  def destroy
    @wiki = Wiki.find(params[:id])

    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      render "welcome/index"
    else
      flash.now[:alert] = "There was an error deleting the wiki."
      render :show
    end
  end

  private
  
  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end
end
