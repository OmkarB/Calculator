defmodule CalcTest do
  use ExUnit.Case
  doctest Calc

  test "add" do
    assert Calc.eval("1 + 2") == 3
    assert Calc.eval("34 + 45") == 79
  end

  test "sub" do
    assert Calc.eval("2 - 1") == 1
    assert Calc.eval("45 - 34") == 11
  end

  test "mult" do
    assert Calc.eval("2 * 1") == 2
    assert Calc.eval("45 * 34") == 1530
  end

  test "div" do
    assert Calc.eval("4 /2 ") == 2
  end

  test "paren" do
    assert Calc.eval("2 * (2 + 3)")  == 10
  end

  test "paren2" do
    assert Calc.eval("(2 * 2 + 3)")  == 7
  end

  test "paren3" do
    assert Calc.eval("(2 * 2) + 3")  == 7
  end
end
