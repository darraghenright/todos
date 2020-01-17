defmodule TodosWeb.TodoView do
  use TodosWeb, :view

  alias Todos.TodoList
  alias TodosWeb.{FooterComponent, FormComponent, TodoComponent}

  def count_incomplete(%TodoList{} = todo_list) do
    TodoList.count_incomplete(todo_list)
  end
end
