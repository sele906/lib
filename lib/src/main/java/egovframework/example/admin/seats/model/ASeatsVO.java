package egovframework.example.admin.seats.model;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ASeatsVO {

	private int seatId;
	private String userid;
	private String seatNum;
	private String status;
	private Date seatTime;
}
