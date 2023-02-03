package Model;

import Base.FonctionBase;

import java.util.Vector;

public class Categorie {
    int idCategories;
    String nomCategorie;

    public Categorie(int idCategories,String nomCategorie) {
        this.nomCategorie = nomCategorie;
        this.idCategories=idCategories;
    }

    public Categorie() {
    }

    public int getIdCategories() {
        return idCategories;
    }

    public void setIdCategories(int idCategories) {
        this.idCategories = idCategories;
    }

    public String getNomCategorie() {
        return nomCategorie;
    }

    public void setNomCategorie(String nomCategorie) {
        this.nomCategorie = nomCategorie;
    }


    public static Vector<Categorie>getAll() throws Exception {
        String sql="select idCategories,nomCategorie from categories where etat=false";
        Vector<Object>[]all=FonctionBase.select(sql);
        Vector<Categorie> categories=new Vector<>();
        for (int i = 0; i < all[0].size(); i++) {
            Categorie categorie=new Categorie((int)all[0].elementAt(i),(String) all[1].elementAt(i));
            categories.add(categorie);
        }
        return categories;
    }
    public static Categorie getOnce(int id){
        return new Categorie();
    }
    public static void insert(String nomCategorie) throws Exception {
        String sql="insert into categories(nomCategorie) VALUES ('%s')";
        sql=String.format(sql,nomCategorie);
        FonctionBase.modifBase(sql);
    }
    public static void update(int id,String nomCategorie) throws Exception {
        String sql="update categories set nomCategorie='%s' where idCategories="+id;
        sql=String.format(sql,nomCategorie);
        FonctionBase.modifBase(sql);
    }
    public static void delete(String id) throws Exception {
        String sql="update categories set etat=true where idCategories="+id;
        FonctionBase.modifBase(sql);
    }
    public static int getDure() throws Exception {
        String sql="select tempsSec from durre";
        Vector<Object>[]va=FonctionBase.select(sql);
        if (va[0].size()==0){
            return 0;
        }else {
            return (int) va[0].elementAt(0);
        }
    }
}
