package com.example.the_cart_page;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        List<CartItem> cart = getCart(session);
        String lastAddedId = "";

        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("lastAddedId".equals(cookie.getName())) {
                    lastAddedId = cookie.getValue();
                }
            }
        }

        request.setAttribute("cart", cart);
        request.setAttribute("total", getTotal(cart));
        request.setAttribute("lastAddedId", lastAddedId);
        request.getRequestDispatcher("/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession();
        List<CartItem> cart = getCart(session);

        String action = request.getParameter("action");
        String id = request.getParameter("id");

        if (action != null) {
            if (action.equals("add")) {
                String description = request.getParameter("description");
                double price = Double.parseDouble(request.getParameter("price"));
                CartItem foundItem = findItem(cart, id);

                if (foundItem == null) {
                    cart.add(new CartItem(id, description, price, 1));
                } else {
                    foundItem.setQuantity(foundItem.getQuantity() + 1);
                }

                Cookie lastAddedCookie = new Cookie("lastAddedId", id);
                lastAddedCookie.setMaxAge(60 * 60 * 24 * 7);
                lastAddedCookie.setPath(request.getContextPath());
                response.addCookie(lastAddedCookie);
            } else if (action.equals("update")) {
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                CartItem foundItem = findItem(cart, id);

                if (foundItem != null && quantity > 0) {
                    foundItem.setQuantity(quantity);
                }
            } else if (action.equals("remove")) {
                CartItem foundItem = findItem(cart, id);

                if (foundItem != null) {
                    cart.remove(foundItem);
                }
            }
        }

        response.sendRedirect(request.getContextPath() + "/cart");
    }

    @SuppressWarnings("unchecked")
    private List<CartItem> getCart(HttpSession session) {
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }

        return cart;
    }

    private CartItem findItem(List<CartItem> cart, String id) {
        for (CartItem item : cart) {
            if (item.getId().equals(id)) {
                return item;
            }
        }

        return null;
    }

    private double getTotal(List<CartItem> cart) {
        double total = 0;

        for (CartItem item : cart) {
            total += item.getAmount();
        }

        return total;
    }
}
