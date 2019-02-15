class Library
  attr_reader :books

  def initialize
    @books = []
  end

  def add_to_collection(book)
    @books << book
  end

  def include?(title)
    # titles = @books.map do |book|
    #   book.title
    # end
    # titles.include?(title)

    # @books.each do |book|
    #   if book.title == title
    #     return true
    #   end
    # end
    # false

    # found_book = @books.find do |book|
    #   book.title == title
    # end
    # if found_book
    #   return true
    # else
    #   return false
    # end

    @books.any? do |book|
      book.title == title
    end
  end

  def card_catalogue
    @books.sort_by do |book|
      book.author_last_name
    end
  end

  def find_by_author(author_name)
    books = {}
    authors_books = @books.find_all do |book|
      full_name = "#{book.author_first_name} #{book.author_last_name}"
      full_name == author_name
    end
    authors_books.each do |book|
      books[book.title] = book
    end
    return books
  end

  def find_by_publication_date(year)
    books = {}
    authors_books = @books.find_all do |book|
      book.publication_date == year
    end
    authors_books.each do |book|
      books[book.title] = book
    end
    return books
  end
end
