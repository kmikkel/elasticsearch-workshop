Feature: Full text queries, term level queries and aggregations combined

  Scenario: Find pizzas with a name that contains the word "California" and that has "Meatballs" topping. Then, for every topping, count the number of pizzas containing that topping
    Given all pizzas are indexed
    When I make a query
    """
    { todo }
    """
    Then the response should contain
    """
    {
       "hits":{
          "total":1,
          "hits":[
             {
                "_source":{
                    "name":"California Meatballs"
                }
             }
          ]
       },
       "aggregations":{
          "facets":{
             "doc_count":1,
             "toppings":{
                "buckets":[
                   {
                      "key":"Meatballs",
                      "doc_count":1
                   }
                ]
             }
          }
       }
    }
    """