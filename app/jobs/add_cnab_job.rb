class AddCnabJob < ApplicationJob # >
  queue_as :default

  def perform(file, user)
    CreateCnabService.new(file, user).call
  end
end
