Setup
=====

- Use a linux desktop on the controls dev network.
- log into the K8S dashboard at https://pollux-dashboard.diamond.ac.uk
- open pods in namespace p47-iocs
- make sure there are 4 iocs and a opi pod running
- clone the bl47p repo git@github.com:epics-containers/bl47p.git
- have a terminal open with
  - source /dls_sw/work/python3/ec-venv/bin/activate
  - cd bl47p
  - source environment.sh
- get the P47 edm gui up with **super** p47
- make sure bl47p-ea-dcam-01 is deployed with a beta tag and that the PVA plugin is missing. When you deploy a tagged version - make sure it is 2024.1.5 which also has PVA missing


Intro
=====

So, a few of us have been working on containersing EPICS IOCS and managing them
in Kubernetes for a while. Today I'm going to show you what working with your
beamline IOCs might look like in this new world.

This is going to be a live demo!!

We will be looking at the training rig beamline P47.
This beamline is running all its IOCs in Kubernetes, it has a pmac clipper, two
motors, two GigE cameras and a Panda Box.


Steps
=====

- ec --help
- ec ioc --help
- ec ps
- **you can learn about the underlying commands that ec is using with -v**
- ec -v ps
- **which beamline am I talking to?**
- ec env
- **show the iocs in the repo*
- ec ioc list
- **oh no we have a beta dcam-01 !**
- ec ioc instances bl47p-ea-dcam-01
  - **show tab completion for above**
- ec ioc deploy bl47p-ea-dcam-01 2024.1.5
  - **show tab completion for above**
***********************************************
- **SHOW DASHBOARD - DISCUSS Generic images and SHOW CONFIG MAPS**
***********************************************
- **try to demo PVA viewer but the plugin is missing from the IOC !**
- LIVE CODING
- **edit iocs/bl47p-ea-dcam-01/config/bl47p-ea-dcam-01.yaml on the fly and add PVA plugin - showing schema auto completion**
  - R: ":TX:"
  - PVNAME: BL47P-EA-DET-01:TX:PVA
- **also describe the beamline repo as you go**
- ec deploy-local iocs/bl47p-ea-dcam-01
- c2dv --pv BL47P-EA-DET-01:TX:PVA &
  - **show the image and some movement**
- **now we have a working version we should release it**
- git add .
- git commit -m'fixed PVA in dcam 01'
- git push
- git tag
- git tag 2024.1.next-number
- ec ioc deploy bl47p-ea-dcam-01 2024.1.next-number
- ec ps
- **show that PVA is there in this version**
***********************************************
**show that Dashboard is registering the new version**
***********************************************
- **note that no code changes or recompilation happened to make this work**

Now show the Panda GUI
======================

Show the service and the bob files.
Keep the sample cam running

- phoebus.sh -resource http://172.23.168.180/bl47p-ea-panda-01/index.bob
- Go to TTLOUT2 and set it to ZERO to "close" the "Shutter"
- See the light go out on the Sample Cam

Documentation
=============

To find out more google "epics containers". Choose the documentation link.
For a quick overview of more detail see the Oxfordshire epics meeting presentation
linked in Materials.
For loads of detail head over to the Tutorials pages.
