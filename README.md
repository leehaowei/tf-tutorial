### Learning Resources
- [Terraform Tutorials for Beginners | by Anton Putra](https://youtu.be/6XSroskdCF0?si=rLIDNkoW7Wu-U-vg)
- [Terraform and Kubernetes | by Justin Mitchel](https://youtu.be/D-Q2qXTssLY?si=IQ3rjNvUlBvGArs3)

### Terraform Version Management
- [tfenv](https://github.com/tfutils/tfenv)

### Terraform Provider Resource Documentation
- [aws](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)
- [linode](https://registry.terraform.io/providers/linode/linode/latest/docs/resources/instance)

### Potential Error

Error from Terraform on Apple Silicon machine
```log
Error: Failed to load plugin schemas

Error while loading schemas for plugin components: Failed to obtain provider schema: Could not load the schema for provider registry.terraform.io/hashicorp/aws: failed to instantiate provider "registry.terraform.io/hashicorp/aws" to obtain schema: Unrecognized remote plugin message:

This usually means that the plugin is either invalid or simply
needs to be recompiled to support the latest protocol...
```
- Solution:
1. Ensure the terraform installed comes with `arm64` instead of `amd64`

    example of reinstalling terraform with `tfenv`
    ```bash
    TFENV_ARCH=arm64 tfenv install <TARGET_VSERSION>
    tfenv use <TARGET_VSERSION>
    ```

2. Set the environment variable `GODEBUG=asyncpreemptoff=1` for terraform

    [direnv](https://github.com/direnv/direnv) could make your life easier setting environment variables
    ```bash
    export AWS_ACCESS_KEY_ID=<YOUR_AWS_KEY_ID>
    export AWS_SECRET_ACCESS_KEY=<YOUR_AWS_SECRET>
    export GODEBUG=asyncpreemptoff=1
    ```
- Solution Reference:
    [苹果M1上的Terraform间歇性错误](https://cloud.tencent.com/developer/ask/sof/107136125)