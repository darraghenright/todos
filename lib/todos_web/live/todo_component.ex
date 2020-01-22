defmodule TodosWeb.TodoComponent do
  use Phoenix.LiveComponent

  alias Phoenix.LiveView.Socket
  alias Phoenix.View
  alias TodosWeb.TodoView

  def render(assigns) do
    View.render(TodoView, "todo_component.html", assigns)
  end

  def handle_event("delete", _value, %Socket{assigns: %{todo: todo}} = socket) do
    send(self(), {:delete, todo})
    {:noreply, socket}
  end

  def handle_event("toggle_complete", _value, %Socket{assigns: %{todo: todo}} = socket) do
    send(self(), {:toggle_complete, todo})
    {:noreply, socket}
  end
end
