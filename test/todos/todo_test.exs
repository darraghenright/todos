defmodule Todos.TodoTest do
  use ExUnit.Case

  alias Todos.Todo

  setup do
    %{todo: Todo.new("Eat dinner")}
  end

  test "a new todo has a text field", %{todo: todo} do
    assert "Eat dinner" == todo.text
  end

  test "a new todo is not complete", %{todo: todo} do
    assert false == todo.complete?
  end

  test "a todo can be marked complete", %{todo: todo} do
    todo = Todo.complete(todo)
    assert true == todo.complete?
  end
end
