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

  test "a todo constructor text field must be a non empty string" do
    assert_raise FunctionClauseError, fn -> Todo.new(123) end
    assert_raise FunctionClauseError, fn -> Todo.new("") end
    assert "Eat dinner" == Todo.new("Eat dinner").text
  end

  test "a todo text field can be updated", %{todo: todo} do
    assert "Order pizza" == Todo.update(todo, "Order pizza").text
  end

  test "a new todo is not complete", %{todo: todo} do
    assert false == todo.complete?
  end

  test "a todo can be marked complete", %{todo: todo} do
    assert true == Todo.complete(todo).complete?
  end

  test "a todo can be marked incomplete", %{todo: todo} do
    assert false == Todo.uncomplete(todo).complete?
  end

  test "a todo can be toggled complete or incomplete", %{todo: todo} do
    assert false == todo.complete?
    todo = Todo.toggle_complete(todo)
    assert true == todo.complete?
    todo = Todo.toggle_complete(todo)
    assert false == todo.complete?
  end
end
