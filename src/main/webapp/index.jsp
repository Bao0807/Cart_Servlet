<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CD Store | CD List</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<h1>CD list</h1>

<table>
            <thead>
            <tr>
                <th>Description</th>
                <th class="price-column">Price</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>86 (the band) - True Life Songs and Pictures</td>
                <td class="price-column">$14.95</td>
                <td>
                    <form action="${pageContext.request.contextPath}/cart" method="post">
                        <input type="hidden" name="action" value="add">
                        <input type="hidden" name="id" value="cd1">
                        <input type="hidden" name="description" value="86 (the band) - True Life Songs and Pictures">
                        <input type="hidden" name="price" value="14.95">
                        <button type="submit">Add To Cart</button>
                    </form>
                </td>
            </tr>
            <tr>
                <td>Paddlefoot - The first CD</td>
                <td class="price-column">$12.95</td>
                <td>
                    <form action="${pageContext.request.contextPath}/cart" method="post">
                        <input type="hidden" name="action" value="add">
                        <input type="hidden" name="id" value="cd2">
                        <input type="hidden" name="description" value="Paddlefoot - The first CD">
                        <input type="hidden" name="price" value="12.95">
                        <button type="submit">Add To Cart</button>
                    </form>
                </td>
            </tr>
            <tr>
                <td>Paddlefoot - The second CD</td>
                <td class="price-column">$14.95</td>
                <td>
                    <form action="${pageContext.request.contextPath}/cart" method="post">
                        <input type="hidden" name="action" value="add">
                        <input type="hidden" name="id" value="cd3">
                        <input type="hidden" name="description" value="Paddlefoot - The second CD">
                        <input type="hidden" name="price" value="14.95">
                        <button type="submit">Add To Cart</button>
                    </form>
                </td>
            </tr>
            <tr>
                <td>Joe Rut - Genuine Wood Grained Finish</td>
                <td class="price-column">$14.95</td>
                <td>
                    <form action="${pageContext.request.contextPath}/cart" method="post">
                        <input type="hidden" name="action" value="add">
                        <input type="hidden" name="id" value="cd4">
                        <input type="hidden" name="description" value="Joe Rut - Genuine Wood Grained Finish">
                        <input type="hidden" name="price" value="14.95">
                        <button type="submit">Add To Cart</button>
                    </form>
                </td>
            </tr>
            </tbody>
</table>
</body>
</html>
