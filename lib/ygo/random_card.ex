defmodule YGO.RandomCard do
  @moduledoc """
  Contains HTTP requests for random card.
  """

  use HTTPoison.Base

  @endpoint_url "https://db.ygoprodeck.com/api/v7/randomcard.php"

  @doc """
  Requests random card.
  """
  @spec get_random_card :: {:error, String.t()} | {:ok, [map()]}
  def get_random_card do
    case get!(@endpoint_url) do
      %HTTPoison.Response{status_code: 200, body: body} ->
        Jason.decode(body)

      %HTTPoison.Response{status_code: 400, body: body} ->
        {:error, Jason.decode!(body)["error"]}
    end
  end
end
