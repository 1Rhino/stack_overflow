class AnswersController < ApplicationController
  before_action :authenticate_user!, only: [:new_answer]

  def new_answer
    answer = Answer.new(answer_params)
    answer.user = current_user
    if answer.valid?
      answer.save
      return render json: true
    else
      return render json: false
    end
  end


  private

  def answer_params
    params.require(:answer).permit(:question_id, :content)
  end
end
