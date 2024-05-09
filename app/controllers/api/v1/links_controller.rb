module Api
  module V1
    class LinksController < ApplicationController
      skip_before_action :verify_authenticity_token

      def create
        link = Link.new(link_params)
        if link.save
          render json: { short_url: link.short_url, original_url: link.original_url }, status: :created
        else
          render json: link.errors, status: :unprocessable_entity
        end
      end

      def show
        link = Link.find_by(short_url: params[:short_url])
        if link
          render json: { original_url: link.original_url }
        else
          render json: { error: 'Not found' }, status: :not_found
        end
      end

      private

      def link_params
        params.require(:link).permit(:original_url)
      end
    end
  end
end
