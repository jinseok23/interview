package com.kh.ticketsky.common;

public class Page {
	
	public static String getPage(int cPage, int numPerPage, int totalContents, String url)
	{
		String pageBar="";
		int pageBarSize=5;
		
		int totalPage=(int)Math.ceil((double)totalContents/numPerPage);
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		pageBar+="<ul class='pagination justify-content-center pagination-sm'  style=\"margin:auto;\">";
		
		if(pageNo==1)
		{
			pageBar+="<li class='page-item disabled' style=\"margin:0;\">";
			pageBar+="<a class='page-link' href='#' tabindex='-1'><span aria-hidden=\"true\">&laquo;</span></a>";
			pageBar+="</li>";
		}
		else
		{
			pageBar+="<li class='page-item' style=\"margin:0;\">";
			pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'><span aria-hidden=\"true\">&laquo;</span></a>";
			pageBar+="</li>";		
		}
		
		while(!(pageNo>pageEnd || pageNo>totalPage))
		{
			if(cPage==pageNo)
			{
				pageBar+="<li class='page-item active'>";
				pageBar+="<a class='page-link'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			else
			{
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		if(pageNo>totalPage)
		{
			pageBar+="<li class='page-item' style=\"margin:0;\">";
			pageBar+="<a class='page-link' href='#'> <span aria-hidden=\"true\">&raquo;</span></a>";
			pageBar+="</li>";
		}
		else
		{
			pageBar+="<li class='page-item' style=\"margin:0;\">";
			pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+")'> <span aria-hidden=\"true\">&raquo;</span></a>";
			pageBar+="</li>";
		}
		pageBar+="</ul>";
		pageBar+="<script>";
		pageBar+="function fn_paging(cPage,numPerPage){";
		pageBar+="location.href='"+url+"?cPage='+cPage;";
		pageBar+="}";
		pageBar+="</script>";
		return pageBar;
	}
	
	public static String getPage(String category, String subCategory, int cPage, int numPerPage, int totalContents, String url)
	{
		String pageBar="";
		int pageBarSize=5;
		
		int totalPage=(int)Math.ceil((double)totalContents/numPerPage);
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		pageBar+="<script src='http://code.jquery.com/jquery-latest.min.js'></script>";
		pageBar+="<ul class='pagination justify-content-center pagination-sm'>";
		
		if(pageNo==1)
		{
			pageBar+="<li>";
			pageBar+="<a aria-label='Previous'>";
			pageBar+="<span aria-hidden='true'>&laquo;</span></a>";
			pageBar+="</li>";
		}
		else
		{
			pageBar+="<li>";
			pageBar+="<a href='javascript:fn_paging("+(pageNo-1)+")' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a>";
			pageBar+="</li>";		
		}

		while(!(pageNo>pageEnd || pageNo>totalPage))
		{
			if(cPage==pageNo)
			{
				pageBar+="<li>";
				pageBar+="<a>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			else
			{
				pageBar+="<li>";
				pageBar+="<a href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		
		
		if(pageNo>totalPage)
		{
			pageBar+="<li>";
			pageBar+="<a aria-label='Next'>";
			pageBar+="<span aria-hidden='true'>&raquo;</span>";
			pageBar+="</a>";
			pageBar+="</li>";
		}
		else
		{
			pageBar+="<li>";
			pageBar+="<a href='javascript:fn_paging("+pageNo+")'><span aria-hidden='true'>&raquo;</span></a>";
			pageBar+="</li>";
		}
		pageBar+="</ul>";
		/*pageBar+="<script>";
		pageBar+="function fn_paging(cPage,numPerPage){";
		pageBar+="location.href='"+url+"?cPage='+cPage+'&category="+category+"&subCategory="+subCategory+"'";
		pageBar+="}";
		pageBar+="</script>";*/
		
		return pageBar;
	}
	public static String getPage(int no, int cPage, int numPerPage, int totalContents, String url)
	{
		String pageBar="";
		int pageBarSize=5;
		
		int totalPage=(int)Math.ceil((double)totalContents/numPerPage);
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		
		
		pageBar+="<ul class='pagination justify-content-center pagination-sm'>";
		
		if(pageNo==1)
		{
			pageBar+="<li>";
			pageBar+="<a aria-label='Previous'>";
			pageBar+="<span aria-hidden='true'>&laquo;</span></a>";
			pageBar+="</li>";
		}
		else
		{
			pageBar+="<li>";
			pageBar+="<a href='javascript:fn_paging("+(pageNo-1)+")' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a>";
			pageBar+="</li>";		
		}

		while(!(pageNo>pageEnd || pageNo>totalPage))
		{
			if(cPage==pageNo)
			{
				pageBar+="<li>";
				pageBar+="<a>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			else
			{
				pageBar+="<li>";
				pageBar+="<a href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage)
		{
			pageBar+="<li>";
			pageBar+="<a aria-label='Next'>";
			pageBar+="<span aria-hidden='true'>&raquo;</span>";
			pageBar+="</a>";
			pageBar+="</li>";
		}
		else
		{
			pageBar+="<li>";
			pageBar+="<a href='javascript:fn_paging("+pageNo+")'><span aria-hidden='true'>&raquo;</span></a>";
			pageBar+="</li>";
		}
		pageBar+="</ul>";
		/*pageBar+="<script>";
		pageBar+="var re = {cPage :"+cPage+", no : "+no+"};";
		pageBar+="function fn_paging(cPage,numPerPage){";*/
		/*pageBar+="$.ajax({";
		pageBar+="url :'"+url+"',";
		pageBar+="data : re ,";
		pageBar+="dataType : 'json',";
		pageBar+="success : function(data)";
		pageBar+="{";
		pageBar+="";*/
		/*pageBar+="location.href='"+url+"?cPage='+cPage+'&no="+no+"'";
		pageBar+="}";
		pageBar+="</script>";*/
		return pageBar;
	}
	public static String getQuestionPage(int no, int cPage, int numPerPage, int totalContents, String url)
	{
		String pageBar="";
		int pageBarSize=5;
		
		int totalPage=(int)Math.ceil((double)totalContents/numPerPage);
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		
		pageBar+="<script src='http://code.jquery.com/jquery-latest.min.js'></script>";
		pageBar+="<ul class='pagination justify-content-center pagination-sm'>";
		
		if(pageNo==1)
		{
			pageBar+="<li>";
			pageBar+="<a aria-label='Previous'>";
			pageBar+="<span aria-hidden='true'>&laquo;</span></a>";
			pageBar+="</li>";
		}
		else
		{
			pageBar+="<li>";
			pageBar+="<a href='javascript:fn_questionPaging("+(pageNo-1)+")' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a>";
			pageBar+="</li>";		
		}

		while(!(pageNo>pageEnd || pageNo>totalPage))
		{
			if(cPage==pageNo)
			{
				pageBar+="<li>";
				pageBar+="<a>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			else
			{
				pageBar+="<li>";
				pageBar+="<a href='javascript:fn_questionPaging("+pageNo+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage)
		{
			pageBar+="<li>";
			pageBar+="<a aria-label='Next'>";
			pageBar+="<span aria-hidden='true'>&raquo;</span>";
			pageBar+="</a>";
			pageBar+="</li>";
		}
		else
		{
			pageBar+="<li>";
			pageBar+="<a href='javascript:fn_questionPaging("+pageNo+")'><span aria-hidden='true'>&raquo;</span></a>";
			pageBar+="</li>";
		}
		pageBar+="</ul>";
		/*pageBar+="<script>";
		pageBar+="var re = {cPage :"+cPage+", no : "+no+"};";
		pageBar+="function fn_questionPaging(cPage,numPerPage){";*/
		/*pageBar+="$.ajax({";
		pageBar+="url :'"+url+"',";
		pageBar+="data : re ,";
		pageBar+="dataType : 'json',";
		pageBar+="success : function(data)";
		pageBar+="{";
		pageBar+="";*/
		/*pageBar+="location.href='"+url+"?cPage='+cPage+'&no="+no+"'";
		pageBar+="}";
		pageBar+="</script>";*/
		
		return pageBar;
	}

	//김정현 페이징 처리
	public static String getPageNotice(int cPage, int numPerPage, int totalContents)

	{

		String pageBar="";

		int pageBarSize=5; // 페이징 바에 몇개 들어갈지

		

		int totalPage=(int)Math.ceil((double)totalContents/numPerPage);

		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;

		int pageEnd=pageNo+pageBarSize-1;

		

		pageBar+="<ul class='pagination justify-content-center pagination-sm'>";

		

		if(pageNo==1)

		{

			pageBar+="<li class='page-item disabled'>";

			pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";

			pageBar+="</li>";

		}

		else

		{

			pageBar+="<li class='page-item'>";

			pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";

			pageBar+="</li>";		

		}

		

		while(!(pageNo>pageEnd || pageNo>totalPage))

		{

			if(cPage==pageNo)

			{

				pageBar+="<li class='page-item active'>";

				pageBar+="<a class='page-link'>"+pageNo+"</a>";

				pageBar+="</li>";

			}

			else

			{

				pageBar+="<li class='page-item'>";

				pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";

				pageBar+="</li>";

			}

			pageNo++;

		}

		if(pageNo>totalPage)

		{

			pageBar+="<li class='page-item'>";

			pageBar+="<a class='page-link' href='#'>다음</a>";

			pageBar+="</li>";

		}

		else

		{

			pageBar+="<li class='page-item'>";

			pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+")'>다음</a>";

			pageBar+="</li>";

		}

		pageBar+="</ul>";

		pageBar+="<script>";

		pageBar+="function fn_paging(cPage,numPerPage){";

		pageBar+="fn_notice(cPage);";

		pageBar+="}";

		pageBar+="</script>";

		return pageBar;

	}
}
