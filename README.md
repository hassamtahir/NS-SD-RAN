# NS-SD-RAN

This project is proposed to scale O-RAN UE's simulation facility and eradicate RANSIM limitations. Aim of the project is to integrate SD-RAN with ns-3 simulation modules instead of RANSIM. NS-3 provides variety of easy customizations and scaling. NS-SD-RAN is more computation friendly as compared to RANSIM.

# Installation/Working Process
Check pods:
Kubectl get pods -n riab

![image](https://github.com/hassamtahir/NS-SD-RAN/assets/58023371/385eec6d-972c-470d-b35b-568009c274aa)

Go inside ns-sd-ran:
kubectl exec -it -n riab ns-sd-ran-7bb84fcf76-2qhrt -- /bin/bash

![image](https://github.com/hassamtahir/NS-SD-RAN/assets/58023371/05644d66-47a6-4d62-8e00-fede3cc5f03d)

Check files inside container:
Scratch directory contains scenario files to setup scenario and run simulation and output will 
be stored inside file with format .tr(trace file)
![image](https://github.com/hassamtahir/NS-SD-RAN/assets/58023371/148925a0-2830-4c01-9afd-12240310b1ad)

![image](https://github.com/hassamtahir/NS-SD-RAN/assets/58023371/437d72eb-d0f1-4303-8021-a87bb1e8f993)

Open scenario-zero-50ues.cc and replace e2t pod ip to attach with sd-ran:

![image](https://github.com/hassamtahir/NS-SD-RAN/assets/58023371/e4767e01-6604-4231-af17-7804b33d0b09)

How to check e2t ip:
Kubectl get svc -n riab | grep e2t

![image](https://github.com/hassamtahir/NS-SD-RAN/assets/58023371/2a8dd623-2072-4f75-a07e-1324901e9c55)

Setup scenario inside scenario-50ue.cc file in scratch directory:

![image](https://github.com/hassamtahir/NS-SD-RAN/assets/58023371/7f89fb54-fdd4-4907-8e58-d91b7f57c3d4)

Add ASCII lines here to save output in .tr file for visualization:
![image](https://github.com/hassamtahir/NS-SD-RAN/assets/58023371/9a54b1a6-8056-452d-ac53-efadd2d09148)

For visualization:
Install mobaxterm:
The simplest ssh client to run X11 GUI from SSH connection.
https://mobaxterm.mobatek.net/
X11 forwarding is a feature of the SSH protocol that allows you to run graphical applications on a 
remote server, but have them display on your local machine. This is done by forwarding X11 (the 
most common window system for Unix-like operating systems) traffic from the remote machine 
over the SSH connection to your local machine.
Insert private ssh key and start

![image](https://github.com/hassamtahir/NS-SD-RAN/assets/58023371/401947f7-618b-47ea-96d9-9e377ea73dfc)

Visulization run:
![image](https://github.com/hassamtahir/NS-SD-RAN/assets/58023371/9f866f34-3f4b-4fa6-b68c-59870b4b2c47)

![image](https://github.com/hassamtahir/NS-SD-RAN/assets/58023371/e7256cc4-783c-4dde-a17e-6f45d6544af9)


# Sample Results:
Node positioning:
![image](https://github.com/hassamtahir/NS-SD-RAN/assets/58023371/dc14d7e3-4f2d-480f-820a-fba6edfaad43)

# Computational Check:

Install Grafana via helm chart if not installed:
• helm repo add grafana https://grafana.github.io/helm-charts 
• helm repo update
→replace my-release with version user wants
• helm install my-release grafana/grafana-agent-operator

![image](https://github.com/hassamtahir/NS-SD-RAN/assets/58023371/46b244d3-7d52-4943-8484-79ab751fa666)

 Port forwarding & Visualization of resources:
 ![image](https://github.com/hassamtahir/NS-SD-RAN/assets/58023371/595a447b-692a-497e-9b05-08e6fa858a5b)





