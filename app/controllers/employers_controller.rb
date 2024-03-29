class EmployersController < ApplicationController
  http_basic_authenticate_with name: "flatiron", password: "flat1ron", except: :index
  
  # GET /employers
  # GET /employers.json
  def index
    @employers = Employer.order("position ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employers.to_json, callback: params[:callback] }
    end
  end

  # GET /employers/1
  # GET /employers/1.json
  def show
    @employer = Employer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @employer }
    end
  end

  # GET /employers/new
  # GET /employers/new.json
  def new
    last_employer = Employer.order('position DESC').first
    pos = last_employer.position
    @employer = Employer.new
    @employer.position = pos + 1

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @employer }
    end
  end

  # GET /employers/1/edit
  def edit
    @employer = Employer.find(params[:id])
  end

  # POST /employers
  # POST /employers.json
  def create
    @employer = Employer.new(params[:employer])

    respond_to do |format|
      if @employer.save
        format.html { redirect_to @employer, notice: 'Employer was successfully created.' }
        format.json { render json: @employer, status: :created, location: @employer }
      else
        format.html { render action: "new" }
        format.json { render json: @employer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /employers/1
  # PUT /employers/1.json
  def update
    @employer = Employer.find(params[:id])

    respond_to do |format|
      if @employer.update_attributes(params[:employer])
        format.html { redirect_to @employer, notice: 'Employer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @employer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employers/1
  # DELETE /employers/1.json
  def destroy
    @employer = Employer.find(params[:id])
    @employer.img = nil
    @employer.save
    @employer.destroy

    respond_to do |format|
      format.html { redirect_to employers_url }
      format.json { head :no_content }
    end
  end

  #ajax post: sort method
  def sort
    # Rails.logger.info("PARAMS: #{params.inspect}")
    # PARAMS: {"employers"=>{"0"=>{"e_id"=>"2"}, "1"=>{"e_id"=>"3"}, "2"=>{"e_id"=>"1"}, "3"=>{"e_id"=>"4"}, "4"=>{"e_id"=>"8"}}, "controller"=>"employers", "action"=>"sort"}

    params[:employers].each do |index, employer_hash|
      e = Employer.find_by_id(employer_hash[:e_id])
      e.position = index.to_i + 1
      e.save
    end

    employers = Employer.order('position ASC') #re-order
    render json: employers.to_json

  end
end
