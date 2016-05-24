#include <bits/stdc++.h>
#include <windows.h>
#include <sql.h>
#include <sqlext.h>
#include <sqltypes.h>
using namespace std;
 
void sqlExecute(SQLHDBC *dbc, char command[])
{
    SQLHSTMT stmt;
    SQLRETURN ret;
    SQLAllocHandle(SQL_HANDLE_STMT, (*dbc), &stmt);
    ret = SQLExecDirect(stmt,(SQLCHAR *)command,SQL_NTS);
}

void selecao(SQLHDBC *dbc,char command[]){
    strcat(command,"SELECT * FROM ceps WHERE ");
    char condicao[500];
    scanf("%[^\n]s",condicao);
    strcat(command, condicao);

    SQLHSTMT stmt;
    SQLRETURN ret;
    SQLLEN indicator[ 2 ];
    SQLLEN cep;
    SQLCHAR rua[30]="";
    stmt=NULL;
    SQLAllocHandle(SQL_HANDLE_STMT, (*dbc), &stmt);
    ret = SQLBindCol(stmt,1,SQL_C_LONG,&cep,0,&indicator[0]);
    ret = SQLBindCol(stmt,2,SQL_C_CHAR,rua,sizeof(rua),&indicator[1]);
    ret = SQLExecDirect(stmt,(SQLCHAR *)command,SQL_NTS);

    while((ret = SQLFetch(stmt)) != SQL_NO_DATA){
        printf("CEP: %d \tRUA:%s\n",cep, rua);
        count++;
    }
    cout<< "Numero de linhas retornadas: "<< count<<endl; 
}
 
int main(){
    SQLHENV env;
    SQLHDBC dbc;
    SQLHSTMT stmt;
    SQLRETURN ret;
 
    /* Aloca um handle do tipo environment */
     SQLAllocHandle(SQL_HANDLE_ENV, SQL_NULL_HANDLE, &env);
 
    /* Seta o ambiente para oferecer suporte a ODBC 3 */
    SQLSetEnvAttr(env, SQL_ATTR_ODBC_VERSION, (void *) SQL_OV_ODBC3, 0);
 
    /* Aloca um handle do tipo connection */
    SQLAllocHandle(SQL_HANDLE_DBC, env, &dbc);
 
    /* Conecta ao DSN chamado "Teste"*/
    /* Mude "Teste" para o nome do DNS que você já criou*/
    SQLDriverConnect(dbc, NULL, (SQLCHAR*)"DSN=Teste;", SQL_NTS, NULL, 0, NULL, SQL_DRIVER_COMPLETE);


    cout<<"O que deseja fazer no banco de dados?"<<endl<< "1 - Insercao"<<endl<< "2 - Atualizacao"<<endl<< "3 - Remocao"<<endl<< "4 - Selecao em funcionario"<<endl;
    int op;
    cin>> op; cin.ignore();
    char command[1000]= "";
    
    if(op == 1 || op == 2 || op == 3){
        cout<<"Insira o comando SQL"<<endl;
        scanf("%[^\n]s",command);
        sqlExecute(&dbc, command);
    }
    else {
        cout<< "Insira a condicao de selecao"<<endl;
        selecao(&dbc,command);
    }

    return 0;
}