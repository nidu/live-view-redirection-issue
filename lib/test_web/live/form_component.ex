defmodule TestWeb.FormComponent do
  use TestWeb, :live_component

  @impl true
  def handle_event("save", _, socket) do
    {:noreply,
     socket
     |> put_flash(:info, "Listing query updated successfully")
     |> push_redirect(to: socket.assigns.return_to)}
  end

  @impl true
def render(assigns) do
  ~L"""
  <%= f = form_for :model, "#",
    id: "test_form",
    phx_submit: "save",
    phx_target: @myself %>

    <div>Hello</div>
    <div>
      <%= live_component TestWeb.FormComponent.NestedComponent, %{form: f} %>
    </div>
    <button type="submit" phx-target="<%= @myself %>">Save</button>

  </form>
  """
end
end

defmodule TestWeb.FormComponent.NestedComponent do
  use TestWeb, :live_component

  @impl true
  def update(%{form: form} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)}
  end

  @impl true
  def render(assigns) do
    ~L"""
    """
  end
end
