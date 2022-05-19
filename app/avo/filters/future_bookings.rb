class FutureBookings < Avo::Filters::BooleanFilter
  self.name = "Future bookings"

  def apply(request, query, values)
    if values['future'].present?
      return query.where('booked_at > ?', Time.now)
    end
    query
  end

  def options
    {
      future: 'Only future bookings'
    }
  end
end
