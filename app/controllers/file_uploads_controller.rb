class FileUploadsController < ApplicationController

  def new
    @file = FileUpload.new
  end

  def create
    file = FileUpload.new(file_params)
    if file.valid?
      #CreateCnabService.new(file_params[:file].tempfile.path, file_params[:user][:id]).call
      AddCnabJob.perform_later(file_params[:file].tempfile.path, file_params[:user][:id])
    else

    end

  end

  private

  def file_params
    params.require(:file_upload).permit(:file).merge(user: current_user)
  end
end