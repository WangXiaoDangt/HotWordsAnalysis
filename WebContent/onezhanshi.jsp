<%@page import="Bean.reci"%>
<%@page import="Dao.chaxunreci"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<link rel="stylesheet" href="./vendor/simple-line-icons/css/simple-line-icons.css">
    <link rel="stylesheet" href="./vendor/font-awesome/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="./css/styles.css">
    <style>
	.table-b table td{border:1px solid #C0C0C0}
	</style>
	<%ArrayList<String> list=new ArrayList<String>();
    chaxunreci selecta=new chaxunreci();
    list=selecta.chaxunfenlei();
    request.setCharacterEncoding("UTF-8");
	ArrayList<reci> cilist=new ArrayList<reci>();
	String name="";
	if(request.getParameter("name")!=null)
	{
		name=request.getParameter("name");
		chaxunreci select=new chaxunreci();
		cilist=select.chaxunone(name);
	}
    %>
<title>信息技术手册查重错误比对分析 </title>
</head>
<body class="sidebar-fixed header-fixed">
<div class="page-wrapper">
    <nav class="navbar page-header">
        <a href="#" class="btn btn-link sidebar-mobile-toggle d-md-none mr-auto">
            <i class="fa fa-bars"></i>
        </a>

        <a class="navbar-brand" href="#">
           <h6>信息技术手册查重错误比对分析 </h6>
        </a>

        <a href="#" class="btn btn-link sidebar-toggle d-md-down-none">
            <i class="fa fa-bars"></i>
        </a>

        <ul class="navbar-nav ml-auto">

        </ul>
    </nav>

    <div class="main-container">
        <div class="sidebar" style="background:#0099FF;">
            <nav class="sidebar-nav">
                <ul class="nav">
                   

                    <li class="nav-item">
                        <a style="color:#FFFFFF;" href="zhuye.jsp" class="nav-link">
                            <i class="icon icon-speedometer"></i> 搜索
                        </a>
                    </li>

                    <li class="nav-item nav-dropdown">
                        <a style="color:#FFFFFF;" href="#" class="nav-link nav-dropdown-toggle">
                            <i class="icon icon-target"></i> 分类  <%=list.size() %><i class="fa fa-caret-left"></i>
                        </a>

                        <ul class="nav-dropdown-items" style="background:#0099FF;">
                            <%for(String fenlei:list)
                            	{
                            	%>
                            	<li class="nav-item">
                                <a style="color:#FFFFFF;" href="liebiao.jsp?fenlei=<%=fenlei %>" class="nav-link<%if(name.equals(fenlei)){out.print(" active");} %>">
                                    <i class="icon icon-target"></i> <%=fenlei %>&nbsp&nbsp&nbsp&nbsp<%if(name.equals(fenlei)){out.print(cilist.size());} %>
                                </a>
                            	</li>
                            	<%
                            	}
                            	%>
                        </ul>
                    </li>
                     <li class="nav-item">
                        <a style="color:#FFFFFF;" href="zhanshi.jsp" class="nav-link">
                            <i class="icon icon-grid"></i> PDF
                        </a>
                    </li>
                </ul>
            </nav>
        </div>

        <div class="content" style="background:#FFFFFF;">
            <div class="container-fluid">
				<div align="center" class="table-b">
					<% //out.print("<p>123</p>");
				
					if(!cilist.isEmpty())
					{%>
						<table border='0' >
				
						<%
						for(reci a:cilist)
						{
							%>
						
							<tr>
							<td width="10%">热词</td><td><%=a.getName()%></td>
							</tr>
							<tr>
							<td>重复率</td>
							<% if(a.getNum()!=null)
							{%>
							<td><%=a.getNum()%></td>
							<%
							}
							else
							{
								%>
								<td colspan="5"><br>无<br><br></td>
								<% 
							}
							%>
							
							</tr>
							<tr>
							<td>技术手册关键词</td><td><%=a.getFenlei1()%></td>
							</tr>
							<tr>
							<td>分类</td><td><%=a.getFenlei()%></td>
							</tr>
							<tr>
							<td>关键词</td><td><%=a.getGuanjianci() %></td>
							</tr>
							<tr>
							<td >解释：</td>
							<% if(a.getJieshi()!=null)
							{%>
							<td colspan="5"><br><%=a.getJieshi()%><br><br></td>
							<%
							}
							else
							{
								%>
								<td colspan="5"><br>无<br><br></td>
								<% 
							}
							%>
							</tr>
							<tr>
							<td >百度百科：</td>
							<% if(a.getBdwk()!=null)
							{%>
							<td colspan="5"><br><%=a.getBdwk()%><br><br></td>
							<%
							}
							else
							{
								%>
								<td colspan="5"><br>无<br><br></td>
								<% 
							}
							%>
							</tr>
							<tr>
							<td >查重：</td>
							<% if(a.getChong()!=null)
							{%>
							<td colspan="5"><br><%=a.getChong()%><br><br></td>
							<%
							}
							else
							{
								%>
								<td colspan="5"><br>无<br><br></td>
								<% 
							}
							%>
							
							</tr>
					</table>
				<%     }
					}
					else
					{
						out.print("无该热词！");
					}
				
					%>
					</div>
            </div>
        </div>
    </div>
</div>
<script src="./vendor/jquery/jquery.min.js"></script>
<script src="./vendor/popper.js/popper.min.js"></script>
<script src="./vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="./vendor/chart.js/chart.min.js"></script>
<script src="./js/carbon.js"></script>
<script src="./js/demo.js"></script>
</body>
</html>