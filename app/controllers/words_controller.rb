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
      redirect_to words_path, notice: 'Yay!'
    else
      render action: "new"
    end
  end
end
