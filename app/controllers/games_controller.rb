require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = []
    10.times do
      @letters << ('A'..'Z').to_a.sample
    end
  end

  def score
    # récupérer l'input utilisateur
    @word = params[:word].upcase

    # ------- faire un if else + calcul score ----------------------------------
    @score = 0
    @phrase = ''
    if in_the_grid && word_exist
      session[:score] += @word.length * 100
      @phrase = "Well done, your score is : #{@score = @word.length * 100}"
    elsif word_exist
      @phrase = 'Not in the grid, try again'
    elsif in_the_grid
      @phrase = 'Do not exist, try again'
    else
      @phrase = 'An error happened...'
    end
  end

  # ------- in the grid ?? -----------------------------------------------------
  def in_the_grid
    splitted_word = @word.chars
    splitted_word.all? { |letter| splitted_word.count(letter) <= params[:letters].count(letter) }
    # return true or false
  end

  # --------- is english ?? ----------------------------------------------------
  def word_exist
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    dico1 = URI.open(url).read
    dico = JSON.parse(dico1)
    dico['found']  # return true or false
  end
end
