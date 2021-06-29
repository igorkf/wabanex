defmodule WabanexWeb.Schema.Types.Training do
  use Absinthe.Schema.Notation

  import_types Wabanex.Schema.Types.Exercise

  @desc "Logic training representation"
  object :exercise do
    field :id, non_null(:uuid4)
    field :start_date, non_null(:date)
    field :end_date, non_null(:date)
    field :exercises, list_of(:exercise)
  end

  input_object :create_training_input do
    field :user_id, non_null(:string), description: "Users's name"
    field :start_date, non_null(:date), description: "When training begins"
    field :end_date, non_null(:date), description: "When training ends"
    field :exercises, list_of(:exercise), description: "List of exercises"
  end
end
