defmodule TodosWeb.TodoLive do
  use Phoenix.LiveView

  alias Phoenix.LiveView.Socket
  alias Phoenix.View
  alias TodosWeb.TodoView

  def mount(%{todo_list: todo_list}, socket) do
    {:ok, assign(socket, :todo_list, todo_list)}
  end

  def render(assigns) do
    View.render(TodoView, "todo.html", assigns)
  end
end
