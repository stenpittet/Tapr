class AnswersController < ApplicationController
  #Create a vote for this answer
  def vote
    @answer = Answer.find(params[:id])
    @question = @answer.question
    vote = Vote.new({:answer_id => @answer.id, :question_id => @question.id})
    if vote.save
      @answer.increment(:votes_count)
      @question.increment(:votes_count)
      @answer.save
      @question.save
    end
    redirect_to (results_question_path(@question))
  end
  
  # GET /answers
  # GET /answers.xml
  def index
    @answers = Answer.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @answers }
    end
  end

  # GET /answers/1
  # GET /answers/1.xml
  def show
    @answer = Answer.find(params[:id])
    @question = Question.find(params[:question_id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @answer }
    end
  end

  # GET /answers/new
  # GET /answers/new.xml
  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @answer }
    end
  end

  # GET /answers/1/edit
  def edit
    @answer = Answer.find(params[:id])
    @question = Question.find(params[:question_id])
  end

  # POST /answers
  # POST /answers.xml
  def create
    @answer = Answer.new(params[:answer])
    @question = Question.find(@answer.question_id)
    respond_to do |format|
      if @answer.save
        format.html { redirect_to(edit_question_path(@question), :notice => 'Answer was successfully created.') }
        format.xml  { render :xml => @answer, :status => :created, :location => @answer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @answer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /answers/1
  # PUT /answers/1.xml
  def update
    @answer = Answer.find(params[:id])
    @question = @answer.question
    respond_to do |format|
      if @answer.update_attributes(params[:answer])
        format.html { redirect_to(edit_question_path(@question), :notice => 'Answer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @answer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.xml
  def destroy
    @answer = Answer.find(params[:id])
    @question = @answer.question
    @answer.destroy

    respond_to do |format|
      format.html { redirect_to(@question) }
      format.xml  { head :ok }
    end
  end
end
