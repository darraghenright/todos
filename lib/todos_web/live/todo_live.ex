defmodule Todos.TodoLive do
  use Phoenix.LiveView

  alias Phoenix.LiveView.Socket
  alias Phoenix.View
  alias TodosWeb.TodoView

  def render(assigns) do
    View.render(TodoView, "index.html", assigns)
  end
end
