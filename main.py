from src.services import database_services
from src.services import writer_services
import pymysql

if __name__ == "__main__":

    print("Bem vindo a solução de Catálogo de Dados da Venha Pra Nuvem")
    print("Selecione a opção que deseja executar: ")
    print("2 - Extrair tabelas do banco de dados")
    print("3 - Preencher catálogo de dados em arquivo")

    option = int(input("Digite a opção desejada: "))

    if option == 2:
        conn = database_services.connect_to_database()
        print("Conexão estabelecida com sucesso!")
        try:
            tables = database_services.extract_tables_from_database(conn)
            columns = database_services.extract_columns_from_tables(conn, tables)
            writer_services.write_to_file(
                {
                    'tables': tables,
                    'columns': columns
                }
            )
        finally:
            database_services.close_connection(conn)
    elif option == 3:
        writer_services.read_from_file(db_config={
            'host': 'localhost',
            'user': 'root',
            'password': 'dados123',
            'database': 'catalogo_dados',
            'port': 3307,
            'charset': 'utf8mb4',
            'cursorclass': pymysql.cursors.DictCursor
        })
    else:
        print("Opção inválida. Por favor, selecione uma opção válida.")