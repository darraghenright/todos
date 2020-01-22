defmodule TodosWeb.TodoView do
  use TodosWeb, :view

  import Todos.TodoList, only: [
    count_all: 1,
    count_incomplete: 1,
    empty?: 1
  ]

  alias Todos.TodoList
  alias TodosWeb.{FooterComponent, FormComponent, TodoComponent}

  def item_or_items(%TodoList{} = todo_list) do
    case count_incomplete(todo_list) do
      1 -> "item"
      _ -> "items"
    end
  end
end
