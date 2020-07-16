defmodule YGO.CardSets do
  @moduledoc """
  Contains HTTP requests for all card sets.
  """

  alias YGO.HTTPClient

  @endpoint_url "https://db.ygoprodeck.com/api/v7/cardsets.php"

  @doc """
  Requests all card sets.
  """
  @spec get_card_sets :: {:error, String.t()} | {:ok, [map()]}
  def get_card_sets, do: HTTPClient.make_request(@endpoint_url)
end
