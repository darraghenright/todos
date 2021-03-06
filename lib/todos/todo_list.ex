defmodule Todos.TodoList do
  alias Todos.{Todo, TodoList}

  defstruct todos: []

  def new() do
    %TodoList{}
  end

  def add(%TodoList{todos: todos} = todo_list, %Todo{} = todo) do
    %TodoList{todo_list | todos: [todo | todos]}
  end

  def find(%TodoList{todos: todos}, id) do
    Enum.find(todos, & &1.id == id)
  end

  def update(%TodoList{} = todo_list, id, text) do
    case find(todo_list, id) do
      nil -> todo_list
      todo -> update(todo_list, Todo.update(todo, text))
    end
  end

  def update(%TodoList{todos: todos} = todo_list, %Todo{} = todo) do
    todos =
      case Enum.find_index(todos, & &1.id == todo.id) do
        nil -> todos
        position -> List.replace_at(todos, position, todo)
      end

    %TodoList{todo_list | todos: todos}
  end

  def delete(%TodoList{todos: todos} = todo_list, %Todo{} = todo) do
    todos =
      case Enum.find_index(todos, & &1.id == todo.id) do
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

  def count_complete(%TodoList{todos: todos}) do
    Enum.count(todos, & &1.complete?)
  end

  def count_incomplete(%TodoList{todos: todos}) do
    Enum.count(todos, & !&1.complete?)
  end

  def has_complete?(%TodoList{} = todo_list) do
    0 != count_complete(todo_list)
  end

  def clear_complete(%TodoList{todos: todos} = todo_list) do
    %TodoList{todo_list | todos: Enum.filter(todos, & !&1.complete?)}
  end
end
