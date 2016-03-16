Feature: Sorting

  Scenario: Sort all the pizzas by weight in descending order
    Given all pizzas are indexed
    When I make a query
    """
    { todo }
    """
    Then the response should contain
    """
    {
     "hits":{
       "total":10,
       "hits":[
         {
           "_source":{
             "topping":[
               "Meatballs",
               "Marinated Beef",
               "Bacon"
             ],
             "id":6,
             "weight":1015,
             "name":"Take Away Meat Lover"
           },
           "sort":[
             1015
           ]
         },
         {
           "_source":{
             "topping":[
               "Ham"
             ],
             "id":9,
             "weight":680,
             "name":"California Malibu"
           },
           "sort":[
             680
           ]
         },
         {
           "_source":{
             "topping":[
               "Meatballs"
             ],
             "id":10,
             "weight":680,
             "name":"California Meatballs"
           },
           "sort":[
             680
           ]
         },
         {
           "_source":{
             "topping":[
               "Bacon"
             ],
             "id":2,
             "weight":680,
             "name":"American Bacon"
           },
           "sort":[
             680
           ]
         },
         {
           "_source":{
             "topping":[
               "Marinated Chicken"
             ],
             "id":1,
             "weight":680,
             "name":"California Sunset Chicken"
           },
           "sort":[
             680
           ]
         },
         {
           "_source":{
             "topping":[
               "Chorizo"
             ],
             "id":8,
             "weight":630,
             "name":"Meat lover"
           },
           "sort":[
             630
           ]
         },
         {
           "_source":{
             "topping":[
               "Beef"
             ],
             "id":7,
             "weight":610,
             "name":"New York Grilled Steak"
           },
           "sort":[
             610
           ]
         },
         {
           "_source":{
             "topping":[
               "Pepperoni"
             ],
             "id":4,
             "weight":590,
             "name":"Double Pepperoni"
           },
           "sort":[
             590
           ]
         },
         {
           "_source":{
             "topping":[

             ],
             "id":5,
             "weight":580,
             "name":"Triple Cheese"
           },
           "sort":[
             580
           ]
         },
         {
           "_source":{
             "topping":[
               "Ham"
             ],
             "id":3,
             "weight":580,
             "name":"Classic American"
           },
           "sort":[
             580
           ]
         }
       ]
      }
    }
    """