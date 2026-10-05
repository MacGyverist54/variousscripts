import xml.etree.ElementTree as ET

path = "/tmp/OPNsense-Perimeter-fixed.xml"

tree = ET.parse(path)
root = tree.getroot()

found = False 

for iface in root.findall("./devices/interface"):
	source  = iface.find("source") 

	if source is not None and source.get("network") == "liberty-mgmt":
		source  =  iface.find("source")    

		print("Found MGMT interface:")
		print(ET.tostring(iface, encoding="unicode"))

		iface.set("type", "bridge")

		source.attrib.clear()
		source.set("bridge", "virbr88")

		found = True 
		break

if not found: 
	raise SystemExit("ERROR: LIBERTY_MGMT interface not found; no file written")

ET.indent(tree, space=" ")
tree.write(path, 
	encoding="unicode")
print("\nupdated MGMT interface to direct bridge virbr88")

