class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = User.find(current_user.id).contact.all
  end

  def show
    @information = @contact.information 
  end

  def new
    @contact = Contact.new
  end

  def edit
  end

  def create
    if current_user.id == contact_params[:user_id].to_i
      @contact = Contact.new(contact_params)
    end

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
      else
        format.html { render :new }
      end
    end
    
  end

  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
    end
  end

  private
    def set_contact
      @contact = User.find(current_user.id).contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:name, :user_id)
    end

    # def user_check?
    #   current_user.id == contact_params.user_id
    # end
end
