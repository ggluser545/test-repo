github actions

repo 

workflows, events, jobs, steps

to create custom automated workflows

code - build - deploy - test - release - monitor

jenkins 

job - build, job - deploy, job - test, job - release 

demo

create a repo 

.github/workflows 

(can aso use the demo workflows)


craete a .yml file

(yaml to print hello world)

yaml to Deploy to Production

yaml formatter..

name: Deploy to Production

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Repository
        uses: actions/checkout@v2

      - name: Deploy to Production
        run: |
          # Add your deployment script here
          # Example: ssh into your EC2 instance and pull the latest changes
          ssh user@your-ec2-ip "cd /path/to/your/app && git pull origin main"
        env:
          SSH_PRIVATE_KEY: ${{ secrets.SSH_PRIVATE_KEY }}


start commit 

goto repo main page 
actions -> workflow

select the workflow and check the logs

(workflow - job - step)


______

Prepare SSH Key:

You need to set up an SSH key for secure communication between GitHub Actions and your EC2 instance. Generate an SSH key pair:

bash

ssh-keygen -t rsa -b 4096 -f deploy_key

Add the public key (deploy_key.pub) to your server's ~/.ssh/authorized_keys file.

Add the private key (deploy_key) as a secret in your GitHub repository. Go to your repository on GitHub > Settings > Secrets > New repository secret. Name it SSH_PRIVATE_KEY and paste the content of your private key.