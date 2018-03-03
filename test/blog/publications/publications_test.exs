defmodule Blog.PublicationsTest do
  use Blog.DataCase

  alias Blog.Publications

  describe "blogs" do
    alias Blog.Publications.Blog

    @valid_attrs %{body: "some body", source: "some source", subtitle: "some subtitle", title: "some title"}
    @update_attrs %{body: "some updated body", source: "some updated source", subtitle: "some updated subtitle", title: "some updated title"}
    @invalid_attrs %{body: nil, source: nil, subtitle: nil, title: nil}

    def blog_fixture(attrs \\ %{}) do
      {:ok, blog} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Publications.create_blog()

      blog
    end

    test "list_blogs/0 returns all blogs" do
      blog = blog_fixture()
      assert Publications.list_blogs() == [blog]
    end

    test "get_blog!/1 returns the blog with given id" do
      blog = blog_fixture()
      assert Publications.get_blog!(blog.id) == blog
    end

    test "create_blog/1 with valid data creates a blog" do
      assert {:ok, %Blog{} = blog} = Publications.create_blog(@valid_attrs)
      assert blog.body == "some body"
      assert blog.source == "some source"
      assert blog.subtitle == "some subtitle"
      assert blog.title == "some title"
    end

    test "create_blog/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Publications.create_blog(@invalid_attrs)
    end

    test "update_blog/2 with valid data updates the blog" do
      blog = blog_fixture()
      assert {:ok, blog} = Publications.update_blog(blog, @update_attrs)
      assert %Blog{} = blog
      assert blog.body == "some updated body"
      assert blog.source == "some updated source"
      assert blog.subtitle == "some updated subtitle"
      assert blog.title == "some updated title"
    end

    test "update_blog/2 with invalid data returns error changeset" do
      blog = blog_fixture()
      assert {:error, %Ecto.Changeset{}} = Publications.update_blog(blog, @invalid_attrs)
      assert blog == Publications.get_blog!(blog.id)
    end

    test "delete_blog/1 deletes the blog" do
      blog = blog_fixture()
      assert {:ok, %Blog{}} = Publications.delete_blog(blog)
      assert_raise Ecto.NoResultsError, fn -> Publications.get_blog!(blog.id) end
    end

    test "change_blog/1 returns a blog changeset" do
      blog = blog_fixture()
      assert %Ecto.Changeset{} = Publications.change_blog(blog)
    end
  end
end
