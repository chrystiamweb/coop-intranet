class DocfilesController < ApplicationController
  before_action :set_docfile, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  load_and_authorize_resource only:[:new, :edit, :update, :destroy]

  # GET /docfiles
  # GET /docfiles.json
  def index
    @docfiles = Docfile.all
    @file_type = Docfile.all   
  end

  # GET /docfiles/1
  # GET /docfiles/1.json
  def show
  end

  # GET /docfiles/new
  def new
    @docfile = Docfile.new
  end

  # GET /docfiles/1/edit
  def edit
  end

  # POST /docfiles
  # POST /docfiles.json
  def create
    @docfile = Docfile.new(docfile_params)

    respond_to do |format|
      if @docfile.save
        format.html { redirect_to docfiles_url, notice: 'Docfile was successfully created.' }
        format.json { render :index, status: :created, location: @docfile }
      else
        format.html { render :index }
        format.json { render json: @docfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /docfiles/1
  # PATCH/PUT /docfiles/1.json
  def update
    respond_to do |format|
      if @docfile.update(docfile_params)
        format.html { redirect_to docfiles_url, notice: 'Docfile was successfully updated.' }
        format.json { render :index, status: :ok, location: @docfile }
      else
        format.html { render :index }
        format.json { render json: @docfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /docfiles/1
  # DELETE /docfiles/1.json
  def destroy
    @docfile.destroy
    respond_to do |format|
      format.html { redirect_to docfiles_url, notice: 'Docfile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_docfile
      @docfile = Docfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def docfile_params
      params.require(:docfile).permit(:name, :description, :file_type_id, :doc_file)
    end
end
