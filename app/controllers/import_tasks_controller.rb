class ImportTasksController < ApplicationController

  # GET /import_tasks or /import_tasks.json
  def index
    @import_tasks = ImportTask.all
  end

  # GET /import_tasks/new
  def new
    @import_task = ImportTask.new
  end


  # POST /import_tasks or /import_tasks.json
  def create
    @import_task = ImportTask.new
    @import_task.file.attach(params[:import_task][:file])


    respond_to do |format|
      if @import_task.save
        @tasks = Task.order(created_at: :desc)
        format.html { redirect_to root_path, notice: "Import task was successfully created." }
        format.json { render :show, status: :created, location: root_path }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @import_task.errors, status: :unprocessable_entity }
        format.turbo_stream
      end
    end
  end
end
