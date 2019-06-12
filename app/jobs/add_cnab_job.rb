class AddCnabJob < ApplicationJob # >
  queue_as :parse

  def perform(file, user)
    CreateCnabService.new(file, user).call
  end
end
