class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  def index
    @articles = Article.all
  end

  def show; end

  def new
    @article = Article.new
  end

  # This method is called when the form is submitted
  def create
    # Create a new article with the parameters from the form
    @article = Article.new(article_params)

    # Save the article
    if @article.save
      # If the article is saved, redirect to the article's page
      redirect_to @article
    else
      # If the article is not saved, render the new article form again
      render :new
    end
  end

  def edit; end

  # This method is called when the form is submitted
  def update
    # Update the article with the parameters from the form
    if @article.update(article_params)
      # If the article is updated, redirect to the article's page
      redirect_to @article
    else
      # If the article is not updated, render the edit article form again
      render :edit
    end
  end

  # This method is called when the delete button is clicked
  def destroy
    # Delete the article
    @article.destroy

    # Redirect to the articles index page
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
