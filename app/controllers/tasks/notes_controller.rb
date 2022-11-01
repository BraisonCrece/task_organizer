class Tasks::NotesController < ApplicationController
  before_action :set_task
  def create
    @note = @task.notes.new(note_params)
    @note.user = current_user
    @note.save
  end

  private
    
    def set_task
      @task = Task.find(params[:task_id])
    end

    def note_params
      params.require(:note).permit(:body)
    end

end