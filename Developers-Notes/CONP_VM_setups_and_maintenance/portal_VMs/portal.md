# Description

The production CONP portal code is being run from the portal.conp.ca VM. In addition to the production VM
a dev VM and a test VM have been set up for our internal testing and developments.

# VMs information

The following three VMs have been set up on the MCIN servers:
- portal-dev.conp.ca => a dev environment with the frontend only visible through McGill's VPN
- portal-test.conp.ca => an environment open to the world for new features' demos that are not yet pulled on production
- portal.conp.ca => production VM of the portal

### portal-dev.conp.ca VM information

VM information:
- user: `conp_admin` to be accessed using `sudo su - conp_admin` after logging in with LDAP credentials to the VM
- host: `portal-dev.conp.ca`
- port: `30032`
- password: first login to the VM with your LDAP credentials and then run `sudo su - conp_admin` 
  to connect to the `conp_admin` account
  
Database information:
- user: `conp_dev_user` (and `conp_dev_admin` for the admin account)
- host: `mariadb-dev.acelab.ca`
- database name: `conp_portal_dev`
- password: please contact Cécile Madjar or MCIN IT for password

VM downtime for backup:
- every Wednesdays at 1:00AM

### portal-test.conp.ca VM information

VM information:
- user: `conp_admin` to be accessed using `sudo su - conp_admin` after logging in with LDAP credentials to the VM
- host: `portal-test.conp.ca`
- port: `22104`
- password: first login to the VM with your LDAP credentials and then run `sudo su - conp_admin` 
  to connect to the `conp_admin` account
  
Database information:
- user: `conp_test_user` (and `conp_test_admin` for the admin account)
- host: `mariadb-dev.acelab.ca`
- database name: `conp_portal_test` 
- password: please contact Cécile Madjar or MCIN IT for password

VM downtime for backup:
- every Friday at 6:00AM

### portal-test.conp.ca VM information

VM information:
- user: `conp_admin` to be accessed using `sudo su - conp_admin` after logging in with LDAP credentials to the VM
- host: `portal.conp.ca`
- port: `4707`
- password: first login to the VM with your LDAP credentials and then run `sudo su - conp_admin` 
  to connect to the `conp_admin` account
  
Database information:
- user: `conp_user` (and `conp_admin` for the admin account)
- host: `mariadb.acelab.ca`
- database name: `conp_portal` 
- password: please contact Cécile Madjar or MCIN IT for password

VM downtime for backup:
- every Thursday at 2:35AM


# Portal code

The portal code is a Flask application via gunicorn and interacting with a MariaDB database.

### Python installation and virtual environment

A virtual environment for Python 3.6.9 has been created under `/home/conp-admin/conp-portal/venv`. 
To source the virtual environment, run `source /home/conp-admin/conp-portal/venv` once logged in as `conp-admin`.
All required Python libraries have been installed through `pip`.

Note: all Flask commands must be run after sourcing the Python environment.

### Gunicorn server

Restarting the gunicorn server is needed after HTML code changes. To restart the server, run the following command
when logged in to the server under LDAP credentials:
```bash
sudo systemctl restart gunicorn.socket
```

To access the gunicorn logs, run the following when logged in to the server under LDAP credentials:
```bash
sudo journalctl -u gunicorn -f
```

### Portal code updates

Portal code updates are automated for production using GitHub webhooks. GitHub sends a `POST` to
`portal.conp.ca/webhooks` (see https://github.com/CONP-PCNO/conp-portal/settings/hooks/189211197).

The code for the webhooks can be found in `/home/conp-admin/conp-portal/app/webhooks/routes.py` which
does a `git pull origin master`.

### Dataset updates

A cronjob is running every 15 minutes to update the list of datasets on production. This cronjob is calling
`/home/conp-admin/cron_update_datasets.sh` which is a wrapper around the Flask command used to update datasets
(a.k.a. `flask update_datasets`). This Flask command will pull the latest commit of 
https://github.com/CONP-PCNO/conp-dataset.git and update MariaDB `dataset*` tables with the latest 
information and datasets.

### Pipeline updates

A cronjob is running every day at 11:00AM to update the list of pipelines on production. This cronjob is calling
`/home/conp-admin/cron_update_pipelines.sh` which is a wrapper around the Flask command used to update pipelines 
(a.k.a. `flask update_pipeline_data`). This Flask command will pull all the latest Boutiques descriptors 
published on Zenodo.

### Analytics updates

A cronjob is running every day at 7:00AM to update query Matomo's API and insert analytics data into the
portal MariaDB database. This cronjob is calling `/home/conp-admin/cron_update_analytics.sh` which is a wrapper 
around the Flask command used to update analytics data (a.k.a. `flask update_analytics`). This Flask command 
will query Matomo's API and insert analytics data into the `matomo*` tables of production's MariaDB database.

