class InterviewsController < ApplicationController
  before_action :set_interview, only: [:show, :edit, :update, :destroy]

  def index
  	@interviews = Interview.all
  end

  def show
  end

  def new
  	@interview = Interview.new
  end

  def edit
  end

  def create
  	@interview = Interview.new(
        :interview_date => interview_params[:interview_date],
        :start_time => interview_params[:start_time],
        :end_time => interview_params[:end_time]
  		)
  	@interviewer = User.where(:email => interview_params[:interviewer_email])
  	@candidate = User.where(:email => interview_params[:candidate_email])

  	unless @interviewer.empty?
  		@interview.users << @interviewer.first
  	else
  		@interview.users << User.new(
            :name => interview_params[:interviewer_name],
            :email => interview_params[:interviewer_email],
            :role => 0
  			)
  		
  	end
  end

end
