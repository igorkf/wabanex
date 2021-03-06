defmodule WabanexWeb.Schema.Types.User do
  use Absinthe.Schema.Notation

  @desc "Logic user representation"
  object :user do
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :email, non_null(:string)
    field :trainings, list_of(:trainings)
  end

  input_object :create_user_input do
    field :name, non_null(:string), description: "User's name"
    field :email, non_null(:string), description: "User's email"
    field :password, non_null(:string), description: "User's password"
  end
end
