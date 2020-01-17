defmodule TodosWeb.FooterComponent do
  use Phoenix.LiveComponent

  alias Phoenix.View
  alias TodosWeb.TodoView

  def render(assigns) do
    View.render(TodoView, "footer_component.html", assigns)
  end
end
