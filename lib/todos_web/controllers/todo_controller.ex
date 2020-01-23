defmodule TodosWeb.TodoController do
  use TodosWeb, :controller

  alias Todos.TodoList
  alias TodosWeb.TodoLive

  def index(conn, _params) do
    live_render(conn, TodoLive, session: %{
      todo_list: TodoList.new()
    })
  end
end
