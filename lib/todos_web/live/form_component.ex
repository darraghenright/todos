defmodule TodosWeb.FormComponent do
  use Phoenix.LiveComponent

  alias Phoenix.View
  alias TodosWeb.TodoView

  def render(assigns) do
    View.render(TodoView, "form_component.html", assigns)
  end
end
