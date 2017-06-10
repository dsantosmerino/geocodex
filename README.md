# Geocodex
[![Build Status](https://travis-ci.org/dsantosmerino/geocodex.svg?branch=master)](https://travis-ci.org/dsantosmerino/geocodex)
[![Hex Version](https://img.shields.io/hexpm/v/geocodex.svg)](https://hex.pm/packages/geocodex)

A Google Geocoding API wrapper written in Elixir

## Installation

  1. Add `geocodex` to your list of dependencies in `mix.exs`:

  ```elixir
  def deps do
    [{:geocodex, "~> 0.1.0"}]
  end
  ```

  2. Ensure `httpoison` is started before your application:

  ```elixir
  def application do
    [applications: [:httpoison]]
  end
  ```

## Usage

```elixir
iex> Geocodex.set_api_key("YOUR API KEY")
:ok
iex> Geocodex.place_id("ChIJrTLr-GyuEmsRBfy61i59si0")
%{"results" => [%{"address_components" => [%{"long_name" => "Sydney",
        "short_name" => "Sydney",
        "types" => ["locality", "political"]},
      %{"long_name" => "New South Wales", "short_name" => "NSW",
        "types" => ["administrative_area_level_1", "political"]},
      %{"long_name" => "Australia", "short_name" => "AU",
        "types" => ["country", "political"]},
      %{"long_name" => "2000", "short_name" => "2000",
        "types" => ["postal_code"]}],
    "formatted_address" => "32 The Promenade, King Street Wharf 5, Sydney NSW 2000, Australia",
    "geometry" => %{"location" => %{"lat" => -33.867591,
        "lng" => 151.201196}, "location_type" => "APPROXIMATE",
      "viewport" => %{"northeast" => %{"lat" => -33.86624201970849,
          "lng" => 151.2025449802915},
        "southwest" => %{"lat" => -33.86893998029149,
          "lng" => 151.1998470197085}}},
    "place_id" => "ChIJrTLr-GyuEmsRBfy61i59si0",
    "types" => ["establishment", "food", "point_of_interest",
      "restaurant", "travel_agency"]}], "status" => "OK"}
```

Documentation can be found on [HexDocs](https://hexdocs.pm/geocodex).

## Running locally

Clone the repository
```bash
git clone git@github.com:dsantosmerino/geocodex.git
```

Install dependencies
```bash
cd geocodex
mix deps.get
```

To run the tests
```bash
mix test
```

To run the lint
```elixir
mix credo
```

