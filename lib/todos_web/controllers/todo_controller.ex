defmodule TodosWeb.TodoController do
  use TodosWeb, :controller

  alias Todos.TodoLive

  def index(conn, _params) do
    live_render(conn, TodoLive)
  end
end
