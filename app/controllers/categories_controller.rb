class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy, :restore]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.where(flag_delete: false)
  end

  def deleted
    if current_user.is_admin
      @categories = Category.where(flag_delete: true)
    else
      flash[:notice] = 'Access Denied'
      redirect_to categories_path 
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @posts = Post.all.where(category_id: @category.id).order(created_at: :desc)
  end

  # GET /categories/new
  def new
    if current_user.is_admin
      @category = Category.new
    else
      flash[:notice] = 'Access Denied'
      redirect_to categories_path 
    end
  end

  # GET /categories/1/edit
  def edit
    if current_user.is_admin
      
    else
      flash[:notice] = 'Access Denied'
      redirect_to categories_path 
    end
  end

  # POST /categories
  # POST /categories.json
  def create
    if current_user.is_admin
      @category = Category.new(category_params)

      respond_to do |format|
        if @category.save
          format.html { redirect_to @category, notice: 'Category was successfully created.' }
          format.json { render :show, status: :created, location: @category }
        else
          format.html { render :new }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:notice] = 'Access Denied'
      redirect_to categories_path 
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    if current_user.is_admin
      respond_to do |format|
        if @category.update(category_params)
          format.html { redirect_to @category, notice: 'Category was successfully updated.' }
          format.json { render :show, status: :ok, location: @category }
        else
          format.html { render :edit }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:notice] = 'Access Denied'
      redirect_to categories_path 
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    if current_user.is_admin
      @category.flag_delete = true
      @category.save
      respond_to do |format|
        format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      flash[:notice] = 'Access Denied'
      redirect_to categories_path 
    end
  end

  def restore
    if current_user.is_admin
      @category.flag_delete = false
      @category.save
      respond_to do |format|
        format.html { redirect_to deleted_category_path, notice: 'Category was successfully restored' }
        format.json { head :no_content }
      end
    else
      flash[:notice] = 'Access Denied'
      redirect_to categories_path 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:nama, :deskripsi, :flag_delete)
    end
end
