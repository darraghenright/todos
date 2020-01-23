defmodule Todos.TodoList.Filter do
  alias Todos.TodoList

  def filter(%TodoList{todos: todos}, :filter_active) do
    Enum.filter(todos, & !&1.complete?)
  end

  def filter(%TodoList{todos: todos}, :filter_complete) do
    Enum.filter(todos, & &1.complete?)
  end

  def filter(%TodoList{todos: todos}, _) do
    todos
  end
end
