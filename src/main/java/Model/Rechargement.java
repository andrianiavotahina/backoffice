package Model;

import Base.FonctionBase;

import java.util.Date;
import java.util.Vector;

public class Rechargement {
    int idRechargement;
    String idUtilisateur ;
    double montant ;
    Date dateRechargement ;
    int etat;

    public static Vector<Rechargement>nonvalider() throws Exception {
        Vector<Rechargement> rechargements=new Vector<>();
        String sql="select id_client,nomUtilisateur,montant,dateRechargement,etat from rechargementUser where etat=1";
        Vector<Object>[]list= FonctionBase.select(sql);
        for (int i = 0; i <list[0].size() ; i++) {
            Rechargement rechargement=new Rechargement((int)list[0].elementAt(i),(String) list[1].elementAt(i),(Double) list[2].elementAt(i),(Date) list[3].elementAt(i), (Integer) list[4].elementAt(i));
            rechargements.add(rechargement);
        }
        return rechargements;
    }

    public Rechargement(int idRechargement, String idUtilisateur, double montant, Date dateRechargement, int etat) {
        this.idRechargement = idRechargement;
        this.idUtilisateur = idUtilisateur;
        this.montant = montant;
        this.dateRechargement = dateRechargement;
        this.etat = etat;
    }

    public int getIdRechargement() {
        return idRechargement;
    }

    public String getIdUtilisateur() {
        return idUtilisateur;
    }

    public double getMontant() {
        return montant;
    }

    public Date getDateRechargement() {
        return dateRechargement;
    }

    public int getEtat() {
        return etat;
    }
    public static void update(int id) throws Exception {
        String sql="update rechargement set etat=2 where idRechargement="+id;
        FonctionBase.modifBase(sql);
    }
}
