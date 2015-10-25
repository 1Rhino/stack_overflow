class LikesController < ApplicationController
  before_action :check_authenticate, only: [:like_question, :dislike_question, :like_answer, :dislike_answer]

  def like_question
    like = Like.where(user_id: current_user.id, question_id: params[:id])
    if like.present?
      return render json: {message: 'You already voted this question!'}
    end

    like = Like.new
    like.user = current_user
    like.question_id   = params[:id]
    if like.save
      return render json: {message: 'Thanks for your vote!', reload: true}
    else
      return render json: {message:'Vote failed'}
    end
  end

  def dislike_question
    like = Like.where(user_id: current_user.id, question_id: params[:id])
    if like.present?
      like.destroy_all
      return render json: {message:'You disliked it', reload: true}
    else
      return render json: {message:'Dislike failed'}
    end
  end

  def like_answer
    like = Like.where(user_id: current_user.id, answer_id: params[:id])
    if like.present?
      return render json: {message: 'You already voted this answer!'}
    end

    like = Like.new
    like.user = current_user
    like.answer_id   = params[:id]
    if like.save
      return render json: {message: 'Thanks for your vote!', reload: true}
    else
      return render json: {message:'Vote failed'}
    end
  end

  def dislike_answer
    like = Like.where(user_id: current_user.id, answer_id: params[:id])
    if like.present?
      like.destroy_all
      return render json: {message:'You disliked it', reload: true}
    else
      return render json: {message:'Dislike failed'}
    end
  end

  private
  def check_authenticate
    if current_user.blank?
      return render json: {message:'You need to login first'}
    end
  end
end