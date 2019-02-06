class CommentsController < ApplicationController
  def create
    @hostel_registration = current_user.hostel_registrations.find_by(hostel_id: params[:hostel_id])
    Comment.create(hostel_registration: @hostel_registration, message: params[:message])
    redirect_to hostel_path(@hostel_registration.hostel), notice: 'Comentario registrado correctamente.'
  end
end
