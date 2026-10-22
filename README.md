Terraform Project - EKS on AWS

What it does
Builds a small Kubernetes (EKS) cluster in AWS with Terraform. The project is set up for dev, qa and prod, but only dev is deployed. The qa and prod files are there as reference to show how the other environments would differ.

How it is structured
- modules/capitec_eks: subnets, EKS cluster, IAM roles, node group and the NodePort rule. Written once and reused by every environment.
- modules/capitec_s3: the S3 bucket module from the training exercise.
- envs/dev, envs/qa, envs/prod: a .tfvars file (the values) and a .tfbackend file (where the state is kept) for each environment.
- bootstrap/state-bucket: creates the dev state bucket. Run once, before everything else.
- k8s/nginx.yaml: a test pod and service.
- Root files (main.tf, variables.tf, locals.tf, outputs.tf, providers.tf): pass the inputs to the module.

Why it was built this way
- One module and one small values file per environment, so no code is copied between environments.
- It uses the default VPC and creates our own subnets inside the block allocated to us (172.31.152.0/22), one per availability zone.
- Names follow surname-initial-resource-environment, for example mdemka-t-eks-dev. Tags are set once in locals.tf and applied to every resource.
- Each environment has its own backend file and state key, and the environment variable only accepts dev, qa or prod, so running dev cannot touch qa or prod.

Remote state
State is stored in S3 with native locking (use_lockfile), so no DynamoDB table is needed. The dev bucket is mdemka-t-s3-dev. A bucket cannot hold its own state before it exists, so it is created first from bootstrap/state-bucket, which keeps its state locally. The qa and prod buckets are named in their backend files but are not created.

How to run (dev)
Needs Terraform 1.10 or newer and an AWS login.

1. Create the state bucket (once): go into bootstrap/state-bucket and run terraform init, then terraform apply.
2. From the project folder run: terraform init -reconfigure -backend-config=envs/dev/dev.tfbackend
3. Then run: terraform plan -var-file=envs/dev/dev.tfvars
4. Then run: terraform apply -var-file=envs/dev/dev.tfvars

On Windows PowerShell, put each flag in quotes, for example "-var-file=envs/dev/dev.tfvars", otherwise PowerShell splits it at the dot.

Test the cluster
1. aws eks update-kubeconfig --region af-south-1 --name mdemka-t-eks-dev
2. kubectl get nodes
3. kubectl apply -f k8s/nginx.yaml
4. kubectl get pods (wait until my-pod shows Running)
5. kubectl get nodes -o wide
   Copy the EXTERNAL-IP of the node. This is the node's public address and it is different every time the cluster is created.
6. Open http://EXTERNAL-IP:30007 in a browser, replacing EXTERNAL-IP with the address from step 5. You should see "Welcome to nginx!".

Clean up (EKS costs money every hour)
1. kubectl delete -f k8s/nginx.yaml
2. terraform destroy -var-file=envs/dev/dev.tfvars

qa and prod (reference only)
They use the same commands with their own files. They only differ in size: dev and qa use t3.medium, prod uses t3.large, and the maximum node count is 2 for dev, 3 for qa and 6 for prod. The subnet ranges in qa and prod are placeholders, because our allocated block is used by dev and a separate block would be needed to deploy them.

Assumptions and limitations
- Nodes sit in public subnets with public IPs and there is no NAT gateway. This keeps cost down, but a real production setup would use private subnets.
- The NodePort (30007) is open to everyone so the nginx test works. It can be narrowed with nodeport_allowed_cidrs.
- The person who runs apply is given cluster admin through an EKS access entry.
- The Kubernetes version (1.37) must be offered by EKS in af-south-1. Change kubernetes_version if it is rejected.
- All environments would share one AWS account and one default VPC.
- No credentials are stored in the code.
