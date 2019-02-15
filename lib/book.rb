class Book
  attr_reader :author_last_name,
              :author_first_name,
              :title,
              :publication_date

  def initialize(attributes)
    @author_last_name = attributes[:author_last_name]
    @author_first_name =attributes[:author_first_name]
    @title = attributes[:title]
    @publication_date = attributes[:publication_date][-4..-1]
  end
end
