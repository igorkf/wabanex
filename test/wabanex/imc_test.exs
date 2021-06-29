defmodule Wabanex.IMCTest do
  use ExUnit.Case, async: true
  alias Wabanex.IMC

  describe "calculate/1" do
    test "when the file exists, returns the data" do
      params = %{"filename" => "students.csv"}

      response = IMC.calculate(params)

      exptected =
        {:ok,
         %{
           "dani" => 23.437499999999996,
           "diego" => 23.04002019946976,
           "gabul" => 22.857142857142858,
           "igor" => 25.53544639152223,
           "rodrigo" => 26.234567901234566
         }}

      assert response == exptected
    end

    test "when the wrong filename is given, returns an error" do
      params = %{"filename" => "banana.csv"}

      response = IMC.calculate(params)

      exptected = {:error, "Error while opening the file"}

      assert response == exptected
    end
  end
end
