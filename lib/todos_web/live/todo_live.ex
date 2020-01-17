defmodule TodosWeb.TodoLive do
  use Phoenix.LiveView

  alias Phoenix.LiveView.Socket
  alias Phoenix.View
  alias Todos.{Todo, TodoList}
  alias TodosWeb.TodoView

  def mount(%{todo_list: todo_list}, %Socket{} = socket) do
    {:ok, assign(socket, :todo_list, todo_list)}
  end

  def render(assigns) do
    View.render(TodoView, "todo.html", assigns)
  end

  def handle_info({:new, text}, %Socket{assigns: %{todo_list: todo_list}} = socket) do
    todo_list = TodoList.add(todo_list, Todo.new(text))
    {:noreply, assign(socket, :todo_list, todo_list)}
  end

  def handle_info({:delete, %Todo{} = todo}, %Socket{assigns: %{todo_list: todo_list}} = socket) do
    todo_list = TodoList.delete(todo_list, todo)
    {:noreply, assign(socket, :todo_list, todo_list)}
  end
end
