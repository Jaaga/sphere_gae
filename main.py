"""`main` is the top level module for your Bottle application."""

# import the Bottle framework
from bottle import Bottle, request, template, static_file, error
import json
# from google.appengine.api import users

# Create the Bottle WSGI application.
bottle = Bottle()
# Note: We don't need to call run() since our application is embedded within
# the App Engine WSGI application server.

interviews = json.load( open('data/interviews.json', 'rb') )
questions = json.load( open('data/questions.json', 'rb') )

qorder = ['1a', '1b', '2a', '2b', '3', '4a', '4b', '4c', '4d', '4e', '4f', '5a', '5b', '6a', '6b', '6c', '6d', '7a',
'7b', '7c', '7d', '8a', '8b', '8c', '8d', '8e', '9a', '9b', '10a', '10b', '10c', '10d', '10e', '10f', '11a', '11b', '11c',
'12a', '12b', '12c', '13a', '13b', '13c', '13d', '13e', '13f', '13g', '13h', '13i', '14a', '14b']

# metadata_tags = ['Organisation', 'Name(s) of Interviewee(s)', 'Sector', 'Type', 'Interview Number', 'Date and Time', 'Duration',
# 'Orator', 'Documentor', 'Venue', 'Interview Code']

#Short list of tags
metadata_tags = ['Organisation', 'Name(s) of Interviewee(s)', 'Sector', 'Type']

# Define an handler for the root URL of our application.
@bottle.get('/') # or @route('/login')
def index():
    output = template('templates/index', stakeholders=interviews.keys(), get_url=bottle.get_url)
    return output

@bottle.post('/')
def do_search():
    phrase = request.forms.get('phrase')
    count, results = search(interviews, phrase)
    if phrase:
        output = template('templates/search', phrase=phrase, count=count, qorder=qorder, questions=questions, results=results, get_url=bottle.get_url)
        return output
    else:
        return "<p>Search failed.</p>"

@bottle.route('/stakeholder/<name>')
def show_stakeholder(name='Saahas'):
    responses = interviews[name]['responses']
    count = len(responses)
    output = template('templates/stakeholder', name=name, count=count, tags=metadata_tags, metadata=interviews[name]['metadata'], qorder=qorder, questions=questions, responses=responses, get_url=bottle.get_url)
    return output

@bottle.route('/static/<filename>', name='static')
def server_static(filename):
    return static_file(filename, root='static')

# Define an handler for 404 errors.
@bottle.error(404)
def error_404(error):
    """Return a custom 404 error."""
    return 'Sorry, Nothing at this URL.'


def search(interviews, phrase):
    results = {}
    count = 0
    for question in qorder:
        for name in interviews.keys():
            if question in interviews[name]['responses']:
                for response in interviews[name]['responses'][question]:
                    if all(word in response.lower() for word in phrase.lower().split()):
                        if question not in results:
                            results[question] = {}
                        if name not in results[question]:
                            results[question][name] = []
                        results[question][name].append(response)
                        count += 1
    return(count, results)
