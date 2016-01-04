defmodule NinetyNineProblems do

  def last([n]) do
    n
  end
  
  def last([head | tail]) do
    last(tail)
  end

  def penultimate([head | tail]) when length(tail) == 1 do
    head
  end
  def penultimate([head | tail]) do
    penultimate(tail)
  end
  def reverse([head | tail]) do
    reverse(tail) ++ [head]
  end
  def reverse(list) do
    list
  end

  def nth(0, [head | _]) do
    head
  end

  def nth(n, [_ | tail]) do
    nth(n - 1, tail)
  end

  def my_length(list), do: my_length(list, 0)
  defp my_length([], acc), do: acc
  defp my_length([head | tail], acc), do: my_length(tail, acc + 1)
  
end
