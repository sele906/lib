package egovframework.example.service.model;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MultiVO {
	private int seatId;
	private String seatNum;
	private String status;
	private String userid;
	private Date seatTime;
	private String seatTimeStr;
}
