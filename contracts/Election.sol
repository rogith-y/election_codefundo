pragma solidity ^0.5.0;

contract Election {

    struct Candidate {
    	uint id;
    	string name;
		string party;
    	uint voteCount;
    }
    
    mapping(address => bool)public voters;
    mapping(uint => Candidate) public candidates;

    uint public candidatesCount;

    event votedEvent (
    	uint indexed _candidateId
    	);

    constructor () public {
   		addCandidate("Candidate 1","Party 1");
   		addCandidate("Candidate 2","Party 2");
		addCandidate("Candidate 3","Party 3");
   		addCandidate("Candidate 4","Party 4");
		addCandidate("Candidate 5","Party 5");
    }

    function addCandidate (string memory _name,string memory _party) private {
    	candidatesCount ++;
    	candidates[candidatesCount] = Candidate(candidatesCount,_name,_party,0);
    }

    function vote (uint _candidateId) public{
    	require(!voters[msg.sender]);
    	require(_candidateId >0 && _candidateId <= candidatesCount);
    	voters[msg.sender] = true;
    	candidates[_candidateId].voteCount++;
    	emit votedEvent(_candidateId);
    }
}