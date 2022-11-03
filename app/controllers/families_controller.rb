class FamiliesController < ApplicationController
  before_action :set_family, only: %i[ show edit update destroy ]

  # GET /families or /families.json
  def index
    @families = Family.all
    @family = current_user.families.first
  end

  # GET /families/1 or /families/1.json
  def show
  end

  # GET /families/new
  def new
    @family = Family.new
  end

  # GET /families/1/edit
  def edit
  end

  # POST /families or /families.json
  # def create
  #   current_user.families.build(family_params)
  #   if current_user.save
  #     redirect_to user_path(current_user), notice: "作成しました"
  #   else
  #     render 'new'
  #   end
  # end

  def create
    family = Family.new(family_params)
    family.save
    group = Group.new
    group.user_id = current_user.id
    group.family_id = Family.last.id
    if group.save
      redirect_to user_path(current_user), notice: "作成しました"
    end
  end

  # PATCH/PUT /families/1 or /families/1.json
  def update
    respond_to do |format|
      if @family.update(family_params)
        format.html { redirect_to family_url(@family), notice: "Family was successfully updated." }
        format.json { render :show, status: :ok, location: @family }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @family.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /families/1 or /families/1.json
  def destroy
    @family.destroy

    respond_to do |format|
      format.html { redirect_to families_url, notice: "Family was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_family
      @family = Family.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def family_params
      params.require(:family).permit(:name)
    end
end
