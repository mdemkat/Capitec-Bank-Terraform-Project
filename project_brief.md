# Project Brief: Multi-Environment EKS Deployment with Terraform

## Overview

You have completed the Terraform on AWS training and will now apply what you've learned to a realistic infrastructure project. Working individually or in your assigned group, you will design and build a Terraform project that provisions an **Amazon EKS (Elastic Kubernetes Service) cluster** across **three environments: `dev`, `qa`, and `prod`**.

This project is intentionally open-ended. You are being assessed on your ability to structure a real-world Terraform codebase, manage environment separation safely, and make sound infrastructure decisions — not on following a prescribed recipe. No solution or reference architecture will be provided. You are expected to research, design, and justify your own approach.

---

## Objectives

By the end of this project, you should be able to demonstrate:

1. A working understanding of Terraform project structure for multi-environment deployments.
2. Safe and correct use of **remote state** and **remote backends**, isolated per environment.
3. The ability to provision a functioning EKS cluster (control plane + worker nodes) via Terraform.
4. Sound use of variables, modules, and environment-specific configuration to avoid code duplication.
5. An understanding of the operational and security implications of your design choices.

---

## Functional Requirements

Your project must satisfy the following:

### 1. Environments
- Three distinct environments must be supported: **dev**, **qa**, and **prod**.
- Each environment must be deployable and destroyable **independently** of the others.
- A change or failure in one environment must not affect the state or infrastructure of another.

### 2. Remote State & Backends
- Each environment must use its **own remote state file** — state must not be shared or mixed between environments.
- State must be stored remotely (not locally), using a backend of your choice available in AWS.
- Your backend configuration must support **state locking** to prevent concurrent modification issues.
- Consider (and be ready to explain) how your backend infrastructure itself gets created — this is a classic bootstrapping problem in Terraform projects.

### 3. EKS Cluster
- Each environment must provision a functioning EKS cluster, including:
  - The EKS control plane
  - A worker node group (or equivalent compute for running workloads)
  - The necessary supporting networking (VPC, subnets, routing, etc.)
  - The necessary IAM roles and policies for the cluster and nodes to function
- You may reasonably vary configuration between environments (e.g., instance sizes, node counts, single vs multi-AZ) — this is expected and should be a deliberate design decision, not an oversight.

### 4. Code Structure
- Your code should avoid unnecessary duplication across environments. Think carefully about how to reuse logic while still allowing environment-specific configuration.
- Your repository structure should make it obvious which environment a given `terraform plan`/`apply` will target.
- Sensitive or environment-specific values should not be hardcoded where avoidable.

### 5. Documentation
Your submission must include a `README.md` that explains:
- How your project is structured and why.
- How to initialize and deploy each environment.
- How your remote state/backend strategy works.
- Any assumptions, trade-offs, or known limitations of your design.

---

## Non-Functional Expectations

- **Consistency:** Naming conventions, tagging, and formatting should be consistent across the codebase.
- **Safety:** It should not be possible to accidentally run a `dev` configuration against `prod` state or resources.
- **Idempotency:** Repeated `terraform apply` runs with no changes should result in no infrastructure drift.
- **Clean teardown:** `terraform destroy` should be able to cleanly remove all resources for a given environment without manual cleanup, where reasonably possible.

---

## Constraints

- All infrastructure must be defined as code — no manual ("ClickOps") creation of resources in the AWS Console.
- Use only AWS-native services for hosting your remote state and cluster infrastructure.
- Your code must run using a Terraform version compatible with what was covered in training.
- Credentials, secrets, and account-specific identifiers must **not** be committed to version control.

---

## Deliverables

1. A Git repository (or zip file naming: <surname><first_initial>-terraform) containing your complete Terraform project.
2. A `README.md` as described above.
3. Evidence that each environment can be independently planned and applied (screenshots) 


---

## Suggested Areas to Research

You are encouraged to investigate the following topics as you design your solution (this list is a starting point, not a checklist):

- Approaches to organizing Terraform code for multiple environments
- Options for remote state storage and locking on AWS
- Strategies for parameterizing environment-specific values
- Reusable Terraform modules vs. duplicated configuration
- IAM permissions required for EKS cluster creation and management
- Networking prerequisites for EKS (VPC design, subnet tagging requirements, etc.)

---

## Evaluation Criteria

You will be assessed on:

| Area | What we're looking for |
|---|---|
| Environment isolation | Clean separation of dev/qa/prod state and infrastructure |
| Remote backend setup | Correct, secure, and working remote state configuration per environment |
| Cluster functionality | EKS cluster successfully provisions and is usable |
| Code quality & structure | Readable, DRY, sensibly organized code |
| Documentation | Clear README that another trainee could follow |


---

## Submission

Submit your repository link or zip_file via email to the following email addresses (include all email addresses): thapelo.seema@geeks4learning.com, hullet.matjiu@geeks4learnig.com, farzanabadaron@capitecbank.co.za by 27/07/2026 23:59.