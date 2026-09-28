// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;



contract election {
    error TotalAmountShouldBeZero();
    error electionNotChairmanError();
    error Not18Yet();
    error thisCandidateIsDeleted();
    error youAreNotRegistered();
    error votedAlready();
    struct candidate{
        address candidateAddr;
        string candidateName;
        uint256 totalCandidateVote;
}
    bool private isElectionStarted = false;
    address public chairman;
    candidate[] public candidates;

    mapping (address person => uint64 id) public candidateIdToArray;
    mapping (address => bool) public is18Year;
    mapping (uint64 => candidate[]) public candidateInfo;
    mapping (address => bool) public hasVoted;

// Only the inec chairman:
    function createCandidates(address candidateAddr, string memory _name) public{
        //owner
        uint256 totalAmountOfCandidates = 0;
        uint64 id = 0;
        candidateIdToArray[msg.sender] = id;
    // 1st method of error handling:
    // I want to set an instruction that if it isn't 
    //the chairman calling the create
    //candidate function throw 
        require (chairman == msg.sender, "you are a fool, you are not the chairman");
    // 2nd  method to declare error handling
        if (TotalAmountOfCandidates != 0) {
        revert TotalAmountShouldBeZero();
}
        if (candidateAddr != address(0)){
        candidates.push(candidate{
            candidateAddr : candidateAddr,
            candidateName: name,
            totalCandidateVote:totalAmountOfCandidates 
        });
}
    
    
    function getElectionStarted() public{
        // Callable by chairman alone
        // if i want to enforce that the chairman can  call this function, a particular vairable should turn to be true
        if (msg.sender != chairman){
            revert electionNotChairmanError();
        }
        isElectionStarted = true;
    }
    function removeCandidates() public{
        if (msg.sender != chairman){
            revert electionNotChairmanError(); 
        }
        delete candidate[msg.sender];

    }
    function registerVoters(uint16 age address voter) public returns(bool){
        if (voter != chairman){
            revert ;
        }
        if (age <18 ){
            revert Not18Yet();
        }
        is18Year[voter] = true
        return true;
    }
    function vote()(uint64 id, address candidateAdress, uint16 age,address voters) public{
        address candidateAddr
        require(isElectionStarted == true, "wait for your chairman, geElection function is not called yet")
    // 1.  if a candidate is deleted, make sure he can't be voted for
    if (candidateIdToAdress[candidateAdress] == 0){
        revert thisCandidateIsDeleted();
    }
    // 2.  are you registered by the chairman
    if (registeredVoters() == false){
        revert youAreNotRegistered();
    } 
    // 3. people can't vote twice
        // use a mapping to check that an address has voted or not
    if (hasVoted[msg.sender] == true){
        revert votedAlready();
    }
    candidates[id-1].totalCandidateVote = candidates[id-1].totalCandidateVote + 1;
    // for each person that calls the vote function, the candidate he wants to vote for should increase by 1
    // <array name>[index];
    candidates[candidateid].totalCandidateVote +1;
    }
    function winner() private{

    } 
        // getter function
    function getWinner() public view returns(uint256){

    }
    
    
    
    
    
    
    
    
    }
