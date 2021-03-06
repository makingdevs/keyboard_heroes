defmodule KeyboardHeroes.Auth.GuardianSerializer do
  @behaviour Guardian.Serializer

  alias KeyboardHeroes.Repo
  alias KeyboardHeroes.Person

  def for_token(user = %Person{}), do: {:ok, "Person:#{user.id}"}
  def for_token(_), do: {:error, "Unknown resource type"}

  def from_token("User:" <> id), do: {:ok, Repo.get(Person, id)}
  def from_token(_), do: {:error, "Unknown resource type"}
end