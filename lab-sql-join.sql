use sakila;

#List the number of films per category.
SELECT COUNT(*) AS "film_number", category.name FROM film_category
INNER JOIN category ON film_category.category_id = category.category_id
GROUP BY category.name;

#Display the first and the last names, as well as the address, of each staff member.
SELECT first_name, last_name, address FROM staff
JOIN address on address.address_id = staff.address_id;

# Display the total amount rung up by each staff member in August 2005.
SELECT first_name, last_name, SUM(amount) AS total_amount FROM staff
JOIN payment ON payment.staff_id = staff.staff_id
WHERE MONTH(payment_date) = 8 AND YEAR(payment_date) = 2005
GROUP BY first_name, last_name;

# List all films and the number of actors who are listed for each film.
SELECT title, COUNT(*) AS actors_number FROM film
LEFT JOIN film_actor ON film_actor.film_id = film.film_id
GROUP BY title ORDER BY title;

# Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer.\
# List the customers alphabetically by their last names.
SELECT first_name, last_name, SUM(amount) AS total_amount FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY first_name, last_name
ORDER BY last_name;