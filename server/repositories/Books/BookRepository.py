from config.db import get_connection


class BookRepository:
    @staticmethod
    def fetch_all():
        conn = get_connection()
        try:
            cursor = conn.cursor(dictionary=True)
            cursor.execute("""
                SELECT
                    book_id, title, author_id, publication_year, genre,
                    created_at, updated_at, deleted_at
                FROM tb_books
                WHERE deleted_at IS NULL
            """)
            rows = cursor.fetchall()
            return rows if rows else []
        finally:
            cursor.close()
            conn.close()

    @staticmethod
    def insert(title, author_id, publication_year, genre):
        conn = get_connection()
        try:
            cursor = conn.cursor()
            query = """
                INSERT INTO tb_books (title, author_id, publication_year, genre)
                VALUES (%s, %s, %s, %s)
            """
            cursor.execute(query, (title, author_id, publication_year, genre))
            conn.commit()
            return cursor.lastrowid if cursor.lastrowid else None
        finally:
            cursor.close()
            conn.close()

    @staticmethod
    def update(book_id, title, author_id, publication_year, genre):
        conn = get_connection()
        try:
            cursor = conn.cursor()
            query = """
                UPDATE tb_books
                SET title=%s, author_id=%s, publication_year=%s, genre=%s, updated_at=NOW()
                WHERE book_id=%s AND deleted_at IS NULL
            """
            cursor.execute(query, (title, author_id, publication_year, genre, book_id))
            conn.commit()
            return cursor.rowcount
        finally:
            cursor.close()
            conn.close()

    @staticmethod
    def delete(book_id):
        """Soft delete (set deleted_at), not hard delete"""
        conn = get_connection()
        try:
            cursor = conn.cursor()
            query = """
                UPDATE tb_books
                SET deleted_at = NOW()
                WHERE book_id=%s AND deleted_at IS NULL
            """
            cursor.execute(query, (book_id,))
            conn.commit()
            return cursor.rowcount
        finally:
            cursor.close()
            conn.close()
