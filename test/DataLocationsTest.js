const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("DataLocations", function() {
  let DataLocations;
  let dataLocations;
  
  beforeEach(async function () {
    DataLocations = await ethers.getContractFactory("DataLocations");
    dataLocations = await DataLocations.deploy();
  });

  describe("User management", function() {
    it("should add a new user correctly", async function() {
      await dataLocations.addUser("Alice", 1);
      const user = await dataLocations.users(1);
      expect(user.name).to.equal("Alice");
      expect(user.isActive).to.equal(true);
    });

    it("should update an existing user correctly", async function() {
      await dataLocations.addUser("Bob", true);
      await dataLocations.updateUser("BobChanged", true, 1);
      const user = await dataLocations.users(1);
      expect(user.name).to.equal("BobChanged");
    });

    it("should delete a user correctly", async function() {
      await dataLocations.addUser("Charlie", true);
      await dataLocations.deleteUser(1);
      const user = await dataLocations.users(1);
      expect(user.isActive).to.equal(false);
    });
  });

  describe("Score management", function() {
    beforeEach(async function () {
        await dataLocations.addUser("Dave", true);
    });
    it("should add a score correctly", async function() {
      await dataLocations.addScore(1, 80);
      const score = await dataLocations.getScore(1, 0);
      expect(score).to.equal(80);
    });

    it("should revert user is not active", async function() {
        await expect(dataLocations.addScore(2,80))
            .revertedWith("User is not active");
    })

    it("should transfer score correctly", async function() {
      await dataLocations.addUser("Frank", true);
      await dataLocations.addScore(1, 70);
      await dataLocations.transferScore(1, 2, 0);
      const score = await dataLocations.getScore(2, 0);
      expect(score).to.equal(70);
    });
  });
});
