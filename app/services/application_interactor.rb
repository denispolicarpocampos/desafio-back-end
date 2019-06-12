class ApplicationInteractor
  attr_reader :error, :result, :status

  def success?
    @error.nil?
  end

  private

  def fail!(error, status = nil)
    @error = error
    @status = status
  end

  def answer(result)
    @result = result
  end
end