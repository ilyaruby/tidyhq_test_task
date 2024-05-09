class LinksController < ApplicationController
  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to @link, notice: 'Short link created successfully.'
    else
      render :new
    end
  end

  def show
    @link = Link.find_by(id: params[:id])
    render :show
  end

  def unshort
    @link = Link.find_by(short_url: params[:short_url])
    if @link.present?
      redirect_to @link.original_url, allow_other_host: true
    else
      render plain: "That link does not exist or expired", status: :not_found
    end
  end

  private

  def link_params
    params.require(:link).permit(:original_url)
  end
end
