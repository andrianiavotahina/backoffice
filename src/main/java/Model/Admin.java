package Model;

import Base.FonctionBase;

import java.util.Vector;

public class Admin {
    String login,pwd;
    int idAdmin;

    public Admin(String login, String pwd, int idAdmin) {
        this.login = login;
        this.pwd = pwd;
        this.idAdmin = idAdmin;
    }

    public Admin() {
    }

    public int login(String login, String pwd) throws Exception {
        String sql="select idAdmin from admin where login='%s' and pwd='%s'";
        sql=String.format(sql,login,pwd);
        Vector<Object>[]idAdmin= FonctionBase.select(sql);
        if (idAdmin[0].size()!=1){
            return -100;
        }
        return (int) idAdmin[0].elementAt(0);
    }
}
