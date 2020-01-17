defmodule TodosWeb.FormComponent do
  use Phoenix.LiveComponent

  alias Phoenix.LiveView.Socket
  alias Phoenix.View
  alias TodosWeb.TodoView

  def render(assigns) do
    View.render TodoView, "form_component.html", assigns
  end

  def handle_event("new", %{"text" => text}, %Socket{} = socket) do
    send(self(), {:new, text})
    {:noreply, socket}
  end
end