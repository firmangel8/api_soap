from spyne import Application, rpc, ServiceBase, Unicode, Integer, Iterable, ComplexModel
from spyne.protocol.soap import Soap11
from spyne.server.wsgi import WsgiApplication
from repositories.Books.BookRepository import BookRepository

class Book(ComplexModel):
    book_id = Integer
    title = Unicode
    author_id = Integer
    publication_year = Integer
    genre = Unicode
    created_at = Unicode
    updated_at = Unicode
    deleted_at = Unicode


class BookSoapService(ServiceBase):
    # GET
    @rpc(_returns=Iterable(Book))
    def get_books(ctx):
        rows = BookRepository.fetch_all()
        for row in rows:
            yield Book(
                book_id=row["book_id"],
                title=row["title"],
                author_id=row.get("author_id"),
                publication_year=row.get("publication_year"),
                genre=row.get("genre"),
                created_at=str(row["created_at"]),
                updated_at=str(row["updated_at"]),
                deleted_at=str(row["deleted_at"]) if row["deleted_at"] else None,
            )

    # POST
    @rpc(Unicode, Integer, Integer, Unicode, _returns=Unicode)
    def add_book(ctx, title, author_id, publication_year, genre):
        new_id = BookRepository.insert(title, author_id, publication_year, genre)
        return f"Inserted book with ID {new_id}" if new_id else "Failed to insert book"

    # PUT
    @rpc(Integer, Unicode, Integer, Integer, Unicode, _returns=Unicode)
    def update_book(ctx, book_id, title, author_id, publication_year, genre):
        affected = BookRepository.update(book_id, title, author_id, publication_year, genre)
        return "OK" if affected else "FAIL"

    # DELETE
    @rpc(Integer, _returns=Unicode)
    def delete_book(ctx, book_id):
        affected = BookRepository.delete(book_id)
        return "OK" if affected else "FAIL"


# SOAP application
application = Application(
    [BookSoapService],
    tns='soap.demo',
    in_protocol=Soap11(),
    out_protocol=Soap11()
)

if __name__ == "__main__":
    from wsgiref.simple_server import make_server

    wsgi_app = WsgiApplication(application)
    server = make_server("127.0.0.1", 8000, wsgi_app)
    print("SOAP service running on http://127.0.0.1:8000")
    print("WSDL available at http://127.0.0.1:8000/?wsdl")
    server.serve_forever()
