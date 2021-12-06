{
  description = "This Nix flake contains NVIDIA-related tools for NixOS.";

  outputs = { self, nixpkgs }:
  {
    packages."x86_64-linux".nvidia-offload = nixpkgs.legacyPackages."x86_64-linux".callPackage ./pkgs/nvidia-offload.nix {};
  };
}
