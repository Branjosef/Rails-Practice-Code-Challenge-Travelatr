class DestinationsController < ApplicationController

    def index

    end

    def show

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
