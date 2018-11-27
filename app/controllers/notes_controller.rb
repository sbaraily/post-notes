class NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :edit, :destroy]


  def index
    @notes = Note.all
  end

  def show
    
  end

  def new
    @note = Note.new
    render partial: "form"
  end

  def create
    @note = Note.create(note_params)
    if @note.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    render partial: "form"
  end

  def update
    if @note.update(note_params)
      redirect_to @note
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to root_path
  end

  private
    def note_params
      params.require(:note).permit[:name]
    end

    def set_note
      @note = Note.find(params[:id])
    end
end
