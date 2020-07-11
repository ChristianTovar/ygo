defmodule YGO do
  @moduledoc """
  Documentation for `YGO`.
  """

  @doc """
  Get card information based on input paramters.

  Args:
  * `params` - Map containing the card's searching properties.

  ## Examples

    {:ok,
      [
      %{
        "archetype" => "Dark Magician",
        "atk" => 2500,
        "attribute" => "DARK",
        "card_images" => [
          %{
            "id" => 46986414,
            "image_url" => "https://storage.googleapis.com/ygoprodeck.com/pics/46986414.jpg",
            "image_url_small" => "https://storage.googleapis.com/ygoprodeck.com/pics_small/46986414.jpg"
          }, ...
        ],
        "card_prices" => [
          %{
            "amazon_price" => "2.03",
            "cardmarket_price" => "0.02",
            ...
          }
        ],
        "card_sets" => [
          %{
            "set_code" => "CT13-EN003",
            "set_name" => "2016 Mega-Tins",
            ...
          }, ...
        ],
        "def" => 2100,
        "desc" => "The ultimate wizard in terms of attack and defense.",
        "id" => 46986414,
        "level" => 7,
        "name" => "Dark Magician",
        "race" => "Spellcaster",
        "type" => "Normal Monster"
      }
      ]}

  """
  @spec get_card_information(params :: map()) :: {:error, String.t()} | {:ok, [map()]}
  defdelegate get_card_information(params), to: YGO.CardInformation

  @doc """
  Get a random card.
  """
  @spec get_random_card :: {:error, String.t()} | {:ok, [map()]}
  defdelegate get_random_card, to: YGO.RandomCard

  @doc """
  Get card set information.
  """
  @spec get_card_set_information(set :: String.t()) :: {:error, String.t()} | {:ok, [map()]}
  defdelegate get_card_set_information(set), to: YGO.CardSetInformation

  @doc """
  Get all card sets.
  """
  @spec get_card_sets :: {:error, String.t()} | {:ok, [map()]}
  defdelegate get_card_sets, to: YGO.CardSets

  @doc """
  Get all card archetypes.
  """
  @spec get_card_archetypes :: {:error, String.t()} | {:ok, [map()]}
  defdelegate get_card_archetypes, to: YGO.CardArchetypes
end
