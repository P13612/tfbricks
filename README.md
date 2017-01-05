# AWSBRICKS
## Terraform and Ansible Bricks

Cloud computing requires sundry tools. In a larger group of users it
is not only required to aggree upon these tools, but as well how to use
these tools. Building infrastructures and mandatory functional
components are very often business logic free. For all those elements
predefinded and optimized buidling blocks can be provided. Such
building blocks can serve as a common best practice concept.
Building blocks in addition may regularily be reviewed and checked for
complience to company rules, regulations and provisions.

This dictionary is all about such a set of components. Code to build
infrastructure is provided in Terraform with the complete folder
hirarchy which is recommended to conform Terraform best practices.
Code to provide computer functionality like, OS hardening, setting up
and configuring database clients, complete functionality like reverse
proxies or clusered filesystems are provided in Packer or Ansible or
even both organized in best practice manner recommended by Ansible.
</p>

<p>
For the complete set of BRICKs go <a href="#">here</a>
</p>

## How to use the brick dictionary?

The brick dictionary contains complete terraform and Ansible scripts
organized in a way either Terraform or Ansible suggest as "best
practice". Terraform scripts are organized in the hierarchical tree
structure representing the logical hierarchical dependency between
components. You can load the terraform infrastructure sets called
MORTAR as tarballs or zip-files from the <a href="#">BRICKs pages</a> and activate
them with <tt>terraform get infrastructure</tt>.

```
.
└── terraform
    └── REGION
        └── development
            ├── infrastructure
            │   └── vpc.tf
            ├── variables.tf
            └── terraform.tfvars
```

Ansibe roles in Packer are organized in folder trees suggested by Ansible
as "best practice".

```
.
└── packer
    └── ansible
        └── roles
            └── myFeature
            	├── files
            	├── tasks
            	├── handlers
            	└── templates
```

Packer and Terraform scripts may seamlessly be combined in one single
project folder. Each building block for additional features may be
combined with your existing folder structure and scripts without
collision. The bricks instead will litterally fit together like LEGO
bricks. Complex BRICKs are delivered in right this structure.

```
.
├── packer
│   └── ansible
│       └── roles
│           └── myFeature
│           	├── files
│           	├── tasks
│           	└── templates
└── terraform
    └── REGION
        └── development
            ├── infrastructure
            │   └── vpc.tf
            ├── variables.tf
            └── terraform.tfvars
```

Terraform scripts and Packer Ansible scripts may be stacked. You can
load Terraform scripts and unfold them in your existing infrastructure
folder tree. The additional Terraform script will seamlessly fit into
your Terraform scripts already loaded and may be used immediatly without
manual intervention. You may even extend these scripts manually with your
own scripts and extensions. 


The same is true for Packer Ansible scripts. Those as well do not
overwrite your existing scripts, instead one can load one feature and
the next and so on and configure your instance with as many features as
you like by simply loading the feature-brick from this brick
dictionary.


References:
https://books.google.de/books?id=UcZ-DAAAQBAJ&pg=PT64&lpg=PT64&dq=Methoden+und+Trends+der+Softwareentwicklung+java&source=bl&ots=JWvvgwG1xJ&sig=KK1PL_javqBmS-Qd-C4kD5wK-AY&hl=en&sa=X&ved=0ahUKEwjBmYiPj6vRAhWKIsAKHSCKC_AQ6AEILTAC#v=onepage&q=Methoden%20und%20Trends%20der%20Softwareentwicklung%20java&f=false