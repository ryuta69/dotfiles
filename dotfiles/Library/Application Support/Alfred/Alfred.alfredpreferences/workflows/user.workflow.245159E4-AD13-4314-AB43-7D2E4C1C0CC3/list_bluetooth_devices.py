import json
import sys
from subprocess import check_output, Popen, PIPE
import re

# bluetooth_devices_raw = check_output(["/usr/libexec/PlistBuddy", "-c", "print :0:_items:0:device_title", "/dev/stdin <<< $(system_profiler SPBluetoothDataType -xml)"])


bluetooth_devices_pipe = Popen(["/bin/bash", "-c", "/usr/libexec/PlistBuddy -c \"print :0:_items:0:device_title\" /dev/stdin <<< $(system_profiler SPBluetoothDataType -xml)"], stdout=PIPE)
bluetooth_devices_raw, err = bluetooth_devices_pipe.communicate()

bluetooth_devices = re.findall(r"(?s).*?(?:Dict\s?\{)(.*?)\=.*?(?:device_addr)\s?\=\s?((?:[0-9A-F]{2}[:-]){5}(?:[0-9A-F]{2}))", bluetooth_devices_raw)

device_list = [{
	"type": "file",
	"title": device[0].replace('\n','').strip(),
	"subtitle": device[1],
	"arg": device[1]
} for device in bluetooth_devices]

sorted_device_list = sorted(device_list, key=lambda dev: dev['title'])

result = {"items": sorted_device_list}

finalResult = json.dumps(result)

print(finalResult)
