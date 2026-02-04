import yaml
import pymysql
from pathlib import Path
from typing import Dict, List, Any, Optional

class WriterService:
    """Serviço para escrita e leitura de arquivos YAML do catálogo de dados"""
    
    def __init__(self, file_path: str = 'catalogo_dados.yaml', db_config: Optional[Dict[str, Any]] = None):
        self.file_path = Path(file_path)
        self.db_config = db_config or {
            'host': 'localhost',
            'user': 'catalogo_user',
            'password': 'catalogo123',
            'database': 'catalogo_dados',
            'port': 3307,
            'charset': 'utf8mb4',
            'cursorclass': pymysql.cursors.DictCursor
        }
    
    def _get_db_connection(self):
        """Cria conexão com o banco de dados"""
        try:
            connection = pymysql.connect(**self.db_config)
            return connection
        except pymysql.Error as e:
            print(f"❌ Erro ao conectar ao banco de dados: {e}")
            raise
    
    def write_catalog(self, data: Optional[Dict[str, Any]] = None) -> None:
        """
        Escreve o catálogo de dados em arquivo YAML formatado
        
        Args:
            data: Dicionário contendo 'tables' e 'columns'
        """
        try:
            tables = data.get('tables', []) if data else []
            columns = data.get('columns', {}) if data else {}
            
            catalog = self._build_catalog(tables, columns)
            
            with open(self.file_path, 'w', encoding='utf-8') as file:
                yaml.dump(
                    catalog,
                    file,
                    default_flow_style=False,
                    allow_unicode=True,
                    sort_keys=False
                )
            
            print(f"✅ Catálogo escrito com sucesso em {self.file_path}")
        
        except Exception as e:
            print(f"❌ Erro ao escrever catálogo: {e}")
            raise
    
    def _build_catalog(self, tables: List[tuple], columns: Optional[Dict[str, List[tuple]]]) -> Dict[str, Any]:
        """Constrói a estrutura do catálogo com informações detalhadas"""
        catalog = {
            'metadata': {
                'version': '1.0',
                'description': 'Catálogo de Dados - Documentação de Tabelas e Colunas'
            },
            'tables': []
        }
        
        # Validar se columns é None
        if columns is None:
            columns = {}
        
        for table in tables:
            table_name = table[0]
            table_columns = columns.get(table_name, [])
            
            table_data = {
                'name': table_name,
                'description': 'Descrição da tabela',
                'owner': 'Nome do responsável',
                'sensitivity_score': 0,  # 0: Pública, 1: Interna, 2: Confidencial, 3: Restrita
                'sensitivity_level': 'PUBLICA',  # PUBLICA, INTERNA, CONFIDENCIAL, RESTRITA
                'columns': self._build_columns(table_columns)
            }
            catalog['tables'].append(table_data)
        
        return catalog
    
    def _build_columns(self, table_columns: List[tuple]) -> List[Dict[str, Any]]:
        """Constrói a lista de colunas com informações detalhadas"""
        columns_list = []
        
        for col in table_columns:
            column_name = col[0]
            column_type = col[1]
            column_null = col[2]
            column_key = col[3]
            
            column_data = {
                'name': column_name,
                'data_type': column_type,
                'description': 'Descrição da coluna',
                'is_nullable': True if column_null == 'YES' else False,
                'is_primary_key': True if column_key == 'PRI' else False,
                'is_sensitive': False,  # True se contém dados sensíveis
                'sensitivity_level': 'PUBLICA'  # PUBLICA, INTERNA, CONFIDENCIAL, RESTRITA
            }
            columns_list.append(column_data)
        
        return columns_list
    
    def read_catalog(self) -> Dict[str, Any]:
        """
        Lê o catálogo de dados do arquivo YAML
        
        Returns:
            Dicionário com o conteúdo do catálogo
        """
        try:
            if not self.file_path.exists():
                print(f"⚠️ Arquivo {self.file_path} não encontrado")
                return {}
            
            with open(self.file_path, 'r', encoding='utf-8') as file:
                catalog = yaml.safe_load(file) or {}
            
            print(f"✅ Catálogo lido com sucesso de {self.file_path}")
            return catalog
        
        except Exception as e:
            print(f"❌ Erro ao ler catálogo: {e}")
            raise
    
    def _populate_tables(self, catalog: Dict[str, Any]) -> None:
        """Popula a tabela 'tabelas' do banco de dados"""
        connection = self._get_db_connection()
        
        try:
            with connection.cursor() as cursor:
                for table in catalog.get('tables', []):
                    query = """
                        INSERT INTO tabelas_catalogo
                        (nome, descricao, owner, sensitivity_score, sensitivity_level, criado_em, atualizado_em)
                        VALUES (%s, %s, %s, %s, %s, NOW(), NOW())
                        ON DUPLICATE KEY UPDATE
                        descricao = VALUES(descricao),
                        owner = VALUES(owner),
                        sensitivity_score = VALUES(sensitivity_score),
                        sensitivity_level = VALUES(sensitivity_level),
                        atualizado_em = NOW()
                    """
                    
                    values = (
                        table['name'],
                        table.get('description', ''),
                        table.get('owner', ''),
                        table.get('sensitivity_score', 0),
                        table.get('sensitivity_level', 'PUBLICA')
                    )
                    
                    cursor.execute(query, values)
                
                connection.commit()
                print(f"✅ {cursor.rowcount} tabelas inseridas/atualizadas com sucesso")
        
        except pymysql.Error as e:
            connection.rollback()
            print(f"❌ Erro ao inserir tabelas: {e}")
            raise
        
        finally:
            connection.close()
    
    def _populate_columns(self, catalog: Dict[str, Any]) -> None:
        """Popula a tabela 'colunas' do banco de dados"""
        connection = self._get_db_connection()
        
        try:
            with connection.cursor() as cursor:
                for table in catalog.get('tables', []):
                    # Primeiro, obter o ID da tabela
                    get_table_id = "SELECT id_tabela FROM tabelas_catalogo WHERE nome = %s"
                    cursor.execute(get_table_id, (table['name'],))
                    result = cursor.fetchone()
                    
                    if not result:
                        print(f"⚠️ Tabela '{table['name']}' não encontrada no banco de dados")
                        continue
                    
                    table_id = result['id_tabela'] if isinstance(result, dict) else result[0]
                    
                    # Inserir colunas
                    for column in table.get('columns', []):
                        query = """
                            INSERT INTO colunas_catalogo 
                            (id_tabela, nome, data_type, descricao, is_nullable, is_primary_key, is_sensitive, sensitivity_level, criado_em, atualizado_em)
                            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, NOW(), NOW())
                            ON DUPLICATE KEY UPDATE
                            data_type = VALUES(data_type),
                            descricao = VALUES(descricao),
                            is_nullable = VALUES(is_nullable),
                            is_primary_key = VALUES(is_primary_key),
                            is_sensitive = VALUES(is_sensitive),
                            sensitivity_level = VALUES(sensitivity_level),
                            atualizado_em = NOW()
                        """
                        
                        values = (
                            table_id,
                            column['name'],
                            column['data_type'],
                            column.get('description', ''),
                            column.get('is_nullable', True),
                            column.get('is_primary_key', False),
                            column.get('is_sensitive', False),
                            column.get('sensitivity_level', 'PUBLICA')
                        )
                        
                        cursor.execute(query, values)
                
                connection.commit()
                print(f"✅ Colunas inseridas/atualizadas com sucesso")
        
        except pymysql.Error as e:
            connection.rollback()
            print(f"❌ Erro ao inserir colunas: {e}")
            raise
        
        finally:
            connection.close()
    
    def print_catalog(self) -> None:
        """Imprime o catálogo de forma legível"""
        catalog = self.read_catalog()
        
        if not catalog.get('tables'):
            print("Nenhuma tabela encontrada no catálogo")
            return
        
        print("\n" + "="*70)
        print("📋 CATÁLOGO DE DADOS")
        print("="*70)
        
        for table in catalog['tables']:
            print(f"\n📊 Tabela: {table['name']}")
            print(f"   Descrição: {table['description']}")
            print(f"   👤 Responsável: {table['owner']}")
            print(f"   🔒 Nível de Sensibilidade: {table['sensitivity_level']} (Score: {table['sensitivity_score']})")
            
            if table.get('columns'):
                print(f"   📋 Colunas ({len(table['columns'])} total):")
                for col in table['columns']:
                    sensitive_marker = "🔒" if col['is_sensitive'] else "  "
                    pk_marker = "🔑" if col['is_primary_key'] else "  "
                    nullable = "✓" if col['is_nullable'] else "✗"
                    
                    print(f"      {sensitive_marker} {pk_marker} {col['name']}")
                    print(f"         └─ Tipo: {col['data_type']}")
                    print(f"         └─ Descrição: {col['description']}")
                    print(f"         └─ Sensível: {'Sim' if col['is_sensitive'] else 'Não'} | Nulo: {nullable}")


# Manter compatibilidade com código existente
def write_to_file(data: Optional[Dict[str, Any]] = None) -> None:
    """Função compatível com código anterior"""
    writer = WriterService()
    writer.write_catalog(data)


def read_from_file(db_config: Optional[Dict[str, Any]] = None) -> Dict[str, Any]:
    """
    Função compatível com código anterior
    Lê o arquivo YAML e popula as tabelas do banco de dados
    """
    writer = WriterService(db_config=db_config)
    catalog = writer.read_catalog()
    
    if catalog and catalog.get('tables'):
        writer._populate_tables(catalog)
        writer._populate_columns(catalog)
    
    return catalog