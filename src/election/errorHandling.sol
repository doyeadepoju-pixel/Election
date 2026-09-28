// I want only the chairman to be able to create a candidate
error TotalAmountShouldBeZero;
// actor chairman
address chairman = 0x7762Aee717F4cc6e93aa9dd64396142d63f21164;
uint256 maxAmountOfVotes = 34;
function createCandidates() public{
    uint256 totalAmountOfCandidates = 0;
    // 1st method of error handling:
// I want to set an instruction that if it isn't 
//the chairman calling the create
//candidate function throw 
require (chairman == msg.sender, "you are a fool, you are not the chairman");
// 2nd  method to declare error handling
if (TotalAmountOfCandidates != 0) {
    revert TotalAmountShouldBeZero();
}
}