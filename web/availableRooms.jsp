


<%@page import="java.util.Base64"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbcontext.DBContext"%>
<!doctype html>
<html lang="en">
    <head>
        <%@include file="/includes/header.jsp" %>

        <title>Available Rooms</title>
    </head>
    <body>
        <%
            Object s_name = session.getAttribute("s_name");
        %>


        <main role="main">
            <div class="album  ">
                <div class="container">
                    <h2 class="text-center p-3 text-secondary">Available Rooms</h2>
                    <%
                        String arrival = request.getParameter("check_in");
                        String depature = request.getParameter("check_out");
                    %>
                    Arrival:<%= arrival%>


                    <div class="row">   
                        <%
                            Connection cn = DBContext.getConnection();
                            Statement stmt = cn.createStatement();
                            ResultSet rs = stmt.executeQuery("select RoomType.IDRoomType,RoomType.NameRoomType, RoomType.Price, RoomType.Content, room_category.cover_img from RoomType  "
                                    + " left join reservation on reservation.room_id = RoomType.id   "
                                    + " where RoomType.status=1  OR  (reservation.date_out <= '" + arrival + "') OR (reservation.date_in > '" + arrival + "' AND reservation.date_in >= '" + depature + "') ");

                            while (rs.next()) {
                        %>
                        <div class="col-md-4 ">
                            <div class="card mb-4  text-secondary  ">
                                <%
                                    int id = rs.getInt("RoomType.id");
                                    String NameRoomType = rs.getString("RoomType.NameRoomType");
                                    int Price = rs.getInt("RoomType.Price");
                                    String Content = rs.getString("RoomType.Content");

                                    Blob image = rs.getBlob("room_category.cover_img");
                                    byte imgData[] = image.getBytes(1, (int) image.length());
                                    String encodedImage = Base64.getEncoder().encodeToString(imgData);
                                    String cat_img = "data:image/jpg;base64," + encodedImage;
                                %>

                                <img class="card-img-top"  src="<%= cat_img%>" alt="Card image cap" width="200px" height="200px">
                                <div class="card-body px-3 py-3">
                                    <form action="bookcart.jsp">
                                        <input type="hidden" value="<%= arrival%>" name="arrival"/>
                                        <input type="hidden" value="<%= depature%>" name="depature"/>
                                        <input type="hidden" value="<%= id%>" name="id" >

                                        <b>Room Type:</b> <%= NameRoomType%><br>
                                        <b>Price:</b> Rs.<%= Price%><br>
                                        <b>Details:</b> <P style="color: green;"><%= Content%></P>
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="btn-group">
                                                <%if (s_name == null) {%>
                                                <button type="button" class="btn btn-sm  btn-outline-secondary mt-2"><a href="Login.jsp" class="text-decoration-none text-secondary">Book Now</a></button>
                                                <% } else {%>
                                                <input type="submit" value="Book Now" class="btn btn-sm btn-outline-secondary mt-2" />
                                                <% } %>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>

                </div>
            </div>

        </main>

        <div class="footer" style="margin-top: 80px;">
            <%@include file="includes/footer.jsp" %>
        </div>

    </body>
</html>
