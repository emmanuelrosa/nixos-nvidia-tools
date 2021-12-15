# nixos-nvidia-tools

NOTICE: This repository has been replaced by https://github.com/emmanuelrosa/erosanix.

This Nix flake contains NVIDIA-related tools for NixOS.

## Installation (in configuration.nix) using flakes

```
inputs.nvidia-tools.url = "github:emmanuelrosa/nixos-nvidia-tools";
inputs.nvidia-tools.inputs.nixpkgs.follows = "nixpkgs";
```

## Packages

### nvidia-offload

The `nvidia-offload` package produces a shell script which sets the environment variables necessary for enabling _offload rendering_. It's meant to be used when launding applications:

```
nvidia-offload glxgears
```

The package includes parameters to override the default environment variable values:

```
environment.systemPackages = with pkgs; [
    ...
    (nvidia-offload.override {
      provider = "NVIDIA-G0",
      glxVendor = "nvidia",
      vkLayer = "NVIDIA_only"
    })
};
```

Refer to NVIDIA's documentation for information regarding the values for the environment variables: https://download.nvidia.com/XFree86/Linux-x86_64/470.86/README/primerenderoffload.html
