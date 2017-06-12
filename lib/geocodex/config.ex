defmodule Geocodex.Config do
  @moduledoc """
  Allows to modify and retrieve your Geocodex configuration
  """

  @doc """
  Modifies your API Key value

      iex> Geocoder.Config.api_key("YOUR API KEY")
      :ok
  """
  def api_key(api_key) do
    Application.put_env(:geocodex, :api_key, api_key)
  end

  @doc """
  Returns your API Key configuration value

      iex> Geocoder.Config.api_key("YOUR API KEY")
      :ok
      iex> Geocoder.Config.api_key
      "YOUR API KEY"
  """
  def api_key do
    get_env(:api_key)
  end

  @doc """
  Returns the API Url configuration value

      iex> Geocoder.Config.geocode_api_url
      "https://maps.googleapis.com/maps/api/geocode"
  """
  def geocode_api_url do
    get_env(:geocode_api_url)
  end

  defp get_env(key) do
    case Application.fetch_env(:geocodex, key) do
      {:ok, value} -> value
      _ -> nil
    end
  end
end
