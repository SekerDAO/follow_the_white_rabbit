import hre, { ethers, network, waffle, deployments } from "hardhat";

import { DeployFunction } from "hardhat-deploy/types";
import { HardhatRuntimeEnvironment } from "hardhat/types";

const deploy: DeployFunction = async function (hre: HardhatRuntimeEnvironment) {
  const { deployments, getNamedAccounts } = hre;
  const { deployer } = await getNamedAccounts();
  const { deploy } = deployments;

  console.log("Deploying contracts with the account:", deployer);

  const seeker = await deploy("SeekersCompetition", {
    from: deployer,
    //args,
    log: true,
    //deterministicDeployment: true,
  });

  console.log("Competition address:", seeker.address);
};

deploy.tags = ["seeker"];
export default deploy;
