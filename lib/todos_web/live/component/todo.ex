defmodule TodosWeb.TodoComponent do
  use Phoenix.LiveComponent

  alias Phoenix.LiveView.Socket
  alias Phoenix.View
  alias TodosWeb.TodoView

  def mount(%Socket{} = socket) do
    {:ok, assign(socket, :editing?, false)}
  end

  def render(assigns) do
    View.render(TodoView, "component/todo.html", assigns)
  end

  def handle_event("delete", _value, %Socket{assigns: %{todo: todo}} = socket) do
    emit(socket, {:delete, todo})
  end

  def handle_event("toggle_complete", _value, %Socket{assigns: %{todo: todo}} = socket) do
    emit(socket, {:toggle_complete, todo})
  end

  def handle_event("edit", _value, %Socket{} = socket) do
    {:noreply, assign(socket, :editing?, true)}
  end

  def handle_event("update", %{"todo" => %{"text" => ""}}, %Socket{} = socket) do
    {:noreply, assign(socket, :editing?, false)}
  end

  def handle_event("update", %{"todo" => %{"text" => text}}, %Socket{assigns: %{id: id}} = socket) do
    socket
    |> assign(:editing?, false)
    |> emit({:update, id, text})
  end

  def handle_event("keyup", %{"code" => "Escape"}, %Socket{} = socket) do
    {:noreply, assign(socket, :editing?, false)}
  end

  def handle_event("keyup", _value, %Socket{} = socket) do
    {:noreply, socket}
  end

  def handle_event("cancel", _value, %Socket{} = socket) do
    {:noreply, assign(socket, :editing?, false)}
  end

  defp emit(%Socket{} = socket, message) do
    send(self(), message)
    {:noreply, socket}
  end
end
