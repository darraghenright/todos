defmodule TodosWeb.FooterComponent do
  use Phoenix.LiveComponent

  alias Phoenix.LiveView.Socket
  alias Phoenix.View
  alias TodosWeb.TodoView

  def render(assigns) do
    View.render(TodoView, "footer_component.html", assigns)
  end

  def handle_event("clear_complete", _value, %Socket{} = socket) do
    send(self(), :clear_complete)
    {:noreply, socket}
  end
end
