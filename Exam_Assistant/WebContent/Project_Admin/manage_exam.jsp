<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class=" ">
    <head>
        <!-- 
         * @Package: Ultra Admin - Responsive Theme
         * @Subpackage: Bootstrap
         * @Version: 4.0
         * This file is part of Ultra Admin Theme.
        -->
        <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
        <meta charset="utf-8" />
        <title>Manage Exam</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta content="" name="description" />
        <meta content="" name="author" />

        <link rel="shortcut icon" href="img/favicon.png" type="image/x-icon" />    <!-- Favicon -->
        <link rel="apple-touch-icon-precomposed" href="img/apple-touch-icon-57-precomposed.png">	<!-- For iPhone -->
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="img/apple-touch-icon-114-precomposed.png">    <!-- For iPhone 4 Retina display -->
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="img/apple-touch-icon-72-precomposed.png">    <!-- For iPad -->
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="img/apple-touch-icon-144-precomposed.png">    <!-- For iPad Retina display -->




        <!-- CORE CSS FRAMEWORK - START -->
        <link href="css/pace-theme-flash.css" rel="stylesheet" type="text/css" media="screen"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="css/animate.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/perfect-scrollbar.css" rel="stylesheet" type="text/css"/>
        <!-- CORE CSS FRAMEWORK - END -->

        <!-- OTHER SCRIPTS INCLUDED ON THIS PAGE - START --> 
        <link href="css/datepicker.css" rel="stylesheet" type="text/css" media="screen"/>        <!-- OTHER SCRIPTS INCLUDED ON THIS PAGE - END --> 


        <!-- CORE CSS TEMPLATE - START -->
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/responsive.css" rel="stylesheet" type="text/css"/>
        <!-- CORE CSS TEMPLATE - END -->

<script>
 
 function loadState()
	{
		var countryId=document.getElementById("countryId");
		
		var xmlhttp;
		
		if (window.XMLHttpRequest)
		  {// code for IE7+, Firefox, Chrome, Opera, Safari
		  	xmlhttp=new XMLHttpRequest();
		  }
		else
		  {// code for IE6, IE5
		  	xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		  }
		
		removeAllState();
		
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4) 
			{
				var jsonObj = JSON.parse(xmlhttp.responseText);
				
				for(i=0 ; i<jsonObj.length ; i++)
				{
					var createOption=document.createElement("option");
					
					createOption.value=jsonObj[i].semId;
					createOption.text=jsonObj[i].semName;
					
					document.cityForm.stateId.options.add(createOption);
					
				}
			}
			
		}

		xmlhttp.open("get", "${pageContext.request.contextPath}/ExamController?flag=loadState&countryId="+countryId.value, true);
		xmlhttp.send();
	
	}
	
	function removeAllState()
	{
		var removeState=document.cityForm.stateId.options.length;
		for(i=removeState ; i>0 ; i-- )
		{
			document.cityForm.stateId.remove(i);
		}
	}
	</script>






    </head>
    <!-- END HEAD -->

    <!-- BEGIN BODY -->
    <body class=" ">
        <!-- START TOPBAR -->
        <jsp:include page="header.jsp"></jsp:include>
        <!-- END TOPBAR -->
        <!-- START CONTAINER -->
        <div class="page-container row-fluid">

            <!-- SIDEBAR - START -->
            <jsp:include page="menu.jsp"></jsp:include>
            <!--  SIDEBAR - END -->
            <!-- START CONTENT -->
            <section id="main-content" class=" ">
                <section class="wrapper main-wrapper" style=''>

                    <div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
                        <div class="page-title">

                            <div class="pull-left">
                                <h1 class="title">Add Exam</h1>                            </div>

                            <div class="pull-right hidden-xs">
                                <ol class="breadcrumb">
                                    <li>
                                        <a href="index.jsp"><i class="fa fa-home"></i>Home</a>
                                    </li>
                                    
                                </ol>
                            </div>

                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                        <section class="box ">
                            
                            <div class="content-body">
                                <div class="row">
                                    <form action ="<%=request.getContextPath()%>/ExamController" method="post" name="cityForm" id="basicForm">
                                        <div class="col-lg-8 col-md-8 col-sm-9 col-xs-12">

                                            <div class="form-group">
                                                <label class="form-label" for="field-1">Branch</label>
                                                <span class="desc"></span>
                                                <select class="form-control" name="countryId" id="countryId" onchange="loadState()" required>
                                                 <option></option>
                                                    <c:forEach var="i" items="${sessionScope.branchlist}">
                                                    
                                                    <option  value="${i.branchId}">${i.branchName}</option>
                                                    </c:forEach>
                                                 </select>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label class="form-label" for="field-1">Semester</label>
                                                <span class="desc"></span>
                                        <select class="form-control" name="stateId" required>
                                                    
                                                    <option>----select----</option>
                                                    
													
                                                 </select>
                                		   </div>
                                            
                                            
                                            <div class="form-group">
                                                <label class="form-label" for="field-1">Exam Title</label>
                                                <span class="desc"></span>
                                                <div class="controls">
                                                    <input type="text" value="" class="form-control" id="field-1" name="ExamTitle" required>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label class="form-label" for="field-5">Description</label>
                                                <!--  <span class="desc">e.g. "04/03/2015"</span> -->
                                                <div class="controls">
                                                	  	<textarea class="form-control autogrow" cols="5" id="field-5" name="ExamDescription" required></textarea>
                                                 </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label" for="field-5">Date</label>
                                                <span class="desc">dd/mm/yyyy</span>
                                                <div class="controls">
                                                    <input type="text" value="" class="form-control datepicker" data-format="dd/mm/yyyy" value="" name="ExamDate" required>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label" for="field-5">Time Slot</label>
                                                <span class="desc"></span>
                                                <select class="form-control" name="ExamTimeSlot"  required>
                                                    <option></option>
                                                    <option >AM</option>
                                                    <option >PM</option>
                                                </select>
                                            </div>
                                   </div>
										<input type="hidden" name="flag" value="InsertExam"/>
                                        <div class="col-lg-8 col-md-8 col-sm-9 col-xs-12 padding-bottom-30">
                                            <div class="text-left">
                                                <input type="submit" class="btn btn-primary" value="Submit">
                                                <button type="button" class="btn">Cancel</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>


                            </div>
                        </section></div>


                    
                </section>
            </section>
            <!-- END CONTENT -->
            

            <div class="chatapi-windows ">


            </div>    </div>
        <!-- END CONTAINER -->
        <!-- LOAD FILES AT PAGE END FOR FASTER LOADING -->


        <!-- CORE JS FRAMEWORK - START --> 
        <script src="js/jquery-1.11.2.min.js" type="text/javascript"></script> 
        <script src="js/jquery.easing.min.js" type="text/javascript"></script> 
        <script src="js/bootstrap.min.js" type="text/javascript"></script> 
        <script src="js/pace.min.js" type="text/javascript"></script>  
        <script src="js/perfect-scrollbar.min.js" type="text/javascript"></script> 
        <script src="js/viewportchecker.js" type="text/javascript"></script>  
        <!-- CORE JS FRAMEWORK - END --> 


        <!-- OTHER SCRIPTS INCLUDED ON THIS PAGE - START --> 
        <script src="js/datepicker.js" type="text/javascript"></script> <script src="js/autosize.min.js" type="text/javascript"></script><script src="js/jquery.inputmask.bundle.min.js" type="text/javascript"></script><!-- OTHER SCRIPTS INCLUDED ON THIS PAGE - END --> 


        <!-- CORE TEMPLATE JS - START --> 
        <script src="js/scripts.js" type="text/javascript"></script> 
        <!-- END CORE TEMPLATE JS - END --> 

        <!-- Sidebar Graph - START --> 
        <script src="js/jquery.sparkline.min.js" type="text/javascript"></script>
        <script src="js/chart-sparkline.js" type="text/javascript"></script>
        <!-- Sidebar Graph - END --> 













        <!-- General section box modal start -->
        <div class="modal" id="section-settings" tabindex="-1" role="dialog" aria-labelledby="ultraModal-Label" aria-hidden="true">
            <div class="modal-dialog animated bounceInDown">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Section Settings</h4>
                    </div>
                    <div class="modal-body">

                        Body goes here...

                    </div>
                    <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-default" type="button">Close</button>
                        <button class="btn btn-success" type="button">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- modal end -->
    </body>
</html>



