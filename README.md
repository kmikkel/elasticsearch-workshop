# Elasticsearch Workshop  
 
This repository contains 19 tasks for learning how to write [Query DSL](https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl.html).

![](tasks.png?raw=true)

During these tasks you will learn how to do [full-text search](https://www.elastic.co/guide/en/elasticsearch/reference/current/full-text-queries.html), [filtering](https://www.elastic.co/guide/en/elasticsearch/reference/current/term-level-queries.html), [aggregations](https://www.elastic.co/guide/en/elasticsearch/reference/current/search-aggregations.html), [highlightning](https://www.elastic.co/guide/en/elasticsearch/reference/current/search-request-highlighting.html), [sorting](https://www.elastic.co/guide/en/elasticsearch/reference/current/search-request-sort.html) and [pagination](https://www.elastic.co/guide/en/elasticsearch/guide/current/pagination.html).

## Prerequisites - Installation

### Alternative 1 - Manual installation

In order to run the tasks described below, the following must be installed:

* [Git](https://git-scm.com/downloads)
* [Python 2.7](https://www.python.org/downloads/)
* [Pip](https://pip.pypa.io/en/stable/installing/)
* [Elasticsearch 2.2](https://www.elastic.co/downloads/elasticsearch)
* [Java](http://www.oracle.com/technetwork/java/javase/downloads/index.html)

> Elasticsearch is built using Java, and requires at least Java 7 in order to run. 

Then, install all the required Python packages:

`pip install -r requirements.txt`

### Alternative 2 - Docker
 
An alternative solution is to use [Docker](https://www.docker.com/what-docker). 

Then the following must be installed:

* [Docker](https://www.docker.com/)
* [Docker Compose](https://docs.docker.com/compose/)
* make (`sudo apt-get install make` on Ubuntu)

### Are you not on the Statoil network?

In the docker file, remove or comment out these two lines:

```
ENV http_proxy http://www-proxy.statoil.no:80/
ENV https_proxy http://www-proxy.statoil.no:80/
```

## Pizzas

The data that are used during the workshop is a list of pizzas (see [data.json](data.json)), with the [mapping](https://www.elastic.co/guide/en/elasticsearch/reference/current/mapping.html):

```
{
  "pizza": {
    "properties": {
      "id": {
        "type": "long"
      },
      "name": {
        "type": "string"
      },
      "topping": {
        "type": "string",
        "index": "not_analyzed"
      },
      "weight": {
        "type": "long"
      }
    }
  }
}
```
## Tasks

The tasks are feature tests, and they look like this:

```
Feature: Topic of the task
 
 // Use https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-FEATURE-TO-USE.html
 
 Scenario: Description of the task
  Given all pizzas are indexed
  When I make a query
  """
  { todo }
  """
  Then the response should contain
  """
  { subset }
  """
```

Your task is to replace the `{ todo }` with the correct query.  The comment `use https://...` points you to the page where you can find information about how to write the correct query. A query needs to return a correct response `{ subset }` to be passed.  To make the tests more compact and easy to read, they only compare and validates against a `{ subset }`. Solutions to all tasks can be found under `solutions/`.

## Running the tasks

I recommend using the Chrome extension [Sense](https://chrome.google.com/webstore/detail/sense-beta/lhjgkmllcaadmopgmanpapmpjgmfcfig) during the creation of queries.

### Alternative 1 - Manual installation

`behave --outfile=build/tasks-results`

### Alternative 2 - Docker

`$ make run-tasks`



