class NutritionFactsController < ApplicationController
  before_action :admin_user 
  before_action :set_nutrition_fact, only: [:show, :edit, :update, :destroy]

  def new
    @nutrition_fact = NutritionFact.new
    @nutrition_fact.serving_size = 100.0
    @nutrition_fact.size_unit_id = 1
  end

  def index
    @nutrition_facts = NutritionFact.paginate(page: params[:page])
  end

  def show
  end

  def create
    @nutrition_fact = current_user.nutrition_facts.build(nutrition_fact_params)
    if @nutrition_fact.save
      flash[:success] = "Nutrition fact created!"
      redirect_to @nutrition_fact
    else
      render 'new'
    end
    # respond_to do |format|
    #   if @nutrition_fact.save
    #     format.html { redirect_to @nutrition_fact, notice: 'Nutrition fact was successfully created.' }
    #     format.json { render action: 'show', status: :created, location: @nutrition_fact }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @nutrition_fact.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def edit
    @nutrition_fact.updated_by = current_user.id
  end

  def update
    @nutrition_fact.updated_by = current_user.id
    if @nutrition_fact.update_attributes(nutrition_fact_params)
      flash[:success] = 'Nutrition fact was successfully updated.'
      redirect_to @nutrition_fact
    else
      render 'edit'
    end
    # respond_to do |format|
    #   if @nutrition_fact.update(nutrition_fact_params)
    #     format.html { redirect_to @nutrition_fact, notice: 'Nutrition fact was successfully updated.' }
    #     format.json { head :no_content }
    #   else
    #     format.html { render action: 'edit' }
    #     format.json { render json: @nutrition_fact.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def destroy
    @nutrition_fact.destroy
    flash[:success] = "Nutrition fact destroyed."
    redirect_to nutrition_facts_url
    # respond_to do |format|
    #   format.html { redirect_to nutrition_facts_url }
    #   format.json { head :no_content }
    # end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def nutrition_fact_params
      params.require(:nutrition_fact).permit(:code, :name, 
                                             :size_unit_id, :size, :serving_size, :servings, 
                                             :energy, :energy_percent, 
                                             :protein, :protein_percent, 
                                             :fat, :fat_percent, 
                                             :carbohydrate, :carbohydrate_percent, 
                                             :sodium, :sodium_percent,
                                             :created_by, :updated_by)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_nutrition_fact
      @nutrition_fact = NutritionFact.find(params[:id])
    end
end
