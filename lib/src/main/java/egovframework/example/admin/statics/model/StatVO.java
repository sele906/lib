package egovframework.example.admin.statics.model;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StatVO {

	private int logId;
	private String userid;
	private String level;
	private Date logTime;
	private String logTimeStr;
}
