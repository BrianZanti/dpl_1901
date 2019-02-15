require './lib/book'

class Author
  attr_reader :books

  def initialize(attributes)
    @books = []
    @first_name = attributes[:first_name]
    @last_name = attributes[:last_name]
  end

  def add_book(title, publication_date)
    new_book = Book.new({
      author_first_name: @first_name,
      author_last_name: @last_name,
      title: title,
      publication_date: publication_date
    })
    @books << new_book
    new_book
  end
end
