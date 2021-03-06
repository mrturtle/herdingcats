class StudentsController < ApplicationController
  # GET /students
  # GET /students.json
  def index
    @students = Student.includes(:primary_household)
    @students_by_grade = @students.group_by{|stu| stu.school_class_id}

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @students }
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @student = Student.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @student }
    end
  end

  # GET /students/new
  # GET /students/new.json
  def new
    @student = Student.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @student }
    end
  end

  # GET /students/1/edit
  def edit
    @student = Student.find(params[:id])
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(params[:student])

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, :notice => 'Student was successfully created.' }
        format.json { render :json => @student, :status => :created, :location => @student }
      else
        format.html { render :action => "new" }
        format.json { render :json => @student.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /students/1
  # PUT /students/1.json
  def update
    @student = Student.find(params[:id])

    respond_to do |format|
      if @student.update_attributes(params[:student])
        format.html { redirect_to @student, :notice => 'Student was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @student.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :no_content }
    end
  end
  
  def send_verification_email
    # get the student
    @student = Student.find(params[:id])
    # send an email to the primary household
    HouseholdMailer.verify_information(@student.primary_household).deliver if @student.primary_household
    # send an email to the secondary household
    HouseholdMailer.verify_information(@student.secondary_household).deliver if @student.secondary_household

    respond_to do |format|
      format.html { redirect_to students_url, notice: "Verification email sent to #{@student.fullname}'s household(s)" }
    end
    
  end
end
