defmodule YGO.CardSetInformation do
  @moduledoc """
  Contains HTTP requests for card set information.
  """

  alias YGO.HTTPClient

  @endpoint_url "https://db.ygoprodeck.com/api/v7/cardsetsinfo.php"

  @doc """
  Requests card set information.
  """
  @spec get_card_set_information(set :: binary) :: {:error, String.t()} | {:ok, [map]}
  def get_card_set_information(set), do: HTTPClient.make_request(@endpoint_url, %{setname: set})
end
