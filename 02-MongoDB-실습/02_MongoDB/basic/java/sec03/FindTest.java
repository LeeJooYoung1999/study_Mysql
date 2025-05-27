package sec03;

import app.Database;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import org.bson.Document;
import java.util.Iterator;

public class FindTest {
    public static void main(String[] args) {
        MongoCollection<Document> collection = Database.getCollection("todo");
        FindIterable<Document> doc = collection.find();

        //FindIterator ==> mySQL jdbc에서, ResultSet에 해당하는 녀석
        //반복적으로 꺼내주는 기능이 없음.
        //반복자Iterator이용하여 꺼내주어야 함.
        Iterator itr = doc.iterator();
        while (itr.hasNext()) {
            System.out.println("==> findResultRow : "+itr.next());
        }//ite.hasNext()가 false일때까지 무한반복.
        Database.close();
    }
}

