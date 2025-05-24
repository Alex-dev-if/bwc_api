json.extract! book, :id, :Titulo, :Autor, :Ano, :Editora, :ISBN, :Quantidade, :created_at, :updated_at
json.url book_url(book, format: :json)
