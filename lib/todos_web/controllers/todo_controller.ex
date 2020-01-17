defmodule TodosWeb.TodoController do
  use TodosWeb, :controller

  alias Todos.{Todo, TodoList}
  alias TodosWeb.TodoLive

  def index(conn, _params) do
    todo_list =
      TodoList.new()
      |> TodoList.add(Todo.new("Eat dinner"))
      |> TodoList.add(Todo.new("Wash dishes"))

    live_render(conn, TodoLive, session: %{todo_list: todo_list})
  end
end
