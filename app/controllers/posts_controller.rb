class PostsController < ApplicationController


  def new
  	@post = Post.new
  end

  def create
    # ストロングパラメーターを使用
     post = Post.new(post_params)
    # DBへ保存する
    post.save
    redirect_to post_path(post.id)
    # 詳細画面へリダイレクト
    flash[:success] = 'Book was successfully created.'
  end

  def index
  	@posts = Post.all
    @post = Post.new
  end

  def show
  	@post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
        post.update(post_params)
        redirect_to post_path(post.id)
  end
  def destroy
    post = Post.find(params[:id])
        post.destroy
        redirect_to posts_path
        flash[:success] = 'Book was successfully destroyed.'
  end


  private
  def post_params
  	params.require(:post).permit(:title, :body)
  end

end