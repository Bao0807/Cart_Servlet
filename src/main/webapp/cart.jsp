<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.the_cart_page.CartItem" %>
<%@ page import="java.util.List" %>
<%
    if (request.getAttribute("cart") == null) {
        response.sendRedirect(request.getContextPath() + "/cart");
        return;
    }

    List<CartItem> cart = (List<CartItem>) request.getAttribute("cart");
    double total = (Double) request.getAttribute("total");
    String lastAddedId = (String) request.getAttribute("lastAddedId");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CD Store | Your Cart</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<h1>Your cart</h1>

<table>
    <thead>
    <tr>
        <th class="quantity-column">Quantity</th>
        <th>Description</th>
        <th class="price-column">Price</th>
        <th class="price-column">Amount</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <% if (cart.isEmpty()) { %>
    <tr>
        <td colspan="5">Your cart is empty.</td>
    </tr>
    <% } %>

    <% for (CartItem item : cart) { %>
    <tr>
        <td class="quantity-column">
            <form class="quantity-form" action="${pageContext.request.contextPath}/cart" method="post">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="id" value="<%= item.getId() %>">
                <input type="number" name="quantity" value="<%= item.getQuantity() %>" min="1">
                <button type="submit">Update</button>
            </form>
        </td>
        <td><%= item.getDescription() %></td>
        <td class="price-column">$<%= String.format("%.2f", item.getPrice()) %></td>
        <td class="price-column">$<%= String.format("%.2f", item.getAmount()) %></td>
        <td>
            <form action="${pageContext.request.contextPath}/cart" method="post">
                <input type="hidden" name="action" value="remove">
                <input type="hidden" name="id" value="<%= item.getId() %>">
                <button type="submit">Remove Item</button>
            </form>
        </td>
    </tr>
    <% } %>
    </tbody>
</table>

<p class="notice">To change the quantity, enter the new quantity and click Update.</p>
<p><strong>Total: $<%= String.format("%.2f", total) %></strong></p>

<% if (lastAddedId != null && !lastAddedId.isEmpty()) { %>
<p>Last added CD: <strong><%= lastAddedId %></strong></p>
<% } %>

<form action="index.jsp">
    <button type="submit">Continue Shopping</button>
</form>

<p><button type="button">Checkout</button></p>
</body>
</html>
