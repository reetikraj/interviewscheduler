class InterviewsController < ApplicationController
    before_action :set_interview, only: [:show, :edit, :update, :destroy]

    def index
        @interviews = Interview.all
    end

    def show
    end

    def new
        @interview = Interview.new
        @interview.interviews_users.build(role: 0).build_user
        @interview.interviews_users.build(role: 1).build_user
    end

    def edit
    end

    def create    
        @interview = Interview.new(
            :interview_date => interview_params[:interview_date], 
            :start_time => interview_params[:start_time], 
            :end_time => interview_params[:end_time]
            )

        interviewer_params = interview_params[:interviews_users_attributes]["0"][:users]
        candidate_params = interview_params[:interviews_users_attributes]["1"][:users]

        @interviewer = User.where(:email => interviewer_params[:email])
        @candidate = User.where(:email => candidate_params[:email])

        unless @interviewer.empty?
            @interview.users << @interviewer.first
        else
            @interview.users << User.new(interviewer_params)
        end
        @interview.interviews_users.last.role = 0

        unless @candidate.empty?
            @interview.users << @candidate.first
        else
            @interview.users << User.new(candidate_params)
        end
        @interview.interviews_users.last.role = 1

        respond_to do |format|
          if @interview.save
            format.html { redirect_to interviews_path, notice: 'Interview schedule was successfully created.'}
            format.json { render :show, status: :created, location: @interview }
          else
            format.html { render :new }
            format.json { render json: @interview.errors, status: :unprocessable_entity }
          end
        end
    end

    def update
        interviewer_params = interview_params[:interviews_users_attributes]["0"][:users]
        candidate_params = interview_params[:interviews_users_attributes]["1"][:users]

        @interviewer = User.where(:email => interviewer_params[:email])
        @candidate = User.where(:email => candidate_params[:email])

        unless @interviewer.empty?
            if @interviewer.update(interviewer_params)
                @interview.users << @interviewer
            else
                @interview.errors.add(:users, "invalid")
            end
        else
            @interview.users << User.new(interviewer_params)
        end

        unless @candidate.empty?
            if @candidate.update(candidate_params)
                @interview.users << @candidate
            else
                @interview.error.add(:users, "invalid")
            end
        else
            @interview.users << User.new(candidate_params)
        end

        respond_to do |format|
          if @interview.update(
            :interview_date => interview_params[:interview_date], 
            :start_time => interview_params[:start_time], 
            :end_time => interview_params[:end_time]
            )

            @iold = @interview.interviews_users.where(:role => 0).first
            @iold.destroy
            @inew = @interview.interviews_users.where(:role => nil).first
            @inew.update(:role => 0)

            @cold = @interview.interviews_users.where(:role => 1).first
            @cold.destroy
            @cnew = @interview.interviews_users.where(:role => nil).first
            @cnew.update(:role => 1)
            
            format.html { redirect_to @interview, notice: 'Interview schedule was successfully updated.' }
            format.json { render :show, status: :ok, location: @interview }
          else
            format.html { render :edit }
            format.json { render json: @interview.errors, status: :unprocessable_entity }
          end
        end
    end

    def destroy
        @interview.destroy
        respond_to do |format|
          format.html { redirect_to interviews_url, notice: 'Interview schedule was successfully destroyed.' }
          format.json { head :no_content }
        end
    end

  private
    def set_interview
        @interview = Interview.find(params[:id])
    end

    def interview_params
        params.require(:interview).permit(
            {interviews_users_attributes: [users: [:name, :email, :resume]]}, 
            :interview_date, 
            :start_time, 
            :end_time
            )
    end
end


   