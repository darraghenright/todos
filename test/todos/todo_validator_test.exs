defmodule Todos.TodoValidatorTest do
  use ExUnit.Case

  import Todos.TodoValidator

  test "Test guard is_valid_text" do
    assert false == is_valid_text(1)
    assert false == is_valid_text('')
    assert false == is_valid_text("")
    assert true  == is_valid_text("Eat dinner")
  end

end
