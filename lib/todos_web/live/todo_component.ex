defmodule TodosWeb.TodoComponent do
  use Phoenix.LiveComponent

  alias Phoenix.LiveView.Socket
  alias Phoenix.View
  alias TodosWeb.TodoView

  def render(assigns) do
    View.render(TodoView, "todo_component.html", assigns)
  end

  def handle_event("delete", _value, %Socket{assigns: %{todo: todo}} = socket) do
    emit(socket, {:delete, todo})
  end

  def handle_event("toggle_complete", _value, %Socket{assigns: %{todo: todo}} = socket) do
    emit(socket, {:toggle_complete, todo})
  end

  defp emit(%Socket{} = socket, message) do
    send(self(), message)
    {:noreply, socket}
  end
end
