defmodule YGO.HTTPClient do
  @moduledoc """
  Contains HTTP requests for the API.
  """

  use HTTPoison.Base

  @doc """
  Requests the input endpoint.
  """
  @spec make_request(String.t()) :: {:error, String.t()} | {:ok, [map()]}
  def make_request(endpoint, params \\ %{}) do
    endpoint
    |> get_data(params)
    |> handle_response()
  end

  defp get_data(endpoint, params) when map_size(params) > 0,
    do: get!(endpoint, [], params: params)

  defp get_data(endpoint, _), do: get!(endpoint)

  defp handle_response(%HTTPoison.Response{status_code: 200, body: body}), do: Jason.decode(body)

  defp handle_response(%HTTPoison.Response{status_code: 400, body: body}),
    do: {:error, Jason.decode!(body)["error"]}
end
