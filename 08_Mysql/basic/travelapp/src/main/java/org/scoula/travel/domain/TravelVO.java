package org.scoula.travel.domain;
// travel.csv를읽어TravelVO 객체로 변환하여 다음과 같이 출력하세요.
// 정의 클래스
    // org.scoula.travel.domain.TravelVO.java
    // org.scoula.CSVTest2.java

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TravelVO {
    private Long no;
    private String district;
    private String title;
    private String description;
    private String address;
    private String phone;

    private List<TravelImageVO> images;
}
