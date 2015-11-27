"""`main` is the top level module for your Bottle application."""

# import the Bottle framework
from bottle import Bottle, request, template, static_file, error
import pickle
from google.appengine.api import users

# Create the Bottle WSGI application.
bottle = Bottle()
# Note: We don't need to call run() since our application is embedded within
# the App Engine WSGI application server.


# Define an handler for the root URL of our application.
@bottle.get('/') # or @route('/login')
def search():
    # Checks for active Google account session
    user = users.get_current_user()
    output = template('templates/index', data=data, get_url=bottle.get_url)
    return output

@bottle.post('/')
def do_search():
    phrase = request.forms.get('phrase')
    count, results = search(data,phrase)
    if phrase:
        output = template('templates/make_table', phrase=phrase, count=count, results=results, get_url=bottle.get_url)
        return output
    else:
        return "<p>Search failed.</p>"

@bottle.route('/stakeholder/<name>')
def show_stakeholder(name='sph-pri-fpr-biome'):
    # output = template('Hello {{name}}, how are you?', name=name)
    count, results = show_stakeholder(data, name)
    output = template('templates/make_table', phrase=name, count=count, results=results, get_url=bottle.get_url)
    return output

@bottle.route('/static/<filename>', name='static')
def server_static(filename):
    return static_file(filename, root='static')

# Define an handler for 404 errors.
@bottle.error(404)
def error_404(error):
    """Return a custom 404 error."""
    return 'Sorry, Nothing at this URL.'

data = pickle.load( open('data/alldata.pickle', 'rb') )

questions = ['1a', '1b', '2a', '2b', '3', '4a', '4b', '4c', '4d', '4e', '4f', '5a', '5b', '6a', '6b', '6c', '6d', '7a',
'7b', '7c', '7d', '8a', '8b', '8c', '8d', '8e', '9a', '9b', '10a', '10b', '10c', '10d', '10e', '10f', '11a', '11b', '11c',
'12a', '12b', '12c', '13a', '13b', '13c', '13d', '13e', '13f', '13g', '13h', '13i', '14a', '14b']

def show_stakeholder(data, stakeholder):
    results = []
    count = 0
    for question in questions:
        code_count = 0
        for response in data[stakeholder][question]:
            code_count += 1
            code = stakeholder+'-'+question+'-'+str(code_count)
            results.append([code, response])
            count += 1
    return(count, results)

def search(data, phrase):
    results = []
    count = 0
    for stakeholder in data:
        for question in questions:
            code_count = 0
            for response in data[stakeholder][question]:
                code_count += 1
                code = stakeholder+'-'+question+'-'+str(code_count)
                if all(word in response.lower() or word in code for word in phrase.lower().split()):
                    results.append([code, response])
                    count += 1
    return(count, results)
