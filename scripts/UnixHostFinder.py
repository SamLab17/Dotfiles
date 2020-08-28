from bs4 import BeautifulSoup
import urllib.request
from subprocess import call
import sys
import ssl

SKIP_HOSTS = ['aggravation']

# Check that username was included in command line
if(len(sys.argv) < 2):
	print(f"Usage: python3 {sys.argv[0]} <CS username>")
	sys.exit(1)

# Use the username from the command line argument
username = str(sys.argv[1])

# URL for UTCS site with list of all Unix hosts available
url = 'https://apps.cs.utexas.edu/unixlabstatus/'

try:
	# Create an SSL context to connect to UTCS's site
	context = ssl._create_unverified_context()
	# Read in website as a string
	site = urllib.request.urlopen(url, context=context).read()
except:
	print("Could not connect to UTCS Unix hosts site")
	sys.exit(1)

#Create Web Scraper instance
soup = BeautifulSoup(site, 'html.parser')

#Create a list of all the hosts on the site
hosts = []

# Loop through all hosts on website
for host in soup.find_all('tr'):
	#Get the text for this item
	text = host.get_text()	
	#Split up text into an array of lines
	lines = text.splitlines();	

	# Valid hosts take up 6 lines
	if len(lines) == 6:
		#Get the name of the host 
		name = lines[1] 	
		# Can be either 'up' or 'down'
		status = lines[2]	
		# Make sure this isn't the table header and that the host is 'up'
		if name != 'Host' and status == 'up':	
			load = float(lines[5])
			users = int(float(lines[4]))
			hosts.append((name, users, load))

# See if we updated the default value and found a host
if len(hosts) > 0:
	hosts.sort(key=lambda tup: (tup[1], tup[2]))
	hosts = [host for host in hosts if host[0] not in SKIP_HOSTS]
	NUM_ATTEMPTS = 10
	for i in range(0, min(len(hosts), NUM_ATTEMPTS)):
		hostname = hosts[i][0]
		try:
			print(hostname)
			call(['ssh', username + '@' + hostname + '.cs.utexas.edu'])
			sys.exit(0)
		except Exception as e:
			print(e)
			print(f"Connection to {hostname} failed.")
			print(f"Trying {hosts[i+1]} instead")
	sys.exit(-1)	
	# Run ssh command in this terminal window
else:
	print('No suitable host could be found.')
