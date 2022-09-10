class HealthsController < ApplicationController
  before_action :set_health, only: %i[ show edit update destroy ]
  before_action :set_pets, only: %i[ new create edit update ]

  # GET /healths or /healths.json
  def index
    @healths = Health.all.page(params[:page]).per(5)
  end

  # GET /healths/1 or /healths/1.json
  def show
  end

  # GET /healths/new
  def new
    @health = Health.new
  end

  # GET /healths/1/edit
  def edit
  end

  # POST /healths or /healths.json
  def create
    @health = Health.new(health_params)

    respond_to do |format|
      if @health.save
        format.html { redirect_to health_url(@health), notice: "Health was successfully created." }
        format.json { render :show, status: :created, location: @health }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @health.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /healths/1 or /healths/1.json
  def update
    respond_to do |format|
      if @health.update(health_params)
        format.html { redirect_to health_url(@health), notice: "Health was successfully updated." }
        format.json { render :show, status: :ok, location: @health }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @health.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /healths/1 or /healths/1.json
  def destroy
    @health.destroy

    respond_to do |format|
      format.html { redirect_to healths_url, notice: "Health was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def search
    @healths = Health.search(params[:keyword]).page(params[:page]).per(20)
    @keyword = params[:keyword]
    render "index"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_health
      @health = Health.find(params[:id])
    end

    def set_pets
      @pets = current_user.families.first.pets
    end

    # Only allow a list of trusted parameters through.
    def health_params
      params.require(:health).permit(:user_id, :pet_id, :title, :content, :start_time)
    end
end
