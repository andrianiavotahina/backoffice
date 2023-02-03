package Model;

import Base.FonctionBase;

import java.util.Date;
import java.util.Vector;

public class Enchere {
    int etat;
    String nomUtilisateur,nomCategorie,nomProduit,about;
    Date dateFin;
    double prixMin;

    public static Vector<Enchere>liste(int etat) throws Exception {
        String sql="select etat,nomUtilisateur,dateFin,nomCategorie,nomProduit,about,prixMin from vente where etat="+etat+" order by dateFin";
        Vector<Enchere> encheres=new Vector<>();
        Vector<Object>[]all= FonctionBase.select(sql);
        for (int i = 0; i <all[0].size() ; i++) {
            //int etat, String nomUtilisateur, String nomCategorie, String nomProduit, String about, Date dateFin,double prixMin
            Enchere enchere=new Enchere(etat,(String) all[1].elementAt(i),(String)all[3].elementAt(i),(String)all[4].elementAt(i),(String) all[5].elementAt(i), (Date) all[2].elementAt(i),(Double) all[6].elementAt(i));
            encheres.add(enchere);
        }
        return encheres;
    }

    public static void update(int values) throws Exception {
        String sql="update durre set tempsSec="+values;
        FonctionBase.modifBase(sql);
    }

    public static void updateCommission(double values) throws Exception {
        /*String sql="update commision set valeur="+values;
        FonctionBase.modifBase(sql);*/
        ConnecteMongo mongo=new ConnecteMongo();
        mongo.update(values);
    }
    public static double getCommission() throws Exception {
        /*String sql="select valeur from commision";
        Vector<Object>[]getValue=FonctionBase.select(sql);
        if (getValue[0].size()==0){
            return 0;
        }
        return (double) getValue[0].elementAt(0);*/
        ConnecteMongo mongo=new ConnecteMongo();
        return mongo.SelectComission();
    }

    public Enchere(int etat, String nomUtilisateur, String nomCategorie, String nomProduit, String about, Date dateFin,double prixMin) {
        this.etat = etat;
        this.nomUtilisateur = nomUtilisateur;
        this.nomCategorie = nomCategorie;
        this.nomProduit = nomProduit;
        this.about = about;
        this.dateFin = dateFin;
        this.prixMin=prixMin;
    }

    public double getPrixMin() {
        return prixMin;
    }

    public void setPrixMin(double prixMin) {
        this.prixMin = prixMin;
    }

    public int getEtat() {
        return etat;
    }

    public void setEtat(int etat) {
        this.etat = etat;
    }

    public String getNomUtilisateur() {
        return nomUtilisateur;
    }

    public void setNomUtilisateur(String nomUtilisateur) {
        this.nomUtilisateur = nomUtilisateur;
    }

    public String getNomCategorie() {
        return nomCategorie;
    }

    public void setNomCategorie(String nomCategorie) {
        this.nomCategorie = nomCategorie;
    }

    public String getNomProduit() {
        return nomProduit;
    }

    public void setNomProduit(String nomProduit) {
        this.nomProduit = nomProduit;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public Date getDateFin() {
        return dateFin;
    }

    public void setDateFin(Date dateFin) {
        this.dateFin = dateFin;
    }
}
