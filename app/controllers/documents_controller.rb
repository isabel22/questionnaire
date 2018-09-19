class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.all
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
    @questions = Question.where(document_id: @document.id)
  end

  # GET /documents/new
  def new
    @document = Document.new
  end

  # GET /documents/1/edit
  def edit
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(document_params)

    respond_to do |format|
      if @document.save
        format.html { redirect_to @document, notice: 'Document was successfully created.' }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to @document, notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def answer
    @document = Document.find(params[:document_id])
    @questions = Question.where(document_id: @document.id)
  end

  def create_answer
    @document = Document.find(params[:document_id])
    @questions = Question.where(document_id: @document.id)
    params[:answer].each do |question_id, answer|
      question = Question.find(question_id)
      Answer.create(question_id: question.id, body: answer, user_id: current_user.id)
    end
    current_user.push(completed_document_ids: @document.id.to_s)
    redirect_to document_show_answer_path(@document)
  end

  def show_answer
    @user_id = params[:user_id].present? ? params[:user_id] : current_user.id
    @document = Document.find(params[:document_id])
    @questions = Question.where(document_id: @document.id)
  end

  def show_answers
    @document = Document.find(params[:document_id])
    user_ids = User.have_answered_for_document(@document)
    @users = User.in(id: user_ids)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:title)
    end
end
