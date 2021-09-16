## Using Ansible to configure containers

The files in this section have to do with ansible, and the configuration of the variety of containers used. Inside the Roles directory, you can find the different playbooks used to create the elastic stack server container, as well as the DVWA web server containers, and the setup files for filebeat and metricbeat. Inside the Files directory, you can find the edited configuration files for both filebeat and metricbeat, as described in the original readme.


## Ansible Playbooks

The files within the Roles directory are all different playbooks used with ansible to configure varying containers in remote virtual machines.

A YAML playbook used to install D*mn Vulnerable Web Application on the web server virtual machines. It installs docker and python, and then the docker python module. Using this, it downloads a specific DVWA contaner, and ensures that docker restarts if the VM restarts, ensuring the system is up even if it restarts:
  - ![DVWA-setup](Ansible/Roles/dvwa-setup.yml)

A YAML playbook used to install filebeat on the web server VMs, as well as copy a modified configuration file from the ansible container to the VMs. It begins by downloading and unpackaging the debian file for filebeat, and then copying the modified configuration file to the VM. It then enables filebeat, sets up and starts the service, and ensures filebeat is enabled upon booting the VM:
  - ![Filebeat-playbook](Ansible/Roles/filebeat-playbook.yml)

A YAML playbook used to install the elastic stack on a virtual machine. This machine was set up in Azure with more CPU and RAM than the web servers, and as such in the playbook the virtual memory allowance is increased first. After that, docker, python, and the docker module are installed, docker is started and enabled on restart, and a specific ELK container image is downloaded and installed. Ports 5601, 9200, and 5044 are set as published ports, as these are necessary communication pathways for the ELK stack and beats:
  - ![ELK-installation](Ansible/Roles/install-elk.yml)

A YAML playbook used to install metricbeat on the web server VMs, as well as copy a modified configuration file from the ansible container. It works in a very similar fashion to the filebeat playbook, however it requires an extra setup that runs the command "metricbeat -e" which defines the way logs are saved.
  - ![Metricbeat-playbook](Ansible/Roles/metricbeat-playbook.yml)


## Beat Configuration Files

The files within the Files directory are the configuration files needed for filebeat and metricbeat setup. These need to be modified to work with the specific IPs and hosts in use, as well as the ports in use.

The filebeat configuration file must be modified in two places:
 - Lines 1005-1007: the host IP and login information
 - Line 1805: the host IP
These changes allow filebeat to communicate properly with the ELK VM, and therefore allow us to gather information into kibana to be visualized.
  - ![Filebeat-config](Ansible/Files/filebeat-config.yml)

The metricbeat configuration file must be modified in two places:
 - Line 62: the host IP
 - Lines 96-98: the host IP and login info
 These changes allow metricbeat to communicate properly with the ELK VM, and send CPU and memory data to kibana for us to see.
  - ![Metricbeat-config](Ansible/Files/metricbeat-config.yml)
