class DelayBooking < Avo::BaseAction
  self.name = 'Delay booking'

  def handle(**args)
    models, fields, current_user, resource = args.values_at(:models, :fields, :current_user, :resource)

    number_of_hours = fields['number_of_hours'] || 2

    models.each do |model|
      model.booked_at = model.booked_at + number_of_hours.to_i.hours
      model.save
      # Do something with your models.
    end
  end

  field :number_of_hours, as: :number, default: 1, help: "Set the number of hours to delay by"
end
