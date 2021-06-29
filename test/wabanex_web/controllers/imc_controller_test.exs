defmodule WabanexWeb.IMCControllerTest do
  use WabanexWeb.ConnCase, async: true

  describe "index/2" do
    test "when all params are valid, returns the IMC info", %{conn: conn} do
      params = %{"filename" => "students.csv"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:ok)

      expected = %{
        "result" => %{
          "dani" => 23.437499999999996,
          "diego" => 23.04002019946976,
          "gabul" => 22.857142857142858,
          "igor" => 25.53544639152223,
          "rodrigo" => 26.234567901234566
        }
      }

      assert response == expected
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = %{"filename" => "banana.csv"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:bad_request)

      expected = %{"result" => "Error while opening the file"}

      assert response == expected
    end
  end
end
