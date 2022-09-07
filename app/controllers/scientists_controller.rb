class ScientistsController < ApplicationController
    def index
        scientists = Scientist.all
        render json: scientists, status: :ok
    end

    def show
        scientist = find_sci
        render json: scientist, status: :ok
    end

    def create
        scientist = Scientist.create!(sci_params)
        render json: scientist, status: :created
    end

    def destroy
        scientist = find_sci
        scientist.destroy!
    end

    def update
        scientist = find_sci
        scientist.update!(sci_params)
        render json: scientist, status: :accepted
    end

    private

    def find_sci
        Scientist.find(params[:id])
    end

    def sci_params
        params.permit(:name, :field_of_study, :avatar)
    end
end
