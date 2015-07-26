class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_filter :check_user_permissions, except: [:index]

  # GET /appointments
  # GET /appointments.json
  def index




    @appointments =  @current_user.role == "customer" ? Appointment.where(:customer_id => @current_user.id).where("date_of_visit > ?", Date.today).all : Appointment.all
    pet_ids, customer_ids = [], []
    @appointments.each do |appointment|
      pet_ids << appointment.pet_id
      customer_ids << appointment.customer_id
    end
    @customer_info = User.where(id: customer_ids).index_by(&:id)
    @pet_info = Pet.where(id: pet_ids).index_by(&:id)
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
    @pets_array = Pet.all.map { |pet| [pet.name, pet.id] } 
    @customer_array = User.where(:role => 'customer').all.map{|customer| [customer.name, customer.id]}
  end

  # GET /appointments/1/edit
  def edit
    @pets_array = Pet.all.map { |pet| [pet.name, pet.id] } 
    @customer_array = User.where(:role => 'customer').all.map{|customer| [customer.name, customer.id]}
  end

  # POST /appointments
  # POST /appointments.json
  def create
    appointment_create_params = appointment_params 
    appointment_create_params[:date_of_visit] = Date.strptime(appointment_create_params[:date_of_visit], '%m/%d/%Y') rescue ""

    @appointment = Appointment.new(appointment_create_params)
    @pets_array = Pet.all.map { |pet| [pet.name, pet.id] } 
    @customer_array = User.where(:role => 'customer').all.map{|customer| [customer.name, customer.id]}
    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params[:appointment].permit(:pet_id, :customer_id, :date_of_visit, :appointment_required, :reason_for_visit)
    end
    def check_user_permissions
      redirect_to "/" and return if @current_user.role == "customer"
    end
end
