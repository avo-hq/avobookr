class BookingResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = ->(params:) do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  field :room, as: :belongs_to
  field :user, as: :belongs_to, default: -> { Avo::App.context[:current_user].id }, readonly: true
  field :booked_at, as: :date_time
  field :booked_for, as: :select, options: {
    '2 hours': 2,
    '4 hours': 4,
    '6 hours': 6,
    '8 hours': 8,
  }
  # add fields here

  filter FutureBookings

  action DelayBooking
end
