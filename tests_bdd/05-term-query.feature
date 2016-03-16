Feature: Term level queries (exact terms)

  # Use: https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-term-query.html

  # Extra info: Filters also need custom mapping also.

  Scenario: Find the pizzas that has "Marinated Beef" topping
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
              "topping":[
                "Meatballs",
                "Marinated Beef",
                "Bacon"
              ],
              "name":"Take Away Meat Lover"
            }
          }
        ]
      }
    }
    """