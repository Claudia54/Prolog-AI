## Introduction

In the first phase of this project, we aimed to develop a knowledge representation and reasoning system capable of characterizing a discourse universe in the area of logistics for package distribution. To achieve this, we developed a package management system for a company called *Green Distribution*, which prioritizes ecology above all. Each courier in this company was assigned multiple packages, using three possible modes of transportation. Considering this, we developed various functions in *Prolog* that, using the database we created, provide access to various information.

To enhance project organization, we decided to divide the work into two *Prolog* files: `basedados.pl`, which contains the predicates and knowledge that support the project, and `queries.pl`, where all the functionalities are implemented.


# Development

In this phase, we began by defining the database. We considered 6 couriers (Cátia, Carlos, Sheila, Ilídio, Filipe, and Roger) and 6 clients (Ogando, Paulo, Marlene, Susana, Jéssica, and Sandro), each associated with a street, and consequently, each street associated with a parish. We also related a pollution index to each vehicle, making it easier to determine who most frequently uses the most ecological mode of transportation, which is useful for Query 1. We assumed the pollution level of a bicycle to be 0 (since it does not cause pollution), the car's pollution level to be 2, and the motorcycle's 1. Thus, we assumed that one car trip pollutes as much as two motorcycle trips.

Regarding the content of the packages, we adopted 4 different types, each with an associated weight and volume. There is the possibility of transporting books, clothing, a computer, and a bicycle. This allowed us to more easily perform the last query, where we had to calculate the total weight transported in a day.

Additionally, we created the path, which provides various information. Through the *path* fact, we know who the client is, the courier making the delivery, the vehicle being used, the date and time the package was ordered, the contents of the package, the transport price, the time frame in which the client wants to receive it, and the serial number of the package. By associating the serial number with each package, we ensure that the same delivery is not repeated (if a client makes two consecutive orders, we ensure they are distinct). We also created fact confirmations to compare packages that have yet to be completed. These confirmations give us access to the details of each package, namely, the delivery date, the ranking, and the time it took to be delivered. Subsequently, they help confirm results about which courier made a specific delivery.

For Queries 7, 8, and 9 regarding time intervals, we decided to consider days to obtain the result by comparing the departure date with the arrival date.

We were encouraged to add new functionalities to this project, and we accepted the challenge by developing two new features. The first addition is a way to find out which deliveries were made at a specific hour. Using previously applied functions and resolution methods, we implemented this query. Additionally, we created a way to find out which packages were delivered on time and which were still pending.

---

## Queries

### Query 1

In Query 1, our goal was to obtain the courier who used the most ecological vehicle, which is the bicycle, the most frequently.

We started by defining the predicate `query1_aux`, which receives a courier and returns the number of times they used a bicycle as a mode of transportation. Having the list of all couriers, we can calculate how many times each of them used a bicycle, which is done through `query1_tuple`. With the values for each courier, the only task left is to sort the list so that the courier with the highest value is at the top, which is done using the function `compare_by_second`. We can then conclude that the most ecological courier is the one at the top of the list.


### Query 2

To identify which couriers delivered certain packages to a specific client, we opted to create two functions.

First, the predicate `query2_aux` receives a client and a package, identifies the courier who delivered it, and verifies the serial number. It then confirms if the package was delivered. Subsequently, it checks if it is a courier. In the `query2` function, with the help of the `findall` function, we can apply `query2_aux` to all paths.



### Query 3

For this query, it was necessary to identify the clients who were served by a specific courier provided by the user. Initially, it checks if there was a delivery made by the courier to a specific client using `query3_aux`, which allows us to develop a list of clients in `query3`.

![Query 3](imagens/query3.png)

### Query 4

The strategy used to determine the total amount billed by *Green Distribution* on a particular day involved developing an auxiliary function, `soma`, whose final goal is to sum all the elements in the list. We assumed that the client pays as soon as the order is made, so we worked with the *path* fact to check if the date and price entered by the user exist.

Finally, we developed `query4` to identify the calculated amount using the auxiliary sum function and `findall`, which allowed us to compile everything into a list for the sum to be possible.



### Query 5

To solve this query, we developed several auxiliary functions that helped in identifying the areas with the highest volume of deliveries by the *Green Distribution* company. Initially, in the first phase, we developed `query5_aux2`, which groups all existing streets into a list using `findall`. Then, we created an auxiliary function, `procura`, which looks for a given street in a list of all streets and groups the respective street name according to the number of times it appears in the list. Based on this, we developed `query_comp`, which organizes the streets by the head of the list. By creating `compare_by_second2`, which compares in descending order, and `query_comp`, as mentioned earlier, we developed `query5_aux1`, which organizes the list of streets in descending order based on the number of times they appear.

Finally, `query5` returns the head of the list, corresponding to the location with the highest delivery volume.



### Query 6

This query aims to calculate the average customer satisfaction rating for a specific courier. We decided to create a list of the number of trips made by a given courier, for which we used `length`. To calculate the sum of all ratings given to couriers, we grouped the ratings into a list and summed them. Finally, having the number of trips made by the courier and the sum of all ratings from these trips given by customers, we calculated the average as requested.



### Query 7

To identify the total number of deliveries made by different means of transport within a specific time interval, we created an auxiliary function that converts a date to days, called `convertDatatodays`. This is used in the function `comp`, which compares a date and checks if it falls within the specified interval. Then, the `aux` and `query7` functions traverse the *confirmation* fact, "searching" for the specified vehicle and checking if the date is within the indicated interval. If so, it is added to a list, and subsequently, the size of the list is summed. For this query, it is necessary to enter the oldest date first and then the most recent date.



### Query 8

In this query, by traversing the *confirmation* fact and comparing each date using the auxiliary function `comp` used in Query 7, we identify the total number of deliveries made by couriers within a specific time interval. For this query, it is necessary to enter the oldest date first and then the most recent date.



### Query 9

Query 9 aims to calculate the number of packages delivered and not delivered by *Green Distribution* within a specific time period. We use Query 8 as an auxiliary since it identifies the total number of deliveries by couriers within a specific time interval. Subsequently, we count how many *path* facts exist and subtract the number of those delivered within that time interval from the total.



### Query 10

To calculate the total weight transported by a specific courier on a given day, we decided to develop two functions.

First, we created an auxiliary function, `query_10`, to check if there is a package delivered according to the courier, day, and weight, using the *path* and *confirmation* facts.

Next, we based the process on the same development method used for Query 4, which involves storing the weight in a list using `findall` and then summing all the elements in the list to return the total weight for a given day.


### Additional Queries

In this section, we will address some queries that we decided to create.

#### Test Query

The test query checks how many packages were actually delivered, indicating how many paths have confirmation (using the serial number).



#### Query 11

We created a fact to determine the number of deliveries that occurred at a specific chosen hour. To do this, we used `findall` to develop a list of all deliveries that occurred at a given hour and used `length` to determine the size of the list, which corresponds to the number of deliveries made.


#### Query 12

To obtain a list of different deliveries made on time, we decided to convert the time from the *path* fact and the *confirmation* fact to hours, as follows:



With the times converted, we can determine if the confirmation time is less than or equal to the path time. If so, then the delivery was made on time.

This allows us to conclude which deliveries meet this requirement:


#### Query 13

The invariant created only allows a path to be inserted if the serial number does not already exist.

#### Query 14

This query was derived from Query 1 and results in the courier who was the most ecological by the end of all deliveries.


---

## Conclusion

In conclusion, this project allowed us to acquire essential skills in developing systems with the ability to characterize a universe in the area of package distribution logistics. Using a language like *Prolog* provided numerous advantages in completing the project as it is a language purely oriented towards logic. Moreover, using our own database was crucial as it allowed greater freedom in how to approach the proposed problems. The group believes that this phase was completed successfully.
