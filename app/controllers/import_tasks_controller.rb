class ImportTasksController < ApplicationController
  before_action :set_import_task, only: %i[ show edit update destroy ]

  # GET /import_tasks or /import_tasks.json
  def index
    @import_tasks = ImportTask.all
  end

  # GET /import_tasks/1 or /import_tasks/1.json
  def show
  end

  # GET /import_tasks/new
  def new
    @import_task = ImportTask.new
  end

  # GET /import_tasks/1/edit
  def edit
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

  # PATCH/PUT /import_tasks/1 or /import_tasks/1.json
  def update
    respond_to do |format|
      if @import_task.update(import_task_params)
        format.html { redirect_to @import_task, notice: "Import task was successfully updated." }
        format.json { render :show, status: :ok, location: @import_task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @import_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /import_tasks/1 or /import_tasks/1.json
  def destroy
    @import_task.destroy!

    respond_to do |format|
      format.html { redirect_to import_tasks_path, status: :see_other, notice: "Import task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_import_task
      @import_task = ImportTask.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def import_task_params
      params.require(:import_task).permit(:status_at)
    end
end
