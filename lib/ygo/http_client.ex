defmodule YGO.HTTPClient do
  @moduledoc """
  Contains HTTP requests for the API.
  """

  use HTTPoison.Base

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
    :staple,
    :language,
    :setcode
  ]

  @doc """
  Removes unnecesary options from request parameters. This
  function is called whenever a request is made.
  """
  def process_request_options([]), do: []

  def process_request_options(params: fields) do
    values =
      fields
      |> Map.take(@expected_fields)
      |> check_empty_map()

    [params: values]
  end

  @doc """
  Requests the input endpoint.
  """
  @spec make_request(String.t()) :: {:error, String.t()} | {:ok, [map]}
  def make_request(endpoint, params \\ %{}) do
    endpoint
    |> get_data(params)
    |> handle_response()
  end

  @spec get_data(String.t(), map) :: HTTPoison.Response.t() | HTTPoison.AsyncResponse.t()
  defp get_data(endpoint, params) when map_size(params) > 0,
    do: get!(endpoint, [], params: params)

  defp get_data(endpoint, _), do: get!(endpoint)

  @spec handle_response(HTTPoison.Response.t()) :: {:error, String.t()} | {:ok, [map]}
  defp handle_response(%HTTPoison.Response{status_code: 200, body: body}), do: set_response(body)

  defp handle_response(%HTTPoison.Response{status_code: 400, body: body}),
    do: {:error, Jason.decode!(body)["error"]}

  @spec set_response(String.t()) :: {:ok, [map]}
  defp set_response(body) do
    case Jason.decode!(body) do
      %{"data" => data} -> {:ok, data}
      body -> {:ok, body}
    end
  end

  @spec check_empty_map(map) :: map
  defp check_empty_map(map) when map_size(map) > 0, do: map
  defp check_empty_map(_map), do: %{error: "this is an error in process"}
end
