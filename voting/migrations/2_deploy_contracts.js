var Voting = artifacts.require("voting.sol");
module.exports = function(deployer) {
  deployer.deploy(Voting, ['Rama', 'Nick', 'Jose'].map(x => web3.utils.asciiToHex(x)), {gas: 5000000});
};
/* 部署方法第一个参数是合约的路径, 然后是构造函数的参数. 在我们的例子中, 只有一个参数: 一系列候选人名单. 第三个参数是一个字典, 我们指定部署代码所需的gas. Gas值取决于合同的大小.
*/