defmodule Todos.TodoListTest do
  use ExUnit.Case

  alias Todos.{Todo, TodoList}

  setup do
    %{
      todo_list: TodoList.new(),
      todo_a: Todo.new("Eat dinner"),
      todo_b: Todo.new("Wash dishes")
    }
  end

  test "a new todo_list is empty", %{todo_list: todo_list} do
    assert 0 == TodoList.count(todo_list)
  end

  test "add a todo to a new todo_list", %{todo_list: todo_list, todo_a: todo} do
    todo_list = TodoList.add(todo_list, todo)
    assert 1 == TodoList.count(todo_list)
    assert [todo] == todo_list.todos
  end

  test "todos are prepended to a todo_list", %{todo_list: todo_list, todo_a: todo_a, todo_b: todo_b} do
    todo_list =
      todo_list
      |> TodoList.add(todo_a)
      |> TodoList.add(todo_b)

    assert 2 == TodoList.count(todo_list)
    assert [todo_b, todo_a] == todo_list.todos
  end

  test "remove complete todos from a todo_list", %{todo_list: todo_list, todo_a: todo_a, todo_b: todo_b} do
    todo_list =
      todo_list
      |> TodoList.add(todo_a)
      |> TodoList.add(Todo.complete(todo_b))
      |> TodoList.clear_complete()

    assert 1 == TodoList.count(todo_list)
    assert [todo_a] = todo_list.todos
  end
end
