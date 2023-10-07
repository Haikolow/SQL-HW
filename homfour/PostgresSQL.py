import psycopg2

def create_db(conn):
    with conn.cursor() as cur:
        cur.execute('''
            CREATE TABLE IF NOT EXISTS clients (
                id serial PRIMARY KEY,
                first_name varchar(50) NOT NULL,
                last_name varchar(50) NOT NULL,
                email varchar(100),
                phones text[]
            );
        ''')
    conn.commit()

def add_client(conn, first_name, last_name, email, phones=None):
    with conn.cursor() as cur:
        cur.execute('''
            INSERT INTO clients (first_name, last_name, email, phones)
            VALUES (%s, %s, %s, %s);
        ''', (first_name, last_name, email, phones))
    conn.commit()

def add_phone(conn, client_id, phone):
    with conn.cursor() as cur:
        cur.execute('''
            UPDATE clients
            SET phones = array_append(phones, %s)
            WHERE id = %s;
        ''', (phone, client_id))
    conn.commit()

def change_client(conn, client_id, first_name=None, last_name=None, email=None, phones=None):
    update_fields = []
    if first_name:
        update_fields.append(f'first_name = \'{first_name}\'')
    if last_name:
        update_fields.append(f'last_name = \'{last_name}\'')
    if email:
        update_fields.append(f'email = \'{email}\'')
    if phones:
        update_fields.append(f'phones = \'{phones}\'')

    if update_fields:
        update_query = 'UPDATE clients SET ' + ', '.join(update_fields) + f' WHERE id = {client_id};'
        with conn.cursor() as cur:
            cur.execute(update_query)
        conn.commit()

def delete_phone(conn, client_id, phone):
    with conn.cursor() as cur:
        cur.execute('''
            UPDATE clients
            SET phones = array_remove(phones, %s)
            WHERE id = %s;
        ''', (phone, client_id))
    conn.commit()

def delete_client(conn, client_id):
    with conn.cursor() as cur:
        cur.execute('DELETE FROM clients WHERE id = %s;', (client_id,))
    conn.commit()

def find_client(conn, first_name=None, last_name=None, email=None, phone=None):
    with conn.cursor() as cur:
        cur.execute('''
            SELECT * FROM clients
            WHERE first_name = %s OR last_name = %s OR email = %s OR %s = ANY(phones);
        ''', (first_name, last_name, email, phone))
        return cur.fetchall()

with psycopg2.connect(database="", user="", password="") as conn:
    create_db(conn)
    # add_client(conn, "Питер", "Паркер", "piter@mail.com")
    # add_client(conn, "Гарри", "Озборн", "garry@mail.com")
    # add_client(conn, "Мэри", "Джейн", "meri@mail.com")
    # add_client(conn, "Отто", "Гюнтер", "otto@mail.com")
    # add_phone(conn, 4, '555-111-555')
    # change_client(conn, 1, email="parker@mail.com")
    # delete_phone(conn, 4, '555-888-555')
    # find_results = find_client(conn, first_name="Питер")
    # print(find_results)
    # delete_client(conn, 3)

conn.close()