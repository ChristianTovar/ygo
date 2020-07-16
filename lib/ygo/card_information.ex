defmodule YGO.CardInformation do
  @moduledoc """
  Contains HTTP requests for the card information endpoint.
  """

  alias YGO.HTTPClient

  @endpoint_url "https://db.ygoprodeck.com/api/v7/cardinfo.php"

  @doc """
  Requests card information to the Yu-Gi-Oh! api.
  """
  @spec get_card_information(map()) :: {:error, String.t()} | {:ok, [map()]}
  def get_card_information(params), do: HTTPClient.make_request(@endpoint_url, params)
end
