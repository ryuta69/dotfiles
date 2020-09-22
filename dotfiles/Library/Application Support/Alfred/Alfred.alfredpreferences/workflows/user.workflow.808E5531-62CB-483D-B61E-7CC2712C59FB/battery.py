# -*- coding: utf-8 -*-

import subprocess
import re
import sys

output = subprocess.check_output(['pmset', '-g', 'batt'])

# Get components
source = re.search(r"'.*?'", output).group(0).replace("'", "")
percent = re.search(r"\d{1,3}%", output).group(0)
time = re.search(r"(\d{1,2}:\d{2}) remaining", output)

# Generate description according to charge state
if time and time.group(1) != '0:00':
	if source == 'AC Power':
		description = 'Until Full'
	elif source == 'Battery Power':
		description = 'Remaining'
	
	time = time.group(1)
else:
	if source == 'AC Power':
		description = 'Calculating Time Until Full&#x2026;'
	elif source == 'Battery Power':
		description = 'Calculating Time Remaining&#x2026;'
	time = ''

if 'charged' in output:
	description = 'Battery Is Charged'

# Icon logic
icon = int(percent.replace('%', ''))
icon = str(int(round(icon / 100.0 * 32)))

if source == 'AC Power':
	icon = 'charging/' + icon
else:
	icon = 'discharging/' + icon

if 'charged' in output:
	icon = 'charged'

# Friendly names for power sources
if source == 'AC Power':
	source = 'Power Adapter'
elif source == 'Battery Power':
	source = 'Battery'

# Send it to Alfred
kwargs = {
	'icon': icon,
	'time': time + ' ' if time else '',
	'description': description,
	'percent': percent,
	'source': source
}
sys.stdout.write(u'''<?xml version="1.0"?><items><item uid="tylereich.battery"><icon>icons/{icon}.png</icon><title>{time}{description}</title><subtitle>{percent} &#x00B7; Power Source: {source}</subtitle></item></items>'''.format(**kwargs))
