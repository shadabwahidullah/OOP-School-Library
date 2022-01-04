class BookLogic
  def initialize(list_handler)
    @list_handler = list_handler
  end

  def list_books
    @list_handler.books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    puts
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    b = Book.new(title, author)
    @list_handler.books.push(b)
    puts 'Book created successfully'
    puts
  end
end
