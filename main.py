from src.services import database_services
from src.services import writer_services
import pymysql

if __name__ == "__main__":

    print("Bem vindo a solução de Catálogo de Dados da Venha Pra Nuvem")

    option = input("Pressione ENTER para continuar ou qualquer outra tecla para sair.... ")
    if option == '':
        conn = database_services.connect_to_database()

        try:
            tables = database_services.extract_tables_from_database(conn)
            columns = database_services.extract_columns_from_tables(conn, tables)
            
        finally:
            database_services.close_connection(conn)
    else:
        print("Encerrando o programa.")
 