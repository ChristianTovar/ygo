defmodule YGO.CardSetInformation do
  @moduledoc """
  Contains HTTP requests for card set information.
  """

  use HTTPoison.Base

  @endpoint_url "https://db.ygoprodeck.com/api/v7/cardsetsinfo.php"

  @doc """
  Requests card set information.
  """
  @spec get_card_set_information(set :: binary) :: {:error, String.t()} | {:ok, [map]}
  def get_card_set_information(set) do
    case get!(@endpoint_url, [], params: %{setcode: set}) do
      %HTTPoison.Response{status_code: 200, body: body} ->
        Jason.decode(body)

      %HTTPoison.Response{status_code: 400} ->
        {:error, "API error"}
    end
  end
end
