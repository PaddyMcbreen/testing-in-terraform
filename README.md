# `terraform test`

## Summary

## Prerequisites

You should both have Terraform installed on your machines to a minimum version of 1.6.0 to be able to use the `terraform test` command. The latest stable version possible is preferential however.

## Overview

The native `terraform test` framework is a fairly recent feature in Terraform but testing your infrastructure is not a new concept.

Work through the modules in the following order and write terraform code to satisfy the test files for each of the modules.

You can check your code works by being in the directory of each module, intialising each directory with `terraform init`, then finally running `terraform test`.

## Repo

You can find the repo [here](https://github.com/northcoders/ce-terraform-test)

## 1. Here's one I made earlier

Uncomment the tests in the [VPC modules test file](./modules/vpc/tests/vpc_test.tftest.hcl) and create some infrastructure which satisfies the tests.

## 2. Safe, Safe, Safe

Using the tests in the Security Module, create some security rules that pass the test.

## 3. To me, to you

Add some tests for a security group that will allow all **Egress** (traffic that leaves the network) using the already written tests to help you, then write your Terraform code to satisfy it.

## 4. We're all connected

The previous tests are Unit tests: they allow us to check specific config of a module. Modules are rarely used alone however so it's important to test that modules integrate well together such as passing the VPC ID out of the VPC module so it can be applied to the Security group.

Comment back in the tests in `1_vpc_security.tftest.hcl` and get them passing.

🗒️ Note: Modules will often have many many outputs or attributes.

## 5. You're on your own kid

Create a test suite for the EC2 module.

Your test suite should prove that your EC2 module is;

- placed in the correct VPC
- placed in a public subnet
- has the expected configuration

After you have written your tests, create the module for this

🗒️ Note: Unit Tests for the module should be put in the EC2 module test file while Integration Tests should be placed in the root level testing file.

## 6. Yes I'm Changing

Create a root level `terraform.tfvars` and convert your code to use variables from the root level that are then passed throughout your infrastructure whilst still passing your tests.

Try and introduce `variables` blocks in your test files to mock any variables you need at module level.

## Conclusion

Terraform test is a native framework used in this sprint to introduce you to the concept of testing your infrastructure, it is not the only one however. Different testing frameworks will allow you to test different levels of the infrastructure; from figuring out whether a subnet is created correctly to checking whether one EC2 instance can contact another on the desired port.

It is important to always be thinking about how to prove your code, whether that is software code, or infrastructure as code.
