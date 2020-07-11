defmodule YGO.CardSets do
  @moduledoc """
  Contains HTTP requests for all card sets.
  """

  use HTTPoison.Base

  @endpoint_url "https://db.ygoprodeck.com/api/v7/cardsets.php"

  @doc """
  Requests all card sets.
  """
  @spec get_card_sets :: {:error, String.t()} | {:ok, [map()]}
  def get_card_sets do
    case get!(@endpoint_url) do
      %HTTPoison.Response{status_code: 200, body: body} ->
        Jason.decode(body)

      %HTTPoison.Response{status_code: 400} ->
        {:error, "API error"}
    end
  end
end
