class FileUploadsController < ApplicationController

  def new
    @file = FileUpload.new
  end

  def create
    file = FileUpload.new(file_params)
    if file.valid?
      file_string = File.read(file_params[:file].path)
      #CreateCnabService.new(file_string, file_params[:user][:id]).call
      AddCnabJob.perform_later(file_string, file_params[:user][:id])
      redirect_to new_file_upload_path, notice: "Transação foi arquivada no sistema!"
    else
      redirect_to new_file_upload_path, notice: file.errors
    end
  end

  private

  def file_params
    params.require(:file_upload).permit(:file).merge(user: current_user)
  end
end