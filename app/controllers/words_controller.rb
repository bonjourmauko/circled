class WordsController < ApplicationController
  def index
    @words = Word.all
  end

  def new
    @word = Word.new
  end

  def create
    word = Word.new params[:word]

    if word.save
      redirect_to words_path, notice: "#{word.name} says: Yay! :)"
    else
      render action: "new"
    end
  end

  def edit
    @word = Word.find params[:id]
    @word.synonyms.build
  end

  def update
    word = Word.find params[:id]

    if not synonym = Word.find(name: params[:word][:synonym])
      synonyms = Word.create name: params[:word][:synonym]
    else
      word.synonyms     << synonym
      synonym.synonyms  << word
    end

    redirect_to words_path
  end

  def destroy
    @word = Word.find params[:id]
    @word.destroy

    redirect_to words_path, alert: "#{@word.name} says: You're evil! :("
  end
end
