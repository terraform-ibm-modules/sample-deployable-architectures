# Sample Deployable Architectures

[![Incubating (Not yet consumable)](https://img.shields.io/badge/status-Incubating%20(Not%20yet%20consumable)-red)](https://terraform-ibm-modules.github.io/documentation/#/badge-status)
[![latest release](https://img.shields.io/github/v/release/terraform-ibm-modules/sample-deployable-architectures?logo=GitHub&sort=semver)](https://github.com/terraform-ibm-modules/sample-deployable-architectures/releases/latest)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![Renovate enabled](https://img.shields.io/badge/renovate-enabled-brightgreen.svg)](https://renovatebot.com/)
[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)

This repository contains the following sample deployable architectures:
- [Sample terraform-based deployable architecture without dependencies (fullstack) - COS bucket replication](./solutions/tf-fullstack-da)
- [Sample terraform-based deployable architecture with dependencies (extension) - Serving static websites with IBM Cloud Object Storage](./solutions/tf-extension-da)

:exclamation: These solutions are not intended to be called by one or more other modules since they contain provider configurations, meaning they are not compatible with the `for_each`, `count`, and `depends_on` arguments. For more information see [Providers Within Modules](https://developer.hashicorp.com/terraform/language/modules/develop/providers).

The repository is also configured with the following things:
- [A Github actions common CI pipeline for terraform](./.github/workflows) (more info on the pipeline [here](https://github.com/terraform-ibm-modules/common-pipeline-assets/blob/main/README.md)).
- A [common-dev-assets](./common-dev-assets) git submodule which contains common automation used for CI and development (for more info see [Local development setup](https://terraform-ibm-modules.github.io/documentation/#/local-dev-setup))
- An [ibm_catalog.json](ibm_catalog.json) file which is used for onboarding the sample deployable architectures to the IBM Cloud catalog.
- A [.catalog-onboard-pipeline.yaml](.catalog-onboard-pipeline.yaml) file which is used by an IBM internal pipeline to onboard deployable architectures to the IBM catalog.
- A [renovate.json](renovate.json) file which allows dependency update pull requests to be auto created by the renovate pipeline that runs periodically against all repos in the [terraform-ibm-modules](https://github.com/terraform-ibm-modules) org.

<!-- Leave this section as is so that your module has a link to local development environment set up steps for contributors to follow -->
## Contributing

You can report issues and request features for this module in GitHub issues in the module repo. See [Report an issue or request a feature](https://github.com/terraform-ibm-modules/.github/blob/main/.github/SUPPORT.md).

To set up your local development environment, see [Local development setup](https://terraform-ibm-modules.github.io/documentation/#/local-dev-setup) in the project documentation.
