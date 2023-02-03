package Model;

import Base.FonctionBase;

import java.sql.Connection;
import java.util.Vector;

public class Statistique {
    String nom;
    double pourcentage;

    public Statistique(String nom, double pourcentage) {
        this.nom = nom;
        this.pourcentage = pourcentage;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public double getPourcentage() {
        return pourcentage;
    }

    public void setPourcentage(double pourcentage) {
        this.pourcentage = pourcentage;
    }

    public static Vector<Statistique>statistiqueCategorie(String sql,String sum) throws Exception {
        //String sql="select pourcentage,nomCategorie from statiqueCategorie";
        Vector<Statistique>valiny=new Vector<>();
        try(Connection connection=FonctionBase.connect()){
            Vector<Object>[]listeAll= FonctionBase.all(sql,connection);
            Vector<Object>[]sumPourcentage=FonctionBase.all(sum,connection);
            for (int i = 0; i <listeAll[0].size() ; i++) {
                double xs= (double) sumPourcentage[0].elementAt(0);
                double po= (double) listeAll[0].elementAt(i);
                Statistique statistique=new Statistique((String) listeAll[1].elementAt(i),(po*100)/xs);
                valiny.add(statistique);
            }
        }
        return valiny;
    }

    public static String statCategorie() throws Exception {
        String sql="select pourcentage,nomCategorie from statiqueCategorie";
        String sum="select sum(pourcentage) as tout from statiqueCategorie";
        Vector<Statistique>list=statistiqueCategorie(sql,sum);
        String rep="";
        int i=0;
        for (Statistique st : list){
            String form="[%s,%s]";
            rep=rep.concat(String.format(form,st.getPourcentage(),st.getNom()));
            if (i<=list.size()-2){
                rep=rep.concat(";");
            }
                i++;
        }
        return rep;
    }
    public static double getM() throws Exception{
        String sql="select sum(pourcentage) from statiqueCategorie";
        Vector<Object>[]all=FonctionBase.select(sql);
        if (all[0].size()==0){
            return 0;
        }
        return (double) all[0].elementAt(0);
    }
    public static double getC() throws Exception{
        String sql="select avg(pourcentage) from statiqueCategorie";
        Vector<Object>[]all=FonctionBase.select(sql);
        if (all[0].size()==0){
            return 0;
        }
        return (double) all[0].elementAt(0);
    }
}
