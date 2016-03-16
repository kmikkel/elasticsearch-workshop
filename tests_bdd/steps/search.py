import json
from behave import *


@given(u'all pizzas are indexed')
def step_impl(context):
    # Create custom mapping
    '''with open('mapping.json') as data_file:
        mapping = json.load(data_file)
        context.app.elasticsearch.indices.delete(index='big-one',
                                                 ignore=[400, 404])
        context.app.elasticsearch.indices.create(index='big-one')
        context.app.elasticsearch.indices.put_mapping(index="big-one",
                                                      doc_type="pizza",
                                                      body=mapping)
        context.app.elasticsearch.cluster.health(wait_for_status='yellow',
                                                 request_timeout=1000)'''

    # Index the data
    '''with open('data.json') as data_file:
        data = json.load(data_file)
        for entry in data:
            context.app.elasticsearch.index(
                index="big-one",
                doc_type="pizza",
                id=entry['id'],
                body=entry)
        context.app.elasticsearch.indices.refresh(index='big-one')'''


@when(u'I make a query')
def step_impl(context):
    data = context.text or context.data
    if data.strip() != '{ todo }':
        body = json.loads(data.decode('utf-8'))
        context.response = context.app.elasticsearch.search(index="big-one", body=body)
