package org.scoula.travel.dataimport;

import com.opencsv.bean.CsvToBeanBuilder;
import com.opencsv.exceptions.CsvValidationException;
import org.scoula.database.JDBCUtil;
import org.scoula.travel.dao.TravelDao;
import org.scoula.travel.dao.TravelDaoImpl;
import org.scoula.travel.domain.TravelVO;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;

//TravelDao를 이용하여 travel.csv에 있는 데이터를 tbl_travel에 저장하세요.
    //정의클래스: org.scoula.travel.dataimport.ImportTravelData.java
public class ImportTravelData {
    public static void main(String[] args) throws CsvValidationException, IOException {
        TravelDao dao = new TravelDaoImpl();

        List<TravelVO> travels = new CsvToBeanBuilder<TravelVO>(new FileReader("travel.csv"))
                .withType(TravelVO.class)
                .build()
                .parse();
        travels.forEach(travel -> {
            System.out.println(travel);
            dao.insert(travel);
        });
        JDBCUtil.close();
    }
}
