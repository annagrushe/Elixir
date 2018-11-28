defmodule Identicon do
  @moduledoc """
  Generating a string into an unique image,
  that is always equel to the string.
  """

  def main(string) do
    string
    |> hashing
  end

  def hashing (string) do
    :crypto.hash(:md5, string)
    |> :binary.bin_to_list
  end

end
