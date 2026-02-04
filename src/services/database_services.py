
import pymysql
from pymysql import Error

def connect_to_database(
    host="localhost",
    user="root",
    password="dados123",
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
            print("✅ Conexão com MySQL fechada com sucesso!")
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

        print("Tabelas no banco de dados:")
        for table in tables:    
            print(f"- {table[0]}")
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
            cursor.execute(f"SHOW COLUMNS FROM {table_name};")
            columns = cursor.fetchall()

            print(f"Colunas na tabela {table_name}:")
            columns_data[table_name] = columns
            for column in columns:
                print(f"- {column[0]}")

    except Error as e:
        print(f"❌ Erro ao extrair colunas: {e}")
        raise
    except Exception as e:
        print(f"❌ Erro inesperado ao extrair colunas: {e}")
        raise
    
    return columns_data