class WordsController < ApplicationController
  def index
    @words = Word.all
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.new params[:word]

    if @word.save
      redirect_to words_path, notice: "#{@word.name} says: Yay! :)"
    else
      render action: "new"
    end
  end

  def destroy
    @word = Word.find params[:id]
    @word.destroy

    redirect_to words_path, alert: "#{@word.name} says: You're evil! :("
  end
end
