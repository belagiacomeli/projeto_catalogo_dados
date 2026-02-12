import pymysql
from pymysql import Error

def connect_to_database(
    host="localhost",
    user="root",
    password="Izabela20",
    database="catalogo_dados"
):
    try:
        print("Conectando ao MySQL...")
        conn = pymysql.connect(
            host=host,
            user=user,
            password=password,
            database=database,
            connect_timeout=5
        )
        if conn:
            print("✅ Conexão com MySQL realizada com sucesso!")
            return conn
        else:
            raise Exception("❌ Não foi possível verificar a conexão com o banco de dados")

    except Error as e:
        print(f"❌ Erro ao conectar ao MySQL: {e}")
        raise Exception(f"❌ Erro ao conectar ao MySQL: {e}")
    except Exception as e:
        print(f"❌ Erro inesperado: {e}")
        raise

def close_connection(conn):
    """Fecha a conexão com o banco de dados"""
    try:
        if conn:
            conn.close()
            print("\n\n✅ Conexão com MySQL fechada com sucesso!")
    except Error as e:
        print(f"❌ Erro ao fechar a conexão: {e}")
    except Exception as e:
        print(f"❌ Erro inesperado ao fechar conexão: {e}")

def extract_tables_from_database(conn):
    """Extrai as tabelas do banco de dados e imprime seus nomes"""
    try:
        if not conn:
            raise Exception("Conexão com o banco de dados não estabelecida.")

        cursor = conn.cursor()
        cursor.execute("SHOW TABLES;")
        tables = cursor.fetchall()

        print("\nTabelas no banco de dados:")
        for table in tables:
            print(f"- {table[0]}")
        print("\n\n")
        return tables

    except Error as e:
        print(f"❌ Erro ao extrair tabelas: {e}")
        raise
    except Exception as e:
        print(f"❌ Erro inesperado ao extrair tabelas: {e}")
        raise

def extract_columns_from_tables(conn, tables):
    """Extrai as colunas de cada tabela e imprime seus nomes"""
    columns_data = {}
    try:
        if not conn:
            raise Exception("Conexão com o banco de dados não estabelecida.")

        cursor = conn.cursor()

        for table in tables:
            table_name = table[0]

            # Igual ao dele, mas com proteção usando crase (recomendado)
            cursor.execute(f"SHOW COLUMNS FROM `{table_name}`;")
            columns = cursor.fetchall()

            columns_data[table_name] = columns

    except Error as e:
        print(f"❌ Erro ao extrair colunas: {e}")
        raise
    except Exception as e:
        print(f"❌ Erro inesperado ao extrair colunas: {e}")
        raise

    predefined_columns = [
        "endereco", "cep", "email", "e-mail", "telefone",
        "nome_completo", "cpf", "rua", "numero_documento"
    ]

    return filter_columns_by_list(columns_data, predefined_columns)

def filter_columns_by_list(columns_data, predefined_columns):
    """
    Filtra as colunas de cada tabela retornando apenas aquelas que estão na lista pré-definida
    """
    try:
        filtered_columns = {}

        for table_name, columns in columns_data.items():
            # Extrai apenas o nome da coluna (primeiro elemento da tupla)
            column_names = [column[0] for column in columns]

            # Filtra apenas as colunas que estão na lista pré-definida
            matched_columns = [col for col in column_names if col.lower() in predefined_columns]

            if matched_columns:
                filtered_columns[table_name] = matched_columns
                print(f"Colunas sensíveis encontradas na tabela {table_name}: {matched_columns}")
            else:
                print(f"Nenhuma coluna sensível encontrada na tabela {table_name}")

        return filtered_columns

    except Exception as e:
        print(f"❌ Erro ao filtrar colunas: {e}")
        raise
