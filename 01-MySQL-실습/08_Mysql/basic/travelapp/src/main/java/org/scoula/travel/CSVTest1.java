package org.scoula.travel;
// travel.csv 파일을 읽어 다음과 같이 출력하는 클래스를 정의하세요.

import com.opencsv.CSVReader;
import com.opencsv.exceptions.CsvValidationException;

import java.io.FileReader;
import java.io.IOException;

public class CSVTest1 {
    public static void main(String[] args) throws CsvValidationException, IOException {
        CSVReader csvReader = new CSVReader(new FileReader("travel.csv"));
        String[] line;
        while ((line=csvReader.readNext())!=null){
            System.out.println(String.join(",",line));
        }
    }
}
