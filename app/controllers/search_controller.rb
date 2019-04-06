class SearchController < ApplicationController
  def index

  end

  def search
    if (!params[:city].nil? && (params[:city] != "") &&(params[:capacity] != "") && !params[:capacity].nil?)
      @rooms = Room.is_located(params[:city]).has_capacity(params[:capacity].to_i)
    elsif (!params[:city].nil? && (params[:city] != ""))
      @rooms = Room.is_located(params[:city])
    elsif (!params[:capacity].nil? && (params[:capacity] != ""))
      @rooms = Room.has_capacity(params[:capacity].to_i)
    end
  end


end
