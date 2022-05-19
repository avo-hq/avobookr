class BookingsOverTime < Avo::Dashboards::ChartkickCard
  self.id = "bookings_over_time"
  self.label = "Bookings over time"
  self.chart_type = :area_chart
  # self.description = "Some tiny description"
  self.cols = 3
  # self.initial_range = 30
  # self.ranges = [7, 30, 60, 365, "TODAY", "MTD", "QTD", "YTD", "ALL"]
  # self.chart_options = { library: { plugins: { legend: { display: true } } } }
  # self.flush = true

  def query
    points = 16
    i = Time.new.year.to_i - points
    base_data = Array.new(points).map do
      i += 1
      [i.to_s, rand(0..20)]
    end.to_h

    result [
      { name: "batch 1", data: base_data.map { |k, v| [k, rand(0..20)] }.to_h },
      { name: "batch 2", data: base_data.map { |k, v| [k, rand(0..40)] }.to_h },
      { name: "batch 3", data: base_data.map { |k, v| [k, rand(0..10)] }.to_h }
    ]
  end
end
