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
    assert 0 == TodoList.count_all(todo_list)
    assert true == TodoList.empty?(todo_list)
  end

  test "add a todo to a new todo_list", %{todo_list: todo_list, todo_a: todo} do
    todo_list = TodoList.add(todo_list, todo)
    assert 1 == TodoList.count_all(todo_list)
    assert [todo] == todo_list.todos
  end

  test "todos are prepended to a todo_list", %{todo_list: todo_list, todo_a: todo_a, todo_b: todo_b} do
    todo_list =
      todo_list
      |> TodoList.add(todo_a)
      |> TodoList.add(todo_b)

    assert 2 == TodoList.count_all(todo_list)
    assert [todo_b, todo_a] == todo_list.todos
  end

  test "find index of a todo in todo_list", %{todo_list: todo_list, todo_a: todo} do
    assert nil == TodoList.find(todo_list, todo.id)
    todo_list = TodoList.add(todo_list, todo)
    assert todo == TodoList.find(todo_list, todo.id)
  end

  test "update a todo in todo_list", %{todo_list: todo_list, todo_a: todo} do
    todo_list = TodoList.add(todo_list, todo)
    updated_todo = Todo.update(todo, "Order pizza")
    todo_list = TodoList.update(todo_list, updated_todo)
    assert [updated_todo] = todo_list.todos
  end

  test "cannot update todo if not in todo_list", %{todo_list: todo_list} do
    todo = Todo.new("Burnish mantlepiece")
    todo_list = TodoList.update(todo_list, todo)
    assert [] = todo_list.todos
  end

  test "delete a todo from a todo_list", %{todo_list: todo_list, todo_a: todo} do
    todo_list = TodoList.add(todo_list, todo)
    assert [todo] = todo_list.todos
    todo_list = TodoList.delete(todo_list, todo)
    assert [] = todo_list.todos
  end

  test "count incomplete todos in a todo_list", %{todo_list: todo_list, todo_a: todo_a, todo_b: todo_b} do
    todo_list =
      todo_list
      |> TodoList.add(todo_a)
      |> TodoList.add(todo_b)

    assert 2 == TodoList.count_incomplete(todo_list)

    todo_list = TodoList.update(todo_list, Todo.complete(todo_a))
    assert 1 = TodoList.count_incomplete(todo_list)

    todo_list = TodoList.update(todo_list, Todo.complete(todo_b))
    assert 0 = TodoList.count_incomplete(todo_list)
  end

  test "check and count complete todos in a todo_list", %{todo_list: todo_list, todo_a: todo_a, todo_b: todo_b} do
    todo_list =
      todo_list
      |> TodoList.add(todo_a)
      |> TodoList.add(todo_b)

    assert 0 == TodoList.count_complete(todo_list)
    assert false == TodoList.has_complete?(todo_list)

    todo_list = TodoList.update(todo_list, Todo.complete(todo_a))
    assert 1 = TodoList.count_complete(todo_list)
    assert true == TodoList.has_complete?(todo_list)

    todo_list = TodoList.update(todo_list, Todo.complete(todo_b))
    assert 2 = TodoList.count_complete(todo_list)
    assert true == TodoList.has_complete?(todo_list)
  end

  test "remove complete todos from a todo_list", %{todo_list: todo_list, todo_a: todo_a, todo_b: todo_b} do
    todo_list =
      todo_list
      |> TodoList.add(todo_a)
      |> TodoList.add(Todo.complete(todo_b))
      |> TodoList.clear_complete()

    assert 1 == TodoList.count_all(todo_list)
    assert [todo_a] = todo_list.todos
  end
end
