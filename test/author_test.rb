require './test/test_helper'
require './lib/author'
require './lib/book'

class AuthorTest < Minitest::Test
  def test_it_exists
    nk_jemisin = Author.new({first_name: "N.K.", last_name: "Jemisin"})
    assert_instance_of Author, nk_jemisin
  end

  def test_it_starts_with_no_books
    nk_jemisin = Author.new({first_name: "N.K.", last_name: "Jemisin"})
    assert_equal [], nk_jemisin.books
  end

  def test_add_book_returns_the_new_book
    nk_jemisin = Author.new({first_name: "N.K.", last_name: "Jemisin"})
    new_book = nk_jemisin.add_book("The Fifth Season", "November 3, 2015")
    # assert_equal new_book, nk_jemisin.books.first
    assert_equal "The Fifth Season", new_book.title
    assert_equal "N.K.", new_book.author_first_name
    assert_equal "Jemisin", new_book.author_last_name
    assert_equal "2015", new_book.publication_date
  end

  def test_add_book_adds_the_new_book_to_the_books_array
    nk_jemisin = Author.new({first_name: "N.K.", last_name: "Jemisin"})

    book_1 = nk_jemisin.add_book("The Fifth Season", "November 3, 2015")
    book_2 = nk_jemisin.add_book("The Hundred Thousand Kingdoms", "2010")

    assert_equal [book_1, book_2], nk_jemisin.books
    # assert_instance_of Book, nk_jemisin.books.first
    # assert_equal "The Hundred Thousand Kingdoms", nk_jemisin.books.last.title
    # assert_equal 2, nk_jemisin.books.length
  end
end
