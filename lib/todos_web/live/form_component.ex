defmodule TodosWeb.FormComponent do
  use Phoenix.LiveComponent

  alias Phoenix.LiveView.Socket
  alias Phoenix.View
  alias TodosWeb.TodoView

  def render(assigns) do
    View.render TodoView, "form_component.html", assigns
  end

  def handle_event("new", %{"todo" => %{"text" => text}}, %Socket{} = socket) do
    # TODO temporary validation, we'll move this soon.
    if String.length(text) > 0, do: send(self(), {:new, text})
    {:noreply, socket}
  end
end
