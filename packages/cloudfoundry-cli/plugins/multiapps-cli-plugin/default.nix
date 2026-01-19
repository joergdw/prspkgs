{
  lib,

  buildGoModule,
  fetchFromGitHub
}: buildGoModule rec {
  pname = "CF Deploy Plugin";
  version = "3.5.0";

  src = fetchFromGitHub {
    owner = "cloudfoundry";
    repo = "multiapps-cli-plugin";
    rev = "v${version}";
    hash = "sha256-SVPVPJJWOk08ivZWu9UwD9sIISajIukQpcFpc0tU1zg=";
  };
  vendorHash = "sha256-S066sNHhKxL4anH5qSSBngtOcAswopiYBXgKAvHyfAM=";

  env.CGO_ENABLED = 0;
  ldflags = ["-w -X main.Version=${version}"];

  meta = with lib; {
    description = "";
    longDescription = ''
      This is a Cloud Foundry CLI plugin (formerly known as CF MTA Plugin) for performing
        operations on
        [Multitarget Applications (MTAs)](<https://www.sap.com/documents/2021/09/66d96898-fa7d-0010-bca6-c68f7e60039b.html>)
        in Cloud Foundry, such as deploying, removing, viewing, etc. It is a client for the
        [CF MultiApps Controller](<https://github.com/cloudfoundry-incubator/multiapps-controller>)
        (known also as CF MTA Deploy Service), which is an MTA deployer implementation for Cloud
        Foundry. The business logic and actual processing of MTAs happens into
        CF MultiApps Controller backend.
    '';
    homepage = "https://github.com/cloudfoundry/multiapps-cli-plugin";
    license = licenses.asl20;
  };
}
