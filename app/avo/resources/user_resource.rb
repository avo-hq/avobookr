class UserResource < Avo::BaseResource
  self.title = :name
  self.includes = []
  # self.search_query = ->(params:) do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  field :email, as: :gravatar
  field :name, as: :text
  field :email, as: :text
  # add fields here
end
