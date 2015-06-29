package com.sqlweb.dao;

import java.io.IOException;
import java.util.List;

import com.sqlweb.dto.ReplyDTO;

public interface ReplyDAO {

	public int replyInsert(ReplyDTO reply);
	
	public List<ReplyDTO> replyDetail(int board_p_id);
	
	public int replyDelete(int r_sequence) throws IOException;
	
	public int memReDel(String user_id);
}
