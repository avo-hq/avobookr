class LocationResource < Avo::BaseResource
  self.title = :name
  self.includes = []
  self.default_view_type = :grid
  self.search_query = ->(params:) do
    scope.ransack(id_eq: params[:q], name_cont: params[:q], description_cont: params[:q], m: "or").result(distinct: false)
  end

  field :id, as: :id
  field :name, as: :text
  field :description, as: :textarea, as_description: true
  field :photo, as: :file, is_image: true, as_avatar: true
  field :rooms, as: :has_many

  grid do
    cover :photo, as: :file, is_image: true, link_to_resource: true
    title :name, as: :text, link_to_resource: true
    body :description, as: :text do |model|
      model.description.truncate 50
    end
  end
  # add fields here
end
