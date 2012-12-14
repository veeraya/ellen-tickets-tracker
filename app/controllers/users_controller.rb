class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def login
    @user = User.where(:email => params[:email]).first
    unless @user
      @user = User.create(:email => params[:email], :track_all => false)
    end

    if @user.track_all
      @track_all = true
    elsif @user.trackings.count > 0
      @track_some = true
      @trackings = @user.trackings
    else
      @track_none = true
    end

    @track_all ||= false
    @track_some ||= false
    @track_none ||= false
  end

  def update_tracking
    @user = User.find(params[:user_id])
    if @user
      case params[:tracking]
        when "trackAll"
          @user.track_all = true
          @user.trackings.destroy_all
        when "trackSome"
          @user.track_all = false
          @user.trackings.destroy_all
          
          error_fields = []
          i = 0
          fieldname = "datetracked_0"
          while params[fieldname]
            date = Date.strptime(params[fieldname], '%m/%d/%Y') rescue nil
            if date
              t = Tracking.where(:date => date).first
              unless t
                t = Tracking.create(:date => date)
              end
              @user.trackings.push(t)
            else
              error_fields.push(fieldname)
            end

            i += 1
            fieldname = "datetracked_#{i}"
          end

          if error_fields.count > 0
            @error_msg = "Error parsing the following date(s): "
            error_fields.each do |f|
              @error_msg << " #{params[f]} "
            end
            @error_msg << ". Accepted date format is mm/dd/yyyy."

          end
        when "trackNone"
            @user.track_all = false
            @user.trackings.destroy_all
        else
      end
    else
      @error_msg = "You're not registered in the database. Please try logging in again."
    end

    binding.pry
  end
end
