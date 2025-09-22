from zeep import Client, exceptions

# WSDL endpoint
WSDL = "http://127.0.0.1:8000/?wsdl"
client = Client(wsdl=WSDL)

def safe_call(func, *args):
    """Helper wrapper to catch SOAP errors."""
    try:
        return func(*args)
    except exceptions.Fault as fault:
        print(f"❌ SOAP Fault: {fault}")
    except exceptions.TransportError as e:
        print(f"❌ Transport error: {e}")
    except Exception as ex:
        print(f"❌ Unexpected error: {ex}")


# CREATE
print("Adding new book...")
result = safe_call(
    client.service.add_book,
    "Clean Code",          # title
    1,                     # author_id (FK to tb_authors)
    2008,                  # publication_year
    "Software Engineering" # genre
)
print("✅ Add Book Response:", result)


# READ
print("Books in database:")
books = safe_call(client.service.get_books)
if books:
    for book in books:
        print(
            f"ID: {book.book_id} | "
            f"Title: {book.title} | "
            f"Author ID: {book.author_id} | "
            f"Year: {book.publication_year} | "
            f"Genre: {book.genre}"
        )
else:
    print("No books found.")


# UPDATE
print("Updating book ID 1...")
update_result = safe_call(
    client.service.update_book,
    12,                               # book_id
    "Clean Code (2nd Edition)",       # new title
    1,                                # author_id (keep same)
    2021,                             # new publication_year
    "Software Engineering (Updated)"  # new genre
)
print("Update Response:", update_result)


books = safe_call(client.service.get_books)
if books:
    for book in books:
        print(
            f"ID: {book.book_id} | "
            f"Title: {book.title} | "
            f"Author ID: {book.author_id} | "
            f"Year: {book.publication_year} | "
            f"Genre: {book.genre}"
        )
else:
    print("No books found.")

# DELETE
print("Deleting book ID 2...")
delete_result = safe_call(client.service.delete_book, 2)
print("Delete Response:", delete_result)
