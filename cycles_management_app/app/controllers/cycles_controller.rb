class CyclesController < ApplicationController
  before_action :set_cycle, only: %i[ show edit update destroy ]

  # GET /cycles or /cycles.json
  def index
    @cycles = Cycle.all
  end

  # GET /cycles/1 or /cycles/1.json
  def show
  end

  # GET /cycles/new
  def new
    @cycle = Cycle.new(components: [])
    @cycle.build_component
  end

  # GET /cycles/1/edit
  def edit
  end

  # POST /cycles or /cycles.json
  def create
    @cycle = Cycle.new(cycle_params)

    respond_to do |format|
      if @cycle.save
        format.html { redirect_to @cycle, notice: "Cycle was successfully created." }
        format.json { render :show, status: :created, location: @cycle }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cycle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cycles/1 or /cycles/1.json
  def update
    respond_to do |format|
      if @cycle.update(cycle_params)
        format.html { redirect_to @cycle, notice: "Cycle was successfully updated." }
        format.json { render :show, status: :ok, location: @cycle }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cycle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cycles/1 or /cycles/1.json
  def destroy
    @cycle.destroy
    respond_to do |format|
      format.html { redirect_to cycles_url, notice: "Cycle was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cycle
      @cycle = Cycle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cycle_params
      params.require(:cycle).permit(:name, :components)
    end


    def cycle_params
      params.require(:cycle).permit(:name,
                                    components_attributes: [:name, :_destroy])
    end
end
