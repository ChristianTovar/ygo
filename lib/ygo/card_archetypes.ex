defmodule YGO.CardArchetypes do
  @moduledoc """
  Contains HTTP requests for all card archetypes.
  """

  alias YGO.HTTPClient

  @endpoint_url "https://db.ygoprodeck.com/api/v7/archetypes.php"

  @doc """
  Requests all card archetypes.
  """
  @spec get_card_archetypes :: {:error, String.t()} | {:ok, [map()]}
  def get_card_archetypes, do: HTTPClient.make_request(@endpoint_url)
end
