class ApplyFines
  prepend SimpleCommand

  def initialize
    @landings = Landing.all
  end

  def call
    @landings.each do |landing|
      if landing.return_date < Date.today && landing.status = "pending"
        value = (Date.today - landing.return_date).to_i * 10

        landing.update(status: "delayed")
        Fine.create(landing:, value:, user_id: landing.user_id, status: "pending")
      end
    end
  end
end
