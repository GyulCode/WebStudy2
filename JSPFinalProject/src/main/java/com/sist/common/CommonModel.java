package com.sist.common;

import javax.servlet.http.HttpServletRequest;
import java.util.*;
import com.sist.vo.*;
import com.sist.dao.*;

public class CommonModel {
	public static void commonRequestData(HttpServletRequest request)
	{
		//footer
		FoodDAO dao=FoodDAO.newInstance();
		// 공지사항 
		//방문 맛집
		List<FoodVO> fList=dao.foodTop7();
		request.setAttribute("fList", fList);
	}

}
