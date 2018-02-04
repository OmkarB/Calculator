defmodule Calc do
  @moduledoc """
  Documentation for Calc.
  """

  def main() do
    result = IO.gets("> ")
    IO.puts(eval(result))
    main()
  end

  def eval(str) do
    String.replace(str, "(", "( ")
    |> String.replace(")", " )")
    |> String.replace("+", " + ")
    |> String.replace("-", " - ")
    |> String.replace("*", " * ")
    |> String.replace("/", " / ")
    |> String.split()
    |> eval_stack()
  end


  def eval_stack([n, op | rest]) do

    cond do
      n == "(" ->
        list = Enum.concat(["(", op], rest)
        eval_parens(Enum.join(list, ""))
      op == "-" ->
        eval_stack(n) - eval_stack(rest)
      op == "+" ->
        eval_stack(n) + eval_stack(rest)
      op == "/" ->
        eval_stack(n) / eval_stack(rest)
      op == "*" ->
        eval_stack(n) * eval_stack(rest)
    end
  end

  def eval_stack([n]), do: String.to_integer(n)
  def eval_stack(n), do: String.to_integer(n)

  def eval_parens(expr) do
    matches = Regex.scan(~r/\((.*)\)/, expr)
    Enum.each(matches, fn(m) ->
      [ _| rest] = m

      Enum.each(rest, fn(x) ->
        String.split(rest, "", trim: true)
        |> eval_stack()
      end)
    end)
  end
end