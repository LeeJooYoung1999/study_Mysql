package org.scoula.travel.dataimport;
//TravelDao를 이용하여 travel.csv에 있는 데이터를 tbl_travel_image에 저장하세요.
//정의클래스: org.scoula.travel.dataimport.ImportImageData.java

import org.scoula.database.JDBCUtil;
import org.scoula.travel.dao.TravelDao;
import org.scoula.travel.dao.TravelDaoImpl;

public class ImportImageData {
    public static void main(String[] args) {
        TravelDao dao = new TravelDaoImpl();

        File dir = new File("../travel-image");
        File[] files = dir.listFiles();
        for (File file : files) {
            String filename = file.getName();
            long travelNo = Long.parseLong(filename.split("-")[0]);  // 관광지 no 얻기

            TravelImageVO image = TravelImageVO.builder()
                    .filename(filename)
                    .travelNo(travelNo)
                    .build();
            System.out.println(image);
            dao.insertImage(image);
        }
        JDBCUtil.close();
    }
}
