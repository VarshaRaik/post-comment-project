class Api::PostsController < ApplicationController
    skip_before_action :authenticate_user!
    def index
        @post = Post.all
        render json: {status:200, data: @post, include: ['comments']}
        #render json: @users, include:  ['account', 'account.segments'] 
    end

    def show
        @post = Post.find(params[:id])
        render json: @post, include:  ['comments'] 
    end

    def create
        @post = Post.new(post_params)
        if @post
            @post.save
            render json: {message: "post is created successfully."}, status: 200
        else
            render json: {error: 'unable to create post.'}, status:400
        end
    end

    private

    def post_params
        params.require(:post).permit(:image, :title, :body)
    end
end
