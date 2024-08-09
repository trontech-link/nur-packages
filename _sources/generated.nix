# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  bttc = {
    pname = "bttc";
    version = "v1.1.0";
    src = fetchFromGitHub {
      owner = "bttcprotocol";
      repo = "bttc";
      rev = "v1.1.0";
      fetchSubmodules = true;
      sha256 = "sha256-GQZGMhLu7PM8h6km4aADjYfCy43yVdwGePaLKAk9Be4=";
    };
  };
  combobulate = {
    pname = "combobulate";
    version = "ee82c568ad639605518f62f82fae4bcc0dfdbb81";
    src = fetchgit {
      url = "https://github.com/mickeynp/combobulate.git";
      rev = "ee82c568ad639605518f62f82fae4bcc0dfdbb81";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-rww0/6304xZWTFRo1BVcfSDdXOXtlgmfZOxAoOIjYsk=";
    };
    date = "2024-03-11";
  };
  copilot-chat = {
    pname = "copilot-chat";
    version = "v1.0.1";
    src = fetchFromGitHub {
      owner = "chep";
      repo = "copilot-chat.el";
      rev = "v1.0.1";
      fetchSubmodules = false;
      sha256 = "sha256-vuIO6nM2JrYXUxEotmChYQNyWAsU7MJ2DXuHmAvyViQ=";
    };
  };
  copilot-el = {
    pname = "copilot-el";
    version = "3af3a5f8877fd5c6c55454f5c5bf076a56608939";
    src = fetchgit {
      url = "https://github.com/zerolfx/copilot.el.git";
      rev = "3af3a5f8877fd5c6c55454f5c5bf076a56608939";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-xT8++/EFo/OGqZwSxbzckOdcuhQqeRUt8VoN3fyA0dg=";
    };
    date = "2024-08-05";
  };
  delivery = {
    pname = "delivery";
    version = "v1.0.8";
    src = fetchFromGitHub {
      owner = "bttcprotocol";
      repo = "delivery";
      rev = "v1.0.8";
      fetchSubmodules = true;
      sha256 = "sha256-YB+tDVToqmKCkSp/mC75+Jtl/yHG5x5h+GDgLS3c8IU=";
    };
  };
  gitops = {
    pname = "gitops";
    version = "v0.38.0";
    src = fetchFromGitHub {
      owner = "weaveworks";
      repo = "weave-gitops";
      rev = "v0.38.0";
      fetchSubmodules = false;
      sha256 = "sha256-Gm4DIQK8T+dTwB5swdrD+SjGgy/wFQ/fJYdSqNDSy9c=";
    };
  };
  glab = {
    pname = "glab";
    version = "e455e6f2c620e58d14e537e8f31e431d87a8563d";
    src = fetchgit {
      url = "https://gitlab.com/gitlab-org/cli.git";
      rev = "e455e6f2c620e58d14e537e8f31e431d87a8563d";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-jiMM+ZT/ueZDHzj83OTCCicarpoqtzvF3EupVxJm3Ng=";
    };
    date = "2024-08-06";
  };
  gotron-sdk = {
    pname = "gotron-sdk";
    version = "v2.3.0";
    src = fetchFromGitHub {
      owner = "fbsobreira";
      repo = "gotron-sdk";
      rev = "v2.3.0";
      fetchSubmodules = false;
      sha256 = "sha256-8n+xkvcyWpcOSzOcnIJncC7svZ5LJccXi1XTx0S3RmU=";
    };
  };
  helmify = {
    pname = "helmify";
    version = "v0.4.13";
    src = fetchFromGitHub {
      owner = "arttor";
      repo = "helmify";
      rev = "v0.4.13";
      fetchSubmodules = false;
      sha256 = "sha256-3gz75S7u/Gli7yHktNUIPveib+J0mFaizMKaloJKMWs=";
    };
  };
  java-tron-full-node = {
    pname = "java-tron-full-node";
    version = "GreatVoyage-v4.7.5";
    src = fetchurl {
      url = "https://github.com/tronprotocol/java-tron/releases/download/GreatVoyage-v4.7.5/FullNode.jar";
      sha256 = "sha256-riyjWg+SuAKB3RVU4q1TPOb//9L5oD39VMXu187atZ0=";
    };
  };
  java-tron-solidity-node = {
    pname = "java-tron-solidity-node";
    version = "GreatVoyage-v4.7.5";
    src = fetchurl {
      url = "https://github.com/tronprotocol/java-tron/releases/download/GreatVoyage-v4.7.5/SolidityNode.jar";
      sha256 = "sha256-ABJmNgs1EMDjNGTz1HmJ0/R8TWy9e7CXP6m2Q24MU9Q=";
    };
  };
  korb = {
    pname = "korb";
    version = "v2.3.2";
    src = fetchFromGitHub {
      owner = "BeryJu";
      repo = "korb";
      rev = "v2.3.2";
      fetchSubmodules = false;
      sha256 = "sha256-4f5Ii75Pc+88ONiEWAQG7A6NaKvQ5/1jqu3O0f7AaVI=";
    };
  };
  launch = {
    pname = "launch";
    version = "03b0ae39df1ed44c58f403030fa7a49927837c46";
    src = fetchgit {
      url = "https://github.com/bttcprotocol/launch.git";
      rev = "03b0ae39df1ed44c58f403030fa7a49927837c46";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-u3OGkahP2/eXy2EiLJ9Xu0TbOk/hYreTmIeGfOJznBU=";
    };
    date = "2023-04-13";
  };
  librime-lua = {
    pname = "librime-lua";
    version = "7be6974b6d81c116bba39f6707dc640f6636fa4e";
    src = fetchgit {
      url = "https://github.com/hchunhui/librime-lua.git";
      rev = "7be6974b6d81c116bba39f6707dc640f6636fa4e";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-jsrnAFE99d0U0LdddTL7G1p416qJfSNR935TZFH3Swk=";
    };
    date = "2024-05-19";
  };
  magit-gitflow = {
    pname = "magit-gitflow";
    version = "cc41b561ec6eea947fe9a176349fb4f771ed865b";
    src = fetchgit {
      url = "https://github.com/jtatarik/magit-gitflow.git";
      rev = "cc41b561ec6eea947fe9a176349fb4f771ed865b";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-LqBvn+Ev8GsZG6zmQ5eGt+5vDQk5ywqvagrvnzNP5ks=";
    };
    date = "2017-09-29";
  };
  magit-town = {
    pname = "magit-town";
    version = "4ce962e6e2d8249d3a5aa4c40e9924a424b50ebf";
    src = fetchgit {
      url = "https://github.com/natecox/magit-town.git";
      rev = "4ce962e6e2d8249d3a5aa4c40e9924a424b50ebf";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-dcLarzN9miAxzW9IP3IECxjRuShR/D3m5eU7vV6YE+A=";
    };
    date = "2019-04-02";
  };
  my2sql = {
    pname = "my2sql";
    version = "1ff5d20e854fd7be43ff07c88358fe3754f29af0";
    src = fetchurl {
      url = "https://github.com/liuhr/my2sql/raw/master/releases/centOS_release_7.x/my2sql";
      sha256 = "sha256-ggsA5U6AgszBuwAipX8BSuQSA0o67GDnkTZNkHhPpfo=";
    };
    date = "2022-11-27";
  };
  org-cv = {
    pname = "org-cv";
    version = "dd2f840050f37cf5cb02e683f9434445288f7627";
    src = fetchgit {
      url = "https://gitlab.com/Titan-C/org-cv.git";
      rev = "dd2f840050f37cf5cb02e683f9434445288f7627";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-7YlJTQr2t1UNl1HJJxNoq8Yu8sfRxehXncH85cuPchU=";
    };
    date = "2024-03-30";
  };
  tron-deployment = {
    pname = "tron-deployment";
    version = "14699a3d5348efdd84a54da023b955f163b2483d";
    src = fetchgit {
      url = "https://github.com/tronprotocol/tron-deployment.git";
      rev = "14699a3d5348efdd84a54da023b955f163b2483d";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-zFcMgzwIYvlq7yBttqWfj/aoqosQV13jaB0w/7Hp8FE=";
    };
    date = "2024-03-21";
  };
}
