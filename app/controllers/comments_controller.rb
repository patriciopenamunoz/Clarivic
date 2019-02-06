class CommentsController < ApplicationController
  def create
    @hostel_registration = current_user.hostel_registrations.find_by(hostel_id: params[:hostel_id])
    if Comment.create(hostel_registration: @hostel_registration, message: params[:message])
      redirect_to hostel_path(@hostel_registration.hostel), notice: 'Comentario registrado correctamente.'
    else
      redirect_to hostel_path(@hostel_registration.hostel), alert: 'Comentario no se registró.'
    end
  end
end
