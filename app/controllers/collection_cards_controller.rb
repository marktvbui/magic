class CollectionCardsController < ApplicationController

  def index
    @collections = CollectionCard.all
  end

  def new
    @collections = CollectionCard.new
  end

  def create 
    @collections = CollectionCard.new(user_id: current_user,
                                      name: params[:name],
                                      mana: params[:mana],
                                      color: params[:color],
                                      rarity: params[:rarity],
                                      power: params[:power],
                                      toughness: params[:toughness]
                                      )
    if @collections.save
      flash[:success] = "Contact has been created"
      redirect_to "/contacts"
    else
      flash[:danger] = @collections.errors.full_messages.join("<br>").html_safe
      render :new
    end

  end

  def show
    @collections = CollectionCard.find_by(id: params[:id])
  end

  def edit
    @collections = CollectionCard.find_by(id: params[:id])
  end

  def update
    @collections = CollectionCard.find_by(id: params[:id])
  end

  def delete
    @collections = CollectionCard.find_by(id: params[:id])
  end

end