defmodule Todos.TodoList.FilterTest do
  use ExUnit.Case

  alias Todos.{Todo, TodoList}
  alias Todos.TodoList.Filter

  setup do
    complete = Todo.complete(Todo.new("complete"))
    incomplete = Todo.new("incomplete")

    todo_list =
      TodoList.new()
      |> TodoList.add(complete)
      |> TodoList.add(incomplete)

    %{
      complete: complete,
      incomplete: incomplete,
      todo_list: todo_list
    }
  end

  test ":filter_all shows all todos", %{complete: complete, incomplete: incomplete, todo_list: todo_list} do
    assert [incomplete, complete] == todo_list.todos
    assert [incomplete, complete] = Filter.filter(todo_list, :filter_all)
  end

  test ":filter_active shows incomplete todos", %{incomplete: incomplete, todo_list: todo_list} do
    assert [incomplete] == Filter.filter(todo_list, :filter_active)
  end

  test ":filter_complete shows complete todos", %{complete: complete, todo_list: todo_list} do
    assert [complete] == Filter.filter(todo_list, :filter_complete)
  end
end
