class BookedHours < Avo::Dashboards::MetricCard
  self.id = "booked_hours"
  self.label = "Booked hours"
  # self.description = "Some description"
  # self.cols = 1
  self.initial_range = 'Sky Tower'
  self.ranges = ["Sky Tower", "City Gate", "Timpuri Noi Square"]
  # self.prefix = ""
  # self.suffix = ""

  def query
    # from = Date.today.midnight - 1.week
    # to = DateTime.current

    # if range.present?
    #   if range.to_s == range.to_i.to_s
    #     from = DateTime.current - range.to_i.days
    #   else
    #     case range
    #     when "TODAY"
    #       from = DateTime.current.beginning_of_day
    #     when "MTD"
    #       from = DateTime.current.beginning_of_month
    #     when "QTD"
    #       from = DateTime.current.beginning_of_quarter
    #     when "YTD"
    #       from = DateTime.current.beginning_of_year
    #     when "ALL"
    #       from = Time.at(0)
    #     end
    #   end
    # end

    # result User.where(created_at: from..to).count

    location = Location.where(name: range).first
    room_ids = location.rooms.pluck(:id)

    result Booking.where(room_id: room_ids).pluck(:booked_for).sum
  end
end
