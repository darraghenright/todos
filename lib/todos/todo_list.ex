defmodule Todos.TodoList do
  alias Todos.{Todo, TodoList}

  defstruct todos: []

  def new() do
    %TodoList{}
  end

  def add(%TodoList{todos: todos} = todo_list, %Todo{} = todo) do
    %TodoList{todo_list | todos: [todo | todos]}
  end

  def find(%TodoList{todos: todos}, %Todo{} = todo) do
    Enum.find_index(todos, & &1.id == todo.id)
  end

  def update(%TodoList{todos: todos} = todo_list, %Todo{} = todo) do
    todos =
      case TodoList.find(todo_list, todo) do
        nil -> todos
        position -> List.replace_at(todos, position, todo)
      end

    %TodoList{todo_list | todos: todos}
  end

  def delete(%TodoList{todos: todos} = todo_list, %Todo{} = todo) do
    todos =
      case TodoList.find(todo_list, todo) do
        nil -> todos
        position -> List.delete_at(todos, position)
      end

    %TodoList{todo_list | todos: todos}
  end

  def empty?(%TodoList{} = todo_list) do
    0 === count_all(todo_list)
  end

  def count_all(%TodoList{todos: todos}) do
    length(todos)
  end

  def count_incomplete(%TodoList{todos: todos}) do
    Enum.count(todos, & !&1.complete?)
  end

  def clear_complete(%TodoList{todos: todos} = todo_list) do
    %TodoList{todo_list | todos: Enum.filter(todos, & !&1.complete?)}
  end
end
