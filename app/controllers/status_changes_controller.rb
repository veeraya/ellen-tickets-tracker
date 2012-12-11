class StatusChangesController < ApplicationController
  # GET /status_changes
  # GET /status_changes.json
  def index
    @status_changes = StatusChange.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @status_changes }
    end
  end

  # GET /status_changes/1
  # GET /status_changes/1.json
  def show
    @status_change = StatusChange.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @status_change }
    end
  end

  # GET /status_changes/new
  # GET /status_changes/new.json
  def new
    @status_change = StatusChange.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @status_change }
    end
  end

  # GET /status_changes/1/edit
  def edit
    @status_change = StatusChange.find(params[:id])
  end

  # POST /status_changes
  # POST /status_changes.json
  def create
    @status_change = StatusChange.new(params[:status_change])

    respond_to do |format|
      if @status_change.save
        format.html { redirect_to @status_change, notice: 'Status change was successfully created.' }
        format.json { render json: @status_change, status: :created, location: @status_change }
      else
        format.html { render action: "new" }
        format.json { render json: @status_change.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /status_changes/1
  # PUT /status_changes/1.json
  def update
    @status_change = StatusChange.find(params[:id])

    respond_to do |format|
      if @status_change.update_attributes(params[:status_change])
        format.html { redirect_to @status_change, notice: 'Status change was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @status_change.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /status_changes/1
  # DELETE /status_changes/1.json
  def destroy
    @status_change = StatusChange.find(params[:id])
    @status_change.destroy

    respond_to do |format|
      format.html { redirect_to status_changes_url }
      format.json { head :no_content }
    end
  end
end
