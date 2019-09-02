<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/sellerAside.jsp"></jsp:include>


<div class="col-12 col-md-8 col-lg-9">
                    <div class="row">
                      <h4>리뷰관리</h4>
                    </div>
                    <hr>
                    <div class="row">
            						<div class="col-xs-12">
                          <div class="select-group">

                          </div>
	                        <form class="form-inline float-right" action="">
                            <label for="">월 별 조회</label>
                            &nbsp;&nbsp;
                            <select id="searchSelectBox" name="searchType" class="form-control input-sm">
                                <option value="searchUser">예매일</option>
                                <option value="searchTitle">관람일</option>
                            </select>
                            &nbsp;&nbsp;
                            <select id="searchSelectBox" name="searchType" class="form-control input-sm">
                                <option value="searchUser">2018</option>
                                <option value="searchTitle">2017</option>
                                <option value="searchTitle">2016</option>
                            </select>
                            &nbsp;&nbsp;
                            <select id="searchSelectBox" name="searchType" class="form-control input-sm">
                                <option value="searchUser">1</option>
                                <option value="searchTitle">2</option>
                                <option value="searchTitle">3</option>
                                <option value="searchTitle">4</option>
                                <option value="searchTitle">5</option>
                                <option value="searchTitle">6</option>
                                <option value="searchTitle">7</option>
                                <option value="searchTitle">8</option>
                                <option value="searchTitle">9</option>
                                <option value="searchTitle">10</option>
                                <option value="searchTitle">11</option>
                                <option value="searchTitle">12</option>
                            </select>
                            &nbsp;&nbsp;
                            <button type="submit" class="btn btn-primary floa">조회</button>
	                        </form>
                        </div>
                    </div>
                    <!-- /.content -->
                    <div class="row" style="margin-top:3%;">
                      <table class="tableTL table table-striped"  style="text-align:center;">
                      <!-- <colgroup>
                         <col width="1%"/>
                            <col width="2%"/>
                            <col width="10%"/>
                            <col width="2%"/>
                            <col width="25%"/>
                            <col width="4%"/>
                            <col width="5%"/>
                            <col width="6%"/>
                      </colgroup> -->
                      <thead>
                          <tr>
                              <th scope="col">예매번호</th>
                              <th scope="col">티켓명</th>
                              <th scope="col">후기내용</th>
                              <th scope="col">작성일</th>
                              <th scope="col">비고</th>
                          </tr>
                      </thead>
                      <tbody>

      		               	<tr>
      			                <td>E10323432</td>
      			                <td>오즈의 마법사</td>
      			                <td>재밌게 잘봤습니다. 또보고싶진 않네요.</td>
      			                <td>2018.08.30</td>
      			                <td> <button type="button" class="btn btn-sm btn-danger" name="button">리뷰삭제</button> </td>
      			            </tr>
                        <tr>
                          <td>E10323433</td>
                          <td>점프 ( JUMP )</td>
                          <td>냉무</td>
                          <td>2018.07.15</td>
                          <td> <button type="button" class="btn btn-sm btn-danger" name="button">리뷰삭제</button> </td>
                      </tr>
      		             </tbody>
                      </table>
                      <div class="row" style="margin:auto;">
                        <nav aria-label="Page navigation example" >
                        <ul class="pagination">
                        <li class="page-item" style="margin:0;">
                        <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">Previous</span>
                        </a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"  style="margin:0;">
                        <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                        <span class="sr-only">Next</span>
                        </a>
                        </li>
                        </ul>
                        </nav>
                      </div>

                    </div>
                  </div>
              </div>
          </div>
      </section>
      <!-- ##### Shop Grid Area End ##### -->

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>