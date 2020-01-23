defmodule TodosWeb.TodoView do
  use TodosWeb, :view

  import Todos.TodoList, only: [has_complete?: 1, count_incomplete: 1, empty?: 1]
  import Todos.TodoList.Filter, only: [filter: 2]

  alias Todos.TodoList
  alias TodosWeb.{FooterComponent, FormComponent, TodoComponent}

  def item_or_items(%TodoList{} = todo_list) do
    case count_incomplete(todo_list) do
      1 -> "item"
      _ -> "items"
    end
  end

  def filter_options() do
    [
      {:filter_all, "All"},
      {:filter_active, "Active"},
      {:filter_complete, "Complete"}
    ]
  end

end
