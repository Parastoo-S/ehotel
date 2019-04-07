class SearchController < ApplicationController
  def index
  end

  def search
    if (!params[:city].nil? && (params[:city] != "") &&(params[:capacity] != "") && !params[:capacity].nil?)
      @rooms = Room.is_located(params[:city]).has_capacity(params[:capacity].to_i).order("id DESC").paginate(page: params[:page], per_page: 10)
      @filter = true
    elsif (!params[:city].nil? && (params[:city] != ""))
      @rooms = Room.is_located(params[:city]).order("id DESC").paginate(page: params[:page], per_page: 10)
      @filter = true
    elsif (!params[:capacity].nil? && (params[:capacity] != ""))
      @rooms = Room.has_capacity(params[:capacity].to_i).order("id DESC").paginate(page: params[:page], per_page: 10)
      @filter = true
    else
      @rooms = Room.all.order("id DESC").paginate(page: params[:page], per_page: 10)
      @filter = false
    end
  end


end
