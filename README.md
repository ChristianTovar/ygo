<p align="center">
  <a href="https://github.com/ChristianTovar/ygo">
    <img alt="YGO" src="./logotype.png" height="152" width="285">
  </a>
</p>

<p align="center">
  <a href="https://github.com/ChristianTovar/ygo">
    <img alt="CI Status" src="https://github.com/ChristianTovar/ygo/workflows/Elixir%20CI/badge.svg">
  </a>
</p>

---

## Description
Get Your Game On! 🔥 <a href="https://github.com/ChristianTovar/ygo">YGO</a> is an Elixir wrapper for the Yu-Gi-Oh! Trading Card Game API from <a href="https://db.ygoprodeck.com/api-guide/">YGOPRODeck</a>.

## Installation

YGO can be installed by adding `ygo` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ygo, "~> 0.1.0"}
  ]
end
```
and running `mix deps.get`.

## Reference

- [Cards](#Cards)
- [Sets](#Sets)
- [Archetypes](#Archetypes)
- [Restrictions](#Restrictions)
  - [Rate Limit](#rate-limit)
  - [Image Pulling](#rate-limit)
- [Contributing](#Contributing)

---

## Cards

To get cards information use the following function:

```elixir
iex> YGO.get_card_information(%{name: "Dark Magician"})
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
```

## Sets

For obtaining information about a specific card set use:
```elixir
iex> YGO.get_card_set_information(%{name: "SDY-046"})
```
or in case you want to list every released set:
```elixir
iex> YGO.get_card_sets
```

## Archetypes

For listing all the cards from an _Archetype_ use:
```elixir
iex> YGO.get_card_set_information(%{archetype: "Blue-Eyes"})
```
or in case you want to list all the _Archetypes_:
```elixir
iex> YGO.get_card_archetypes
```

## Restrictions

###  ⚠️ Rate Limit
> The rate limit is 20 requests per 1 second. If you exceed this, you are blocked from accessing the API for 1 hour. This limit rate is being monitored and being adjuested accordingly.

###  ⚠️ Image Pulling
> Please download and store all data pulled from this API locally to keep the amount of API calls used to a minimum. Failure to do so may result in either your IP address being blacklisted or the API being rolled back.

---

Dependency made with 🖤 by [Christian Tovar](https://github.com/ChristianTovar). API rights correspond to [YGOPRODeck](https://ygoprodeck.com)