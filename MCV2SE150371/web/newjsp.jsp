<%@page import="longpnh.registration.RegistrationDTO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Search Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>Search Page</h1>
        <form action="DispatcherServlet">
            Search Value <input type="text" name="txtSearchValue" 
                                value="<%= request.getParameter("txtSearchValue") %>"/><br/>
            <input type="submit" value="Search" name="btAction" />
        </form><br/>
        
        <%
            String searchValue = request.getParameter("txtSearchValue");
            if (searchValue != null){
                List<RegistrationDTO> result = 
                        (List<RegistrationDTO>) request.getAttribute("SEARCHRESULT");
                if(result != null){
                    %> 
                    <table border="1">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>Username</th>
                                <th>Password</th>
                                <th>Full name</th>
                                <th>Role</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                               int count = 0;
                               for (RegistrationDTO dto : result){
                                   String urlRewriting = "DispatcherServlet"
                                           + "?btAction=Delete"
                                           + "&pk=" + dto.getUsername()
                                           + "&lastSearchValue=" + searchValue;
                                   %> 
                            <tr>
                                <td>
                                    <%= ++count %>
                                .</td>
                                <td>
                                    <%= dto.getUsername() %>
                                </td>
                                <td>
                                    <%= dto.getPassword() %>
                                </td>
                                <td>
                                    <%= dto.getFullname() %>
                                </td>
                                <td>
                                    <%= dto.isRole() %>
                                </td>
                                <td>
                                    <a href="<%= urlRewriting %>">Delete</a>
                                </td>
                            </tr>
                            <%
                               }//end for traversing result 
                            %>
                        </tbody>
                    </table>

        <%
                }//end if result has records
                else {
                %>
                <h2>
                    No record is matched!!!
                </h2>  
        <%
                }
            }//end if search Value is not first time
        %>
    </body>
</html>
