<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
        <style>
            .nav-link {
                color: white
            }
            .nav-link:hover {
                background-color: #ccc;
                color: #17a2b8
            }
        </style>       
    </head>
    <body>
        <div class="d-flex">     

            <div class="container mt-5">

                <h1 style="margin-bottom: 40px; color: orange" >Update Your Profile</h1>
                <form action="updateprofile" method="post">
                    <input value="${user.id}" name="id" hidden="">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputEmail4" style="font-weight: bold">Email</label>
                            <input type="email" class="form-control" id="inputEmail4" placeholder="Email" value="${user.email}" name="email">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputUsername4" style="font-weight: bold">Username </label>
                            <input type="text" class="form-control" id="inputUsername4" placeholder="Username" value="${user.username}" name="username">
                        </div>
                    </div>
                    <div class="form-row">
                        <!--                        <div class="form-group col-md-4">
                                                    <label for="inputPassword4" style="font-weight: bold">Password</label>
                                                    <input type="password" class="form-control" id="inputPassword4" placeholder="Password" value="" name="password">
                                                </div>-->
                        <div class="form-group col-md-4">
                            <label for="phone" style="font-weight: bold">Phone</label>
                            <input type="text" class="form-control" id="phone" name="phone" value="${user.mobile}">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label for="Fullname" style="font-weight: bold">Fullname </label>
                            <input type="text" class="form-control" id="Fullname" placeholder="Fullname" value="${user.fullname}" name="fullname">
                        </div>
                    </div>
                    <button style="background-color: orange" type="submit" class="btn btn-primary updateBtn">Update</button>
                </form>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

</body>

</html>
