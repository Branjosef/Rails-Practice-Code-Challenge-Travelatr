class BloggersController < ApplicationController

    def index
        @bloggers = Blogger.all
    end

    def show
        @blogger = Blogger.find(params[:id])
        @total_likes = @blogger.sum_likes
        @post = @blogger.highest_likes
    end

    def new
        @blogger = Blogger.new

    end

    def edit
        @blogger = Blogger.find(params[:id])

    end

    def create
        @blogger = Blogger.find(blogger_params)
        if @blogger.save
            redirect_to blogger_path(@blogger)
        else
            render :new
        end
    end

    def update
        @blogger = Blogger.find(params[:id])
        if @blogger.update(blogger_params)
            redirect_to @blogger
        else
            redirect_to edit_blogger_path(@blogger)
        end

    end


    private

        def blogger_params
            params.require(:blogger).permit(:name, :bio, :age)
        end



end
