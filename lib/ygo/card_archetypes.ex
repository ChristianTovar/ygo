defmodule YGO.CardArchetypes do
  @moduledoc """
  Contains HTTP requests for all card archetypes.
  """

  use HTTPoison.Base

  @endpoint_url "https://db.ygoprodeck.com/api/v7/archetypes.php"

  @doc """
  Requests all card archetypes.
  """
  @spec get_card_archetypes :: {:error, String.t()} | {:ok, [map()]}
  def get_card_archetypes do
    case get!(@endpoint_url) do
      %HTTPoison.Response{status_code: 200, body: body} ->
        Jason.decode(body)

      %HTTPoison.Response{status_code: 400} ->
        {:error, "API error"}
    end
  end
end
