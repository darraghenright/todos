defmodule TodosWeb.TodoLive do
  use Phoenix.LiveView

  alias Phoenix.LiveView.Socket
  alias Phoenix.View
  alias Todos.{Todo, TodoList}
  alias TodosWeb.TodoView

  def mount(%{todo_list: todo_list}, %Socket{} = socket) do
    socket =
      socket
      |> assign(:todo_list, todo_list)
      |> assign(:filter, :filter_all)

    {:ok, socket}
  end

  def render(assigns) do
    View.render(TodoView, "live/todo.html", assigns)
  end

  def handle_info({:new, text}, %Socket{assigns: %{todo_list: todo_list}} = socket) do
    todo_list
    |> TodoList.add(Todo.new(text))
    |> update_todo_list(socket)
  end

  def handle_info({:delete, %Todo{} = todo}, %Socket{assigns: %{todo_list: todo_list}} = socket) do
    todo_list
    |> TodoList.delete(todo)
    |> update_todo_list(socket)
  end

  def handle_info({:toggle_complete, %Todo{} = todo}, %Socket{assigns: %{todo_list: todo_list}} = socket) do
    todo_list
    |> TodoList.update(Todo.toggle_complete(todo))
    |> update_todo_list(socket)
  end

  def handle_info(:clear_complete, %Socket{assigns: %{todo_list: todo_list}} = socket) do
    todo_list
    |> TodoList.clear_complete()
    |> update_todo_list(socket)
  end

  def handle_info(:filter_all, %Socket{} = socket) do
    {:noreply, assign(socket, filter: :filter_all)}
  end

  def handle_info(:filter_active, %Socket{} = socket) do
    {:noreply, assign(socket, filter: :filter_active)}
  end

  def handle_info(:filter_complete, %Socket{} = socket) do
    {:noreply, assign(socket, filter: :filter_complete)}
  end

  defp update_todo_list(%TodoList{} = todo_list, %Socket{} = socket) do
    {:noreply, assign(socket, :todo_list, todo_list)}
  end
end
