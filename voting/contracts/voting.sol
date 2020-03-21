pragma solidity ^0.5.16;
// 指定代码编译器版本

contract Voting {
    /* 下面的Map等效于字典或散列。
    映射的key是候选人名称(bytes32类型), 值用于存储投票计数(无符号整数)
    */

    mapping (bytes32 => uint8) public votesReceived;

    /* Solidity目前还不允许您在构造函数中传递一个字符串数组.
    我们将使用bytes32数组来存储候选人列表
    */

    bytes32[] public candidateList;

    /* 下面是仅会被调用一次的构造方法.
    当部署合约时, 传入一组等待投票的候选人名单
    */
    constructor(bytes32[] memory candidateNames) public {
        candidateList = candidateNames;
    }


    // 此函数返回候选人到目前为止收到的总票数
    function totalVotesFor(bytes32 candidate) view public returns (uint8) {
        require(validCandidate(candidate));
        return votesReceived[candidate];
    }

    // 此函数会增加指定候选项的投票计数
    // 相当于一次投票
    function voteForCandidate(bytes32 candidate) public {
        require(validCandidate(candidate));
        votesReceived[candidate] += 1;
    }

    function validCandidate(bytes32 candidate) view public returns (bool) {
        for(uint i = 0; i < candidateList.length; i++) {
            if (candidateList[i] == candidate) {
                return true;
            }
        }
        return false;
    }
}