defmodule WabanexWeb.SchemaTest do
  use WabanexWeb.ConnCase, async: true
  alias Wabanex.User
  alias Wabanex.Users.Create

  describe "users queries" do
    test "when a valid id is given, returns the user", %{conn: conn} do
      params = %{name: "Igor", email: "igor@test.com", password: "123456"}

      {:ok, %User{id: user_id}} = Create.call(params)

      query = """
      {
        getUser(id: "#{user_id}"){
          name
          email
        }
      }
      """

      response =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(:ok)

      expected = %{
        "data" => %{
          "getUser" => %{
            "email" => "igor@test.com",
            "name" => "Igor"
          }
        }
      }

      assert response == expected
    end
  end

  describe "users mutations" do
    test "when all params are valid, creates the user", %{conn: conn} do
      mutation = """
      mutation {
        createUser(input: {name: "Jones", email: "jones@test.com", password: "123456"}) {
          id
          name
        }
      }
      """

      response =
        conn
        |> post("/api/graphql", %{query: mutation})
        |> json_response(:ok)

      assert %{
               "data" => %{
                 "createUser" => %{
                   "id" => _id,
                   "name" => "Jones"
                 }
               }
             } = response
    end
  end
end
