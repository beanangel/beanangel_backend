class SearchController < ApplicationController
  def create
    search = Search.create!(query: params[:query].to_s)
    search.query_and_save_results!
    render json: search
  end
end
