class ComputersController < ApplicationController
  before_action :set_computer, only: [:show, :edit, :update, :destroy]

  # GET /computers
  # GET /computers.json
  def index
    @computers = Computer.all
  end

  # GET /computers/1
  # GET /computers/1.json
  def show
  end

  # GET /computers/with_filter
  # GET /computers/with_filter.json
  def with_filter
    @computers = Computer.all
  end

  # POST /computers/show_with_filter
  # POST /computers/show_with_filter.json
  def show_with_filter
    @computers = Computer.all

    params[:computer].each do |key,value|
      Rails.logger.warn "Param 12 #{key}: //  #{value}"
      @filter = key
      @val    = value
      if value != ""
        Rails.logger.warn "add one  #{@filter}:  [:computer][#{value}]"
        @computers = @computers.where(key: params[@val])
      end
      #@computers = @computers.where(processor: params[:computer][:processor])
    end
  end

  # GET /computers/new
  def new
    @computer = Computer.new
  end

  # GET /computers/1/edit
  def edit
  end

  # POST /computers
  # POST /computers.json
  def create
    @computer = Computer.new(computer_params)

    respond_to do |format|
      if @computer.save
        format.html { redirect_to @computer, notice: 'Computer was successfully created.' }
        format.json { render :show, status: :created, location: @computer }
      else
        format.html { render :new }
        format.json { render json: @computer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /computers/1
  # PATCH/PUT /computers/1.json
  def update
    respond_to do |format|
      if @computer.update(computer_params)
        format.html { redirect_to @computer, notice: 'Computer was successfully updated.' }
        format.json { render :show, status: :ok, location: @computer }
      else
        format.html { render :edit }
        format.json { render json: @computer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /computers/1
  # DELETE /computers/1.json
  def destroy
    @computer.destroy
    respond_to do |format|
      format.html { redirect_to computers_url, notice: 'Computer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_computer
      @computer = Computer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def computer_params
      params.require(:computer).permit(:name, :processor, :storage, :ram, :size)
    end
end
