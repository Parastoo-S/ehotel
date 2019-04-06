class SearchController < ApplicationController
  def index
  end

  def search
    if (!params[:city].nil? && (params[:city] != "") &&(params[:capacity] != "") && !params[:capacity].nil?)
      @rooms = Room.is_located(params[:city]).has_capacity(params[:capacity].to_i)
      @filter = true
    elsif (!params[:city].nil? && (params[:city] != ""))
      @rooms = Room.is_located(params[:city])
      @filter = true
    elsif (!params[:capacity].nil? && (params[:capacity] != ""))
      @rooms = Room.has_capacity(params[:capacity].to_i)
      @filter = true
    else
      @rooms = Room.all
      @filter = false
    end
  end


end
