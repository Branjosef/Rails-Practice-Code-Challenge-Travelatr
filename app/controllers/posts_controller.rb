class PostsController < ApplicationController

    def index

    end

    def show
        @post = Post.find(params[:id])

    end

    def new
        @post = Post.new
        @bloggers = Blogger.all
        @destinations = Destination.all
    end

    def edit
        @post = Post.find(params[:id])
        @bloggers = Blogger.all
        @destinations = Destination.all
    end

    def create
        @post = Post.new(post_params)
        @bloggers = Blogger.all
        @destinations = Destination.all
        if @post.save
            redirect_to post_path(@post)
        else
            render :new
        end
    end

    def update
        @post = Post.find(params[:id])
        @bloggers = Blogger.all
        @destinations = Destination.all
        if @post.update(post_params)
            redirect_to post_path(@post)
        else
            render :edit
        end
    end


    def like
        @post = Post.find(params[:id])
        #byebug
        #@post.likes = @post.like += 1
        @post.increment!(:likes)
        redirect_to post_path(@post)
       end


    private

        def post_params
            params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
        end



end
