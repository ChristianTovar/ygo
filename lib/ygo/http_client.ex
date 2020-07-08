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
      |> check_empty_map()

    [params: values]
  end

  def request_data(params) do
    case get!(@endpoint_url, [], params: params) do
      %HTTPoison.Response{status_code: 200, body: body} ->
        {:ok, body}

      %HTTPoison.Response{status_code: 400} ->
        {:error,
         "No card matching your query was found in the database. Please see https://github.com/ChristianTovar/ygo for syntax usage."}
    end
  end

  defp check_empty_map(map) when map_size(map) > 0, do: map
  defp check_empty_map(_map), do: %{error: "this is an error in process"}
end
