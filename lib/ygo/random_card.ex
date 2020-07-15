defmodule YGO.RandomCard do
  @moduledoc """
  Contains HTTP requests for random card.
  """

  alias YGO.HTTPClient

  @endpoint_url "https://db.ygoprodeck.com/api/v7/randomcard.php"

  @doc """
  Requests random card.
  """
  @spec get_random_card :: {:error, String.t()} | {:ok, [map()]}
  def get_random_card, do: HTTPClient.make_request(@endpoint_url)
end
