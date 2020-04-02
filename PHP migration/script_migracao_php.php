<?php

function execute_migration(){
    $museu_db_name = "museuphp";
    $auditoria_db_name = "auditoriaphp";
    $connection_to_museu_db = connect_to_sql_server($museu_db_name); //conecta-se à bd museuphp
    $table_list_in_db = array_column(mysqli_fetch_all($connection_to_museu_db->query('SELECT DISTINCT TABLE_NAME FROM INFORMATION_SCHEMA.tables 
                                        WHERE TABLE_NAME LIKE \'log_%\'')),0); // vai buscar os nomes das tabelas de logs
    $connection_to_auditoria_db = connect_to_sql_server($auditoria_db_name); // conecta-se à bd auditoriaphp
    prepare_table_migration($table_list_in_db,$connection_to_museu_db, $connection_to_auditoria_db);

    disconnect_from_sql_server($connection_to_museu_db);
    disconnect_from_sql_server($connection_to_auditoria_db);

}
function prepare_table_migration($table_names, $connection_to_museu_db, $connection_to_auditoria_db){
    foreach ($table_names as $table){ //para cada tabela vai fazer um insert into com os valores que vai buscar
        $table_contents = get_logs_from_table($table, $connection_to_museu_db); //vetor com todas as linhas da tabela atual
        $sql_statement_fetch_columns = "SELECT DISTINCT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = '".$table."';"; //query para ir buscar as colunas da tabela atual
        $sql_query_fetch_columns = array_column(mysqli_fetch_all($connection_to_museu_db->query($sql_statement_fetch_columns)),0);
        migrate_table_contents($table_contents,$table,$sql_query_fetch_columns, $connection_to_auditoria_db, $connection_to_museu_db);


    }
}
function migrate_table_contents($table_row_values, $table_to_migrate, $table_column_names, $connection_to_auditoria_db, $connection_to_museu_db){
    for ($j=0 ; $j < count($table_row_values); $j++) { //por cada linha vai atualizar a statement insert into com cada nome de coluna e valores
        $sql_statement_insert_into_table = "INSERT INTO " . $table_to_migrate . "(";
        $sql_statement_insert_into_table = append_column_names_to_sql_statement($table_column_names, $sql_statement_insert_into_table);
        $sql_statement_insert_into_table .= " VALUES(";
        $sql_statement_insert_into_table = append_column_values_to_sql_statement($table_column_names, $sql_statement_insert_into_table, $table_row_values, $j);
        $sql_query_insert_into = mysqli_query($connection_to_auditoria_db, $sql_statement_insert_into_table);
        confirm_migration($sql_query_insert_into,$table_to_migrate,$table_row_values,$j,$connection_to_museu_db);
    }
}
function append_column_names_to_sql_statement($column_names, $sql_statement_to_append){
    for ($i = 0; $i < count($column_names); $i++) { //percorrer lista de colunas para adicionar o nome das colunas ao insert
        if ($i == count($column_names) - 2){
            $sql_statement_to_append .= $column_names[$i] . ") ";
            break;
        }
        else
            $sql_statement_to_append .= $column_names[$i] . ", ";
    }
    return $sql_statement_to_append;
}
function append_column_values_to_sql_statement($column_names, $sql_statement_to_append, $row_values, $row_index){
    for ($i = 0; $i < count($column_names); $i++) { // percorrer as colunas para adicionar os valores respetivos no sítio certo
        if ($i == count($column_names)-2) {
            $sql_statement_to_append .= "'" . $row_values[$row_index][$column_names[$i]] . "');";
            break;
        }
        else
            $sql_statement_to_append .= "'".$row_values[$row_index][$column_names[$i]]."', ";
    }
    return $sql_statement_to_append;
}
function confirm_migration($query_result, $table_migrated, $row_values, $row_index, $connection_to_museu_db){
    if ($query_result) {
        $sql_statement_update_log = "UPDATE ".$table_migrated." SET Migrado = 1 WHERE id = ".$row_values[$row_index]['id'].";";
        mysqli_query($connection_to_museu_db, $sql_statement_update_log);
        finish_migration_log($connection_to_museu_db, $table_migrated);
        return true;
    }
    return false;
}
function get_column_name_with_index($index, $column_vector){
    return $column_vector[$index];
}
function connect_to_sql_server($database_name){
    $url="127.0.0.1";
    $database=$database_name;
    $username="root";
    $password="teste";
    $conn = mysqli_connect($url, $username, $password, $database);
    if (!$conn){
        die ("Connection Failled: ".$conn->connect_error);
    }
    return $conn;
}
function disconnect_from_sql_server($sql_connection){
    mysqli_close($sql_connection);
}
function get_logs_from_table($table_name, $connection){
    $sql_statement = "SELECT * FROM ".$table_name." WHERE Migrado = 0;";
    $sql_query = mysqli_query($connection, $sql_statement);
    $table_rows = array();
    if ($sql_query) {
        if (mysqli_num_rows($sql_query)>0){
            while($row=mysqli_fetch_assoc($sql_query)){
                array_push($table_rows, $row);
            }
        }
    }
    return $table_rows;
}
function finish_migration_log($sql_connection, $table){
    $sql_statement_migration_log = "UPDATE Migracoes SET migrado = 1 WHERE dataHora <= NOW() AND tabelaEmMigracao = '".$table."' AND migrado = 0;";
    mysqli_query($sql_connection, $sql_statement_migration_log);
}
execute_migration();
