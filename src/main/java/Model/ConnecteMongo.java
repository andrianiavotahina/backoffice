package Model;

import com.mongodb.BasicDBObject;
import com.mongodb.Cursor;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoDatabase;

/**
 *
 * @author USER
 */
public class ConnecteMongo {

    public DB Conn(){

        MongoClient mongoClient = new MongoClient( new MongoClientURI("mongodb://mongo:u2haywcKdtZPnyYVyqiJ@containers-us-west-169.railway.app:7802" ));
        System.out.println("server connection successfully done");

        //Connecting with database
        MongoDatabase dbs = mongoClient.getDatabase("test");
        System.out.println("Connect to database successfully");
        System.out.println("Database Name"+dbs.getName());
        DB db=mongoClient.getDB(dbs.getName());
        return db;
    }

    public double SelectComission(){
        double repo=0.;
        DB db=this.Conn();
        DBCollection d=db.getCollection("com");
        Cursor c=d.find();
        String rep="";
        while(c.hasNext()){
            rep=new String(c.next().get("vola").toString());
        }
        repo=Double.valueOf(rep);

        return repo;
    }

    public void update(double a){
        DB db=this.Conn();
        DBCollection d=db.getCollection("com");
        BasicDBObject upd=new BasicDBObject ();
        String aa=String.valueOf(a);
        double r=this.SelectComission();
        String rr=String.valueOf(r);
        upd.append("$set",new BasicDBObject ().append("vola",rr));
        BasicDBObject old=new BasicDBObject ();
        ConnecteMongo C=new ConnecteMongo();

        upd.append("$set",new BasicDBObject ().append("vola",aa));
        d.update(old,upd,false,false);
    }

    public static void main(String[] args) {
        ConnecteMongo mongo=new ConnecteMongo();
        System.out.println(mongo.SelectComission());
    }
}
