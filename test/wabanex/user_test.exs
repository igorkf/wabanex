defmodule Wabanex.UserTest do
  use Wabanex.DataCase, async: true
  alias Wabanex.User

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{name: "Igor", email: "igor@test.com", password: "123456"}

      response = User.changeset(params)

      # test with pattern matching
      assert %Ecto.Changeset{
               valid?: true,
               changes: %{email: "igor@test.com", name: "Igor", password: "123456"},
               errors: []
             } = response
    end

    test "when there are invalid params, returns a invalid changeset" do
      params = %{name: "A", email: "igor@test.com"}

      response = User.changeset(params)

      expected = %{name: ["should be at least 2 character(s)"], password: ["can't be blank"]}

      assert errors_on(response) == expected
    end
  end
end
