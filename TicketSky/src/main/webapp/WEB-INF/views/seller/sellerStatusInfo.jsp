<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/sellerAside.jsp"></jsp:include>
<style>


</style>

<div class="col-12 col-md-8 col-lg-9">
                    <div class="row">
                    <c:forEach items="${monthAcountList }" var="list" varStatus="a">
                      <c:if test='${a.first}'><h4>통계 - ${list.PERFORMNAME } </h4></c:if>
                    </c:forEach>
                    </div>
                    <hr>

                    <div class="row">
    	                        <form class="form-inline" action="${path }/ticketsky/user/sellerStatusInfo">
    	                             <span>월 별 조회</span>
                                &nbsp;&nbsp;
								<input type="hidden" name="performNo" value="${performNo }"/>
                                <select id="searchSelectBox2" name="year" class="form-control input-sm">
                             <%Calendar mon = Calendar.getInstance();
                                String year = new java.text.SimpleDateFormat("yyyy").format(mon.getTime());
                                mon.add(Calendar.YEAR , -1);
                                String year2 = new java.text.SimpleDateFormat("yyyy").format(mon.getTime());
                                mon.add(Calendar.YEAR , -1);
                                String year3 = new java.text.SimpleDateFormat("yyyy").format(mon.getTime());
                            	 %>
                                <option id="option1" value="<%=year %>"><%=year %></option>
                                <option id="option3" value="<%=year2 %>"><%=year2 %></option>
                                <option id="option3" value="<%=year3 %>"><%=year3 %></option>
                            </select>
                                &nbsp;&nbsp;
                                <select id="searchSelectBox3" name="month" class="form-control input-sm">
                                <option value="01">1</option>
                                <option value="02">2</option>
                                <option value="03">3</option>
                                <option value="04">4</option>
                                <option value="05">5</option>
                                <option value="06">6</option>
                                <option value="07">7</option>
                                <option value="08">8</option>
                                <option value="09">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </select>
                                &nbsp;&nbsp;
                                <button type="submit" class="btn btn-primary floa">조회</button>
    	                        </form>
                        </div>
                        <!-- /.content -->
                        <div class="row" style="margin-top:3%;">
                          <table class="tableTL table table-striped"  style="text-align:center;">
                          <colgroup>
                                <col width="20%"/>
                                <col width="20%"/>
                                <col width="20%"/>
                                <col width="20%"/>
                                <col width="20%"/>
                          </colgroup>
                          <thead>
                              <tr>
                                  <th scope="col">티켓명</th>
                                  <th scope="col">가격</th>
                                  <th scope="col">판매매수</th>
                                  <th scope="col">날짜</th>
                                  <th scope="col">총매출</th>
                              </tr>
                          </thead>
                        </table>
                      </div>
                      <div class="row tbodyrow">
                        <table class="tableTL table table-striped tbody"  style="text-align:center;">
                          <colgroup>
                                <col width="20%"/>
                                <col width="20%"/>
                                <col width="20%"/>
                                <col width="20%"/>
                                <col width="20%"/>
                          </colgroup>

                          <tbody>
                          	<c:set var="totalAmount" value="0"></c:set>
							<c:forEach items="${monthAcountList }" var="list">
          		               	<tr>
          			                <td><a href="#">${list.PERFORMNAME }</a></td>
                                <td><fmt:formatNumber value="${list.ORIPRICE }" pattern="#,###" />원</td>
          			                <td><fmt:formatNumber value="${list.SELLCNT }" pattern="#,###" />매</td>
                                <td>${list.SELLDATE }</td>
          			                <td><fmt:formatNumber value="${list.TOTALAMOUNT }" pattern="#,###" />원</td>
          			            </tr>
          			            <c:set var="totalAmount" value="${totalAmount + list.TOTALAMOUNT }" ></c:set>
							</c:forEach>
          		             </tbody>
                         </table>
                       </div>
                       <div class="row">
                         <table class="tableTL table table-striped tbody"  style="text-align:center; height:100px;">
                           <colgroup>
                                 <col width="20%"/>
                                 <col width="20%"/>
                                 <col width="20%"/>
                                 <col width="20%"/>
                                 <col width="20%"/>
                           </colgroup>                           <tfoot>
                             <tr>
                               <td colspan="4">합계</td>
                               <td><fmt:formatNumber value="${totalAmount }" pattern="#,###" />원</td>
                             </tr>
                           </tfoot>
                          </table>
                    </div>


                    <div class="row">
                      <div class="col-md-6">
                        <!-- DONUT CHART -->
                        <div class="card card-danger">
                          <div class="card-header">
                            <h5 class="card-title">연령별 차트</h5>
                          </div>
                          <div class="card-body">
                            <canvas id="pieChart" style=""></canvas>
                          </div>
                          <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                      </div>

                      <div class="col-md-6">
                        <!-- DONUT CHART -->
                        <div class="card card-danger">
                          <div class="card-header">
                            <h5 class="card-title">성별 차트</h5>
                          </div>
                          <div class="card-body">
                            <canvas id="pieChart2" style=""></canvas>
                          </div>
                          <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                      </div>
                    </div>
                    <br>
                    <div class="row">
                      <div class="col-md-12">
                        <!-- LINE CHART -->
                        <div class="card card-info">
                          <div class="card-header">
                            <h5 class="card-title">월별 차트</h5>
                          </div>
                          <div class="card-body">
                            <div class="chart">
                              <canvas id="lineChart" style=""></canvas>
                            </div>
                          </div>
                          <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                      </div>


                    </div>


                  </div> <!-- content -->
              </div>
          </div>
<!-- ChartJS 1.0.1 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js"></script>


    <!-- jQuery -->
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>

    <script type="text/javascript">
      $(function(){
    	$("#searchSelectBox2").val("${year}").prop("selected", true); 
      	$("#searchSelectBox3").val("${month}").prop("selected", true); 
        //-------------
        //- PIE CHART -
        //-------------
        // Get context with jQuery - using jQuery's .get() method.
        var pieChartCanvas = $('#pieChart').get(0).getContext('2d')
        var pieChart       = new Chart(pieChartCanvas)
        var PieData        = [
        	<c:set var="cnt" value='0'/>
        		<c:forEach items="${ageStatusList}" var="list" varStatus="a">
                <c:if test="${list.AGE eq 10}">
        		  {
                    value    : ${list.CNT},
                    color    : '#f56954',
                    highlight: '#f56954',
                    label    : '10대'
                  },
                </c:if>
                 <c:if test="${list.AGE eq 20}">
       		 	 {
                   value    : ${list.CNT},
                   color    : '#00a65a',
                   highlight: '#00a65a',
                   label    : '20대'
                 },
                </c:if>
                 <c:if test="${list.AGE eq 30}">
       		 	 {
                   value    : ${list.CNT},
                   color    : '#f39c12',
                   highlight: '#f39c12',
                   label    : '30대'
                 },
                </c:if>
                 <c:if test="${list.AGE >= 40}">
                 <c:set var="cnt" value="${cnt + list.CNT}"/>
                 <c:if test="${a.last}">
       		 	 {
                   value    : ${cnt},
                   color    : '#00c0ef',
                   highlight: '#00c0ef',
                   label    : '40대 이상'
                 },
                 </c:if>
                 
                </c:if>
        		</c:forEach>
        ]
        var pieOptions     = {
          //Boolean - Whether we should show a stroke on each segment
          segmentShowStroke    : true,
          //String - The colour of each segment stroke
          segmentStrokeColor   : '#fff',
          //Number - The width of each segment stroke
          segmentStrokeWidth   : 2,
          //Number - The percentage of the chart that we cut out of the middle
          percentageInnerCutout: 50, // This is 0 for Pie charts
          //Number - Amount of animation steps
          animationSteps       : 100,
          //String - Animation easing effect
          animationEasing      : 'easeOutBounce',
          //Boolean - Whether we animate the rotation of the Doughnut
          animateRotate        : true,
          //Boolean - Whether we animate scaling the Doughnut from the centre
          animateScale         : false,
          //Boolean - whether to make the chart responsive to window resizing
          responsive           : true,
          // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
          maintainAspectRatio  : true,
          //String - A legend template
        }
        //Create pie or douhnut chart
        // You can switch between pie and douhnut using the method below.
        pieChart.Doughnut(PieData, pieOptions);



        //-------------
        //- PIE CHART -
        //-------------
        // Get context with jQuery - using jQuery's .get() method.
        var pieChartCanvas2 = $('#pieChart2').get(0).getContext('2d')
        var pieChart2       = new Chart(pieChartCanvas2)
        var PieData2        = [
        	<c:forEach items="${genderStatusList}" var="list">
       	 {
                value    : ${list.CNT},
                <c:if test="${list.GENDER == 'M'}">
                color    : '#f56954',
                highlight: '#f56954',
                label    : '남자'
                </c:if>
                <c:if test="${list.GENDER == 'F'}">
                color    : '#00a65a',
                highlight: '#00a65a',
                label    : '여자'
                </c:if>
              },
   		</c:forEach>
        ]
        var pieOptions2     = {
          //Boolean - Whether we should show a stroke on each segment
          segmentShowStroke    : true,
          //String - The colour of each segment stroke
          segmentStrokeColor   : '#fff',
          //Number - The width of each segment stroke
          segmentStrokeWidth   : 2,
          //Number - The percentage of the chart that we cut out of the middle
          percentageInnerCutout: 50, // This is 0 for Pie charts
          //Number - Amount of animation steps
          animationSteps       : 100,
          //String - Animation easing effect
          animationEasing      : 'easeOutBounce',
          //Boolean - Whether we animate the rotation of the Doughnut
          animateRotate        : true,
          //Boolean - Whether we animate scaling the Doughnut from the centre
          animateScale         : false,
          //Boolean - whether to make the chart responsive to window resizing
          responsive           : true,
          // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
          maintainAspectRatio  : true,
          //String - A legend template
        }
        //Create pie or douhnut chart
        // You can switch between pie and douhnut using the method below.
        pieChart2.Doughnut(PieData2, pieOptions2);


      var areaChartData = {
          labels  : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
          datasets: [

            {
              label               : '연간 통계',
              fillColor           : 'rgba(60,141,188,0.9)',
              strokeColor         : 'rgba(60,141,188,0.8)',
              pointColor          : '#3b8bba',
              pointStrokeColor    : 'rgba(60,141,188,1)',
              pointHighlightFill  : '#fff',
              pointHighlightStroke: 'rgba(60,141,188,1)',
              data                : [
            	  <c:forEach items="${monthStatusList}" var="list">
      	  			${list.AMOUNT},
      	  		  </c:forEach>
      	  	]

            }
          ]
        }

        var areaChartOptions = {
          //Boolean - If we should show the scale at all
          showScale               : true,
          //Boolean - Whether grid lines are shown across the chart
          scaleShowGridLines      : false,
          //String - Colour of the grid lines
          scaleGridLineColor      : 'rgba(0,0,0,.05)',
          //Number - Width of the grid lines
          scaleGridLineWidth      : 1,
          //Boolean - Whether to show horizontal lines (except X axis)
          scaleShowHorizontalLines: true,
          //Boolean - Whether to show vertical lines (except Y axis)
          scaleShowVerticalLines  : true,
          //Boolean - Whether the line is curved between points
          bezierCurve             : true,
          //Number - Tension of the bezier curve between points
          bezierCurveTension      : 0.3,
          //Boolean - Whether to show a dot for each point
          pointDot                : false,
          //Number - Radius of each point dot in pixels
          pointDotRadius          : 4,
          //Number - Pixel width of point dot stroke
          pointDotStrokeWidth     : 1,
          //Number - amount extra to add to the radius to cater for hit detection outside the drawn point
          pointHitDetectionRadius : 20,
          //Boolean - Whether to show a stroke for datasets
          datasetStroke           : true,
          //Number - Pixel width of dataset stroke
          datasetStrokeWidth      : 2,
          //Boolean - Whether to fill the dataset with a color
          datasetFill             : true,
          //String - A legend template
          //Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
          maintainAspectRatio     : true,
          //Boolean - whether to make the chart responsive to window resizing
          responsive              : true
        }
        //-------------
        //- LINE CHART -
        //--------------
        var lineChartCanvas          = $('#lineChart').get(0).getContext('2d')
        var lineChart                = new Chart(lineChartCanvas)
        var lineChartOptions         = areaChartOptions
        lineChartOptions.datasetFill = false
        lineChart.Line(areaChartData, lineChartOptions)


      });
    </script>

</body>

</html>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>