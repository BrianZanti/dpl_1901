require './test/test_helper'
require './lib/library'
require './lib/author'

class LibraryTest < Minitest::Test
  def test_it_exists
    dpl = Library.new
    assert_instance_of Library, dpl
  end

  def test_it_starts_with_no_books
    dpl = Library.new
    assert_equal [], dpl.books
  end

  def test_it_can_add_books
    nk_jemisin = Author.new({first_name: "N.K.", last_name: "Jemisin"})
    fifth_season = nk_jemisin.add_book("The Fifth Season", "November 3, 2015")
    kingdoms = nk_jemisin.add_book("The Hundred Thousand Kingdoms", "2010")

    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")

    dpl = Library.new
    dpl.add_to_collection(fifth_season)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(kingdoms)
    assert_equal [fifth_season, mockingbird, kingdoms], dpl.books
  end

  def test_it_knows_if_a_book_is_included_in_the_collection
    nk_jemisin = Author.new({first_name: "N.K.", last_name: "Jemisin"})
    fifth_season = nk_jemisin.add_book("The Fifth Season", "November 3, 2015")
    kingdoms = nk_jemisin.add_book("The Hundred Thousand Kingdoms", "2010")

    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")

    dpl = Library.new
    dpl.add_to_collection(fifth_season)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(kingdoms)

    assert_equal true, dpl.include?("To Kill a Mockingbird")
    assert_equal false, dpl.include?("A Connecticut Yankee in King Arthur's Court")
  end

  def test_it_can_return_card_catalogue
    nk_jemisin = Author.new({first_name: "N.K.", last_name: "Jemisin"})
    fifth_season = nk_jemisin.add_book("The Fifth Season", "November 3, 2015")
    kingdoms = nk_jemisin.add_book("The Hundred Thousand Kingdoms", "2010")

    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")

    dpl = Library.new
    dpl.add_to_collection(fifth_season)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(kingdoms)

    assert_equal [fifth_season, kingdoms, mockingbird], dpl.card_catalogue
  end

  def test_it_can_find_by_author
    nk_jemisin = Author.new({first_name: "N.K.", last_name: "Jemisin"})
    fifth_season = nk_jemisin.add_book("The Fifth Season", "November 3, 2015")
    kingdoms = nk_jemisin.add_book("The Hundred Thousand Kingdoms", "2010")

    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")

    dpl = Library.new
    dpl.add_to_collection(fifth_season)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(kingdoms)

    expected = {
      "The Fifth Season" => fifth_season,
      "The Hundred Thousand Kingdoms" => kingdoms
    }
    assert_equal expected, dpl.find_by_author("N.K. Jemisin")
  end
  def test_it_can_find_by_publication_date
    nk_jemisin = Author.new({first_name: "N.K.", last_name: "Jemisin"})
    fifth_season = nk_jemisin.add_book("The Fifth Season", "November 3, 2015")
    kingdoms = nk_jemisin.add_book("The Hundred Thousand Kingdoms", "2010")

    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")

    dpl = Library.new
    dpl.add_to_collection(fifth_season)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(kingdoms)

    expected = {
      "To Kill a Mockingbird" => mockingbird
    }
    assert_equal expected,  dpl.find_by_publication_date("1960")
  end
end
