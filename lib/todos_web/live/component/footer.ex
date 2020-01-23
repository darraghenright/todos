defmodule TodosWeb.FooterComponent do
  use Phoenix.LiveComponent

  alias Phoenix.LiveView.Socket
  alias Phoenix.View
  alias TodosWeb.TodoView

  def render(assigns) do
    View.render(TodoView, "component/footer.html", assigns)
  end

  def handle_event("clear_complete", _value, %Socket{} = socket) do
    emit(socket, :clear_complete)
  end

  def handle_event("filter_all", _value, %Socket{} = socket) do
    emit(socket, :filter_all)
  end

  def handle_event("filter_active", _value, %Socket{} = socket) do
    emit(socket, :filter_active)
  end

  def handle_event("filter_complete", _value, %Socket{} = socket) do
    emit(socket, :filter_complete)
  end

  defp emit(%Socket{} = socket, message) do
    send(self(), message)
    {:noreply, socket}
  end
end
