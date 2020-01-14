defmodule Todos.TodoList do
  alias Todos.{Todo, TodoList}

  defstruct todos: []

  def new() do
    %TodoList{}
  end

  def add(%TodoList{todos: todos} = todo_list, %Todo{} = todo) do
    %TodoList{todo_list | todos: [todo | todos]}
  end

  def count(%TodoList{} = todo_list) do
    length(todo_list.todos)
  end

  def clear_complete(%TodoList{todos: todos} = todo_list) do
    %TodoList{todo_list | todos: Enum.filter(todos, & &1.complete?)}
  end
end
