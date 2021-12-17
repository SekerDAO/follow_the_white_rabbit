//import hre, { ethers, network, waffle, deployments } from "hardhat";

import { DeployFunction } from "hardhat-deploy/types";
import { HardhatRuntimeEnvironment } from "hardhat/types";

const deploy: DeployFunction = async function (hre: HardhatRuntimeEnvironment) {
  const { deployments, getNamedAccounts } = hre;
  const { deployer } = await getNamedAccounts();
  const { deploy } = deployments;
  const args = ["Rabbit", "FTWB", "https://gateway.ipfs.io/ipfs/QmSvNMsrakR8AjHb6dzn8cBuPq2EzYT1aSbZaMjydtGmkG"];

  const nft = await deploy("FollowTheWhiteRabbit", {
    from: deployer,
    args,
    log: true,
    deterministicDeployment: true,
  });
  console.log("Rabbit address:", nft.address);
};

deploy.tags = ["nft"];
export default deploy;