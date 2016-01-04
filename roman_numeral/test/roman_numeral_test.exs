defmodule RomanNumeralTest do
  use ExUnit.Case
  doctest RomanNumeral

  test "converts arabic into roman numerals" do
    numerals = [
      {0, ""},
      {1, "I"},
      {2, "II"},
      {3, "III"},
      {4, "IV"},
      {5, "V"},
      {6, "VI"},
      {9, "IX"},
      {10, "X"},
      {29, "XXIX"}
    ]

    Enum.each numerals, fn({arabic, roman}) -> assert RomanNumeral.converts(arabic) == roman end
  end

  test "converts 0" do
    assert RomanNumeral.converts(0) == ""
  end
  test "converts 1" do
    assert RomanNumeral.converts(1) == "I"
  end
  test "converts 2" do
    assert RomanNumeral.converts(2) == "II"
  end
  
  test "converts 3" do
    assert RomanNumeral.converts(2) == "II"
  end
end
