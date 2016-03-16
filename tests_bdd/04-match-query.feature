Feature: Full text queries

   # Use https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-match-query.html

  Scenario: Find the pizzas with a name that contains the word "American"
    Given all pizzas are indexed
    When I make a query
    """
    { todo }
    """
    Then the response should contain
    """
    {
      "hits":{
        "total":2,
        "hits":[
          {
            "_source":{
              "name":"American Bacon"
            }
          },
          {
            "_source":{
              "name":"Classic American"
            }
          }
        ]
      }
    }
    """