class QuestionsController < ApplicationController
  def index
    @question = Question.all
  end
 
  def new
    @question = Question.new
    #@question_category = QuestionCategory.new
    #@question.question_categories.build
    #@category = Category.new
  end

  def create
    @question = current_user.questions.new(question_params)
    
    if @question.save
      redirect_to questions_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = '投稿に失敗しました'
      render :new
    end
  end
  
  def show
    @question = Question.find(params[:id])
    #@answer = Answer.new
  end
  
  private 
  def question_params
    params.require(:question).permit(:question, :category_id, :category)
  end
end
