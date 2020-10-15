class DestinationsController < ApplicationController

    def index

    end

    def show
        @destination = Destination.find(params[:id])
        if !@destination.getting_likes.empty?
            @post = @destination.highest_likes
        end
    end

    def new

    end

    def edit

    end

    def create

    end

    def update

    end


    private

        def destination_params
            params.require(:destination).permit(:name, :country)
        end



end
