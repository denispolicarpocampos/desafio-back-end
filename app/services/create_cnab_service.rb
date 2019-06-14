class CreateCnabService

  def initialize(file, user)
    @file = file
    @user = user
  end

  def call
    create_tmp_file
  rescue StandardError => e
    raise ActiveRecord::Rollback
  end

  private

  def create_tmp_file
    ActiveRecord::Base.transaction do
      @file.each_line do |line|
        return raise StandardError unless line.size == 81

        create_cnba(line)
      end
    end
  end

  def create_cnba(line)
    TransactionValue.create!(kind_transaction_id: line.strip[0].to_i,
                            date_occurrency: DateTime.parse(line.strip[1..8] + line.strip[42..47] + "-0300"),
                            value: line.strip[9..18].to_i / 100,
                            cpf: line.strip[19..29],
                            card: line.strip[30..41],
                            owner: line.strip[48..61],
                            name: line.strip[62..80],
                            user_id: @user)
  end
end