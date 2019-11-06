defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 52 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 52
  end

  test "shuffling a deck randomizes it" do
    deck = Cards.create_deck
    refute deck == Cards.shuffle(deck)
  end

  test "saving a deck into my_deck file" do
    filename = "my_deck"
    Cards.create_deck
    |> Cards.save(filename)
    assert File.exists?(filename)
  end
end
