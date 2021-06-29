defmodule WabanexWeb.Schema.Types.Root do
  use Absinthe.Schema.Notation

  alias WabanexWeb.Schema.Types
  alias WabanexWeb.Resolvers
  alias Crudry.Middlewares.TranslateErrors

  import_types Types.Custom.UUID4
  import_types Types.User
  import_types Types.Training

  object :root_query do
    field :get_user, type: :user do
      arg :id, non_null(:uuid4)

      resolve fn id, context -> Resolvers.User.get(id, context) end
    end
  end

  object :root_mutation do
    field :create_user, type: :user do
      arg :input, non_null(:create_user_input)

      resolve fn params, context -> Resolvers.User.create(params, context) end
      middleware TranslateErrors
    end

    field :create_training, type: :training do
      arg :input, non_null(:create_training_input)

      resolve fn params, context -> Resolvers.Training.create(params, context) end
      middleware TranslateErrors
    end
  end
end
