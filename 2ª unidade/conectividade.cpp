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
    strcat(command,"SELECT * FROM produtora WHERE ");
    char condicao[500];
    scanf("%[^\n]s",condicao);
    strcat(command, condicao);

    int count = 0;
    SQLHSTMT stmt;
    SQLRETURN ret;
    SQLLEN indicator[ 4 ];
    SQLLEN cnpj;
    SQLLEN cep;
    SQLCHAR nome[50]="";
    SQLCHAR comp[50]="";
    stmt=NULL;
    SQLAllocHandle(SQL_HANDLE_STMT, (*dbc), &stmt);
    ret = SQLBindCol(stmt,1,SQL_C_LONG,&cnpj,0,&indicator[0]);
    ret = SQLBindCol(stmt,2,SQL_C_CHAR,nome,sizeof(nome),&indicator[1]);
    ret = SQLBindCol(stmt,1,SQL_C_LONG,&cep,0,&indicator[2]);
    ret = SQLBindCol(stmt,2,SQL_C_CHAR,comp,sizeof(comp),&indicator[3]);
    ret = SQLExecDirect(stmt,(SQLCHAR *)command,SQL_NTS);
    while((ret=SQLFetch(stmt)) != SQL_NO_DATA){
        printf("CNPJ: %d \t Nome: %s \tCEP: %d \t Complemento: %s\n", cnpj, nome, cep, comp);
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

    while(1){
        cout<<"O que deseja fazer no banco de dados?"<<endl<< "1 - Insercao"<<endl<< "2 - Atualizacao"<<endl<< "3 - Remocao"<<endl<< "4 - Selecao em funcionario"<<endl<< "5 - Exit"<<endl;
        int op;
        cin>> op; cin.ignore();
        char command[1000]= "";
        
        if(op == 1 || op == 2 || op == 3){
            cout<<"Insira o comando SQL"<<endl;
            scanf("%[^\n]s",command);
            sqlExecute(&dbc, command);
        }
        else if(op == 5) break;
        else {
            cout<< "Insira a condicao de selecao em produtora"<<endl;
            selecao(&dbc,command);
        }
    }

    return 0;
}