defmodule YGO.HttpClient do
  @moduledoc """
  Contains HTTP requests dealing functions.
  """

  use HTTPoison.Base

  @endpoint_url "https://db.ygoprodeck.com/api/v7/cardinfo.php"
  @expected_fields [
    :name,
    :fname,
    :type,
    :atk,
    :def,
    :level,
    :race,
    :attribute,
    :link,
    :linkmarker,
    :scale,
    :set,
    :archetype,
    :banlist,
    :sort,
    :la
  ]

  def process_request_options(params: fields) do
    values =
      fields
      |> Enum.filter(fn {key, _value} -> key in @expected_fields end)
      |> Enum.into(%{})

    [params: values]
  end

  def request_data(params) do
    get!(@endpoint_url, [], params: params)
  end
end
