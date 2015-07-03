class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_teacher!

  def index
    @games = Game.where(teacher_id: current_teacher.id)
  end

  def show
  end

  def new
    @game = Game.new(teacher_id: current_teacher.id)
  end

  def edit
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to @game, notice: 'Game was successfully created.'
    else
      render :new
    end
  end

  def update
    if @game.update(game_params)
      redirect_to @game, notice: 'Game was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @game.destroy
    redirect_to games_url, notice: 'Game was successfully destroyed.'
  end


  private  def set_game
      @game = Game.find(params[:id])
  end

  private  def game_params
      params.require(:game).permit(:teacher_id, :name, :student_icon, :movement)
  end
  
end
