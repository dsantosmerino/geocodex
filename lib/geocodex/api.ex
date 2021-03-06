defmodule Geocodex.Api do
  @moduledoc """
  Provides Google Maps Geocoding API interfaces
  """

  alias Geocodex.{Config, Response}

  @doc """
  Calls the API using address
  """
  def get_by_address(address) do
    request(%{address: address})
  end
  
  @doc """
  Calls the API using latlong
  """
  def get_by_coordinates(latitude, longitude) do
    request(%{latlng: "#{latitude},#{longitude}"})
  end

  @doc """
  Calls the API using place_id
  """
  def get_by_place_id(place_id) do
    request(%{place_id: place_id})
  end

  defp request(params) do
    params
    |> build_qs_params
    |> build_url
    |> HTTPoison.get
    |> Response.handle()
  end

  defp build_url(qs_params) do
    "#{Config.geocode_api_url}/json?#{qs_params}"
  end

  defp build_qs_params(specific_params) do
    specific_params
    |> Map.merge(%{key: Config.api_key})
    |> URI.encode_query()
  end
end
