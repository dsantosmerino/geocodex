defmodule Geocodex.Response do
  @moduledoc false

  def handle({:ok, %{status_code: 200} = response}) do
    response |> parse_body
  end
  
  def handle({:error, response}) do
    {:error, response}
  end

  def parse(data) do
    results = data["results"]
    %{ 
      city: find(results, "locality"),
      neighborhood: find(results, "neighborhood"),
      district: find(results, "sublocality"),
      state: find(results, "administrative_area_level_1"),
      country: find(results, "country"),
     }
  end

  defp find(results, type) do
    results |> find_by_type(type) |> find_name_by_type(type)
  end

  defp find_by_type(results, type) do
    results 
    |> Enum.find(fn(x) -> x["types"] |> Enum.member?(type) end)
  end

  
  defp find_name_by_type(result, type) when is_map(result) do
    case Map.fetch(result, "address_components") do
      {:ok, value} -> value |> Enum.find(fn(x) -> x["types"] |> Enum.member?(type) end) |> (&(&1["long_name"])).()
      _ -> nil
    end
  end

  defp find_name_by_type(_, _), do: nil

  defp parse_body(response) do
    Poison.decode!(response.body)
  end
end
