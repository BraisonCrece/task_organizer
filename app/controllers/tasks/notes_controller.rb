class Tasks::NotesController < ApplicationController
  before_action :set_task
  def create
    @note = @task.notes.new(note_params)
    @note.user = current_user
    @note.save

    if @note.persisted?
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(
            :notes,
            partial: 'tasks/notes/note',
            locals: { note: @note }
          ),
          status: 303
        end
      end
    end
  end

  private
    
    def set_task
      @task = Task.find(params[:task_id])
    end

    def note_params
      params.require(:note).permit(:body)
    end

end