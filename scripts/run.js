const main = async () => {
    const nftContractFactory = await hre.ethers.getContractFactory('StickFigureDevelopersNFT');
    const nftContract = await nftContractFactory.deploy();
    await nftContract.deployed();
    console.log("contract deployed to:", nftContract.address);
    
    // for (let i = 0; i < 3; i++) {
    //   let randColor = await nftContract.randHexColor(1,i.toString());
    //   console.log("random hex color is %s", randColor);
    // }
    let txn;
    
    for (let i = 0; i < 30; i++) {
      txn = await nftContract.createDeveloper();
      await txn.wait();
      console.log("minted NFT %s", i);
    }
    
  };
  
  const runMain = async () => {
    try {
      await main();
      process.exit(0);
    } catch (error) {
      console.log(error);
      process.exit(1);
    }
  };
  
  runMain();
  