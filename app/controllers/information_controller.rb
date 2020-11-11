class InformationController < ApplicationController
  before_action :set_information, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @information = Information.new
    @contact_id = Contact.find(params[:new_contact_id]["contact_id"].to_i)
  end

  def edit
  end

  def create
    @information = Information.new(information_params)
    respond_to do |format|
      if @information.save
        format.html { redirect_to contact_path(@information.contact), notice: 'Information was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @redirect = Information.find(params[:id].to_i).contact
    respond_to do |format|
      if @information.update(information_params)
        format.html { redirect_to contact_path(@redirect), notice: 'Information was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @redirect = Information.find(params[:id].to_i).contact
    @information.destroy
    respond_to do |format|
      format.html { redirect_to contact_path(@redirect), notice: 'Information was successfully destroyed.' }
    end
  end

  private
    def set_information
      @information = Information.find(params[:id])
    end

    def information_params
      params.require(:information).permit(:telephone, :address, :email, :contact_id)
    end
end
