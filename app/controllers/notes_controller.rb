class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def new
    @note = Note.new
  end

  def edit
  end

  def create
    @note = Note.new(note_params)
    @current_group = @note.group

    respond_to do |format|
      if @note.save
        format.js
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @note.update(note_params)
        format.js
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @note.destroy
    respond_to do |format|
      format.js
    end
  end

  private
    def set_note
      @note = Note.find(params[:id])
    end

    def note_params
      params.require(:note).permit(:content, :group_id)
    end
end
