defmodule YGO.HttpClient do
  @moduledoc """
  Contains HTTP requests dealing functions.
  """

  use HTTPoison.Base

  @endpoint_url "https://db.ygoprodeck.com/api/v7/cardinfo.php"
  @expected_fields [
    :name,
    :fname,
    :id,
    :type,
    :atk,
    :def,
    :level,
    :race,
    :attribute,
    :link,
    :linkmarker,
    :scale,
    :cardset,
    :archetype,
    :banlist,
    :sort,
    :format,
    :misc,
    :staple
  ]

  @doc """
  Removes unnecesary options from request parameters. This
  function is called whenever a request is made.
  """
  @spec process_request_options(keyword()) :: [params: map()]
  def process_request_options(params: fields) do
    values =
      fields
      |> Map.take(@expected_fields)
      |> check_empty_map()

    [params: values]
  end

  @doc """
  Requests card information to the Yu-Gi-Oh! api.
  """
  @spec request_data(map()) :: {:error, String.t()} | {:ok, [map()]}
  def request_data(params) do
    case get!(@endpoint_url, [], params: params) do
      %HTTPoison.Response{status_code: 200, body: body} ->
        {:ok, decode_data(body)}

      %HTTPoison.Response{status_code: 400} ->
        {:error, "No card matching your query was found in the database.
         Please see https://github.com/ChristianTovar/ygo for syntax usage."}
    end
  end

  @spec check_empty_map(map()) :: map()
  defp check_empty_map(map) when map_size(map) > 0, do: map
  defp check_empty_map(_map), do: %{error: "this is an error in process"}

  @spec decode_data(String.t()) :: [map()]
  defp decode_data(body) do
    body
    |> Jason.decode!()
    |> Map.get("data")
  end
end
