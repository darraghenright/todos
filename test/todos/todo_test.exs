defmodule Todos.TodoTest do
  use ExUnit.Case

  alias Todos.Todo

  setup do
    %{todo: Todo.new("Eat dinner")}
  end

  test "a new todo is assigned an id", %{todo: todo} do
    refute nil == todo.id
  end

  test "a new todo has a text field", %{todo: todo} do
    assert "Eat dinner" == todo.text
  end

  test "a todo constructor must specify a text field" do
    assert_raise UndefinedFunctionError, fn -> Todo.new() end
  end

  test "a new todo is not complete", %{todo: todo} do
    assert false == todo.complete?
  end

  test "a todo can be marked complete", %{todo: todo} do
    assert true == Todo.complete(todo).complete?
  end
end
