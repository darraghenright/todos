defmodule TodosWeb.TodoComponent do
  use Phoenix.LiveComponent

  alias Phoenix.View
  alias TodosWeb.TodoView

  def render(assigns) do
    View.render(TodoView, "todo_component.html", assigns)
  end
end
