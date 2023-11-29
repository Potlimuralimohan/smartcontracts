// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOMembership {
    address public Owner;
    uint256 public DaoCount;
    /*
    enum CheckStatue {
        applyForEntry,
        approveEntry
    }
    */
    

    error AlreadyDaoMember();
    error AlreadyApplyForDaoMember();
    error NotAllowed();
    error AlreadyApproved();
    error NotDaoMember();
    error disapprovedCheck();
    error NotApprovedForDao();
    
    
    mapping(address=>bool) public members0fDao;
    mapping (address=>mapping (address=>bool))public approveEntryCheck;
    mapping (address=>mapping (address=>bool))public disapproveEntryCheck;
    mapping (address=>bool)public ApplyForDao;
    mapping(address=>uint)public  ApprovalCount;
    mapping (address=>uint) public disapproveCount;
    mapping (address=>bool) public CheckForDisapproval;


    //CheckStatue  public chek;
    constructor(){
        Owner=msg.sender;
        members0fDao[Owner]=true;
        DaoCount=1;
    }

    //To apply for membership of DAO
    function applyForEntry() public {
        if(CheckForDisapproval[msg.sender]==true){
            revert NotAllowed();
        }
        if(DaoCount<1){
            revert NotAllowed();
        }
        if(members0fDao[msg.sender]==true){
            revert AlreadyDaoMember();
        }
        if(ApplyForDao[msg.sender]==true){
            revert AlreadyApplyForDaoMember();
        }

        ApplyForDao[msg.sender]=true;
        //chek=CheckStatue.applyForEntry;
        //CheckForDisapproval[msg.sender]=true;

    }
    
    //To approve the applicant for membership of DAO
    function approveEntry(address _applicant) public {
        if(CheckForDisapproval[_applicant]==true){
            revert disapprovedCheck();
        }
        if(msg.sender==_applicant || Owner ==_applicant){
            revert NotAllowed();
        }
        /*
        if(ApplyForDao[_applicant] != true){
            revert NotApprovedForDao();
        }
        */
        if(members0fDao[msg.sender]==false){
            revert NotDaoMember();
        }
        if(approveEntryCheck[msg.sender][_applicant]==true){
            revert AlreadyApproved();
        }
        if(disapproveEntryCheck[msg.sender][_applicant]==true){
            revert disapprovedCheck();
        }
        ApprovalCount[_applicant]+=1;
        uint Percentage = (ApprovalCount[_applicant] * 100) / DaoCount;

        if(Percentage >= 30){
            members0fDao[_applicant]=true;
            DaoCount+=1;
        }

        //ELigibleForMembershipDao[_applicant]=true;
        approveEntryCheck[msg.sender][_applicant]=true;
        //ApplyForDao[_applicant]==false;
        //LeaveDaoMemberShip[_applicant]=true;
    }

    //To disapprove the applicant for membership of DAO
    function disapproveEntry(address _applicant) public  {
        if(msg.sender==_applicant || Owner ==_applicant){
            revert NotAllowed();
        }
        if(CheckForDisapproval[_applicant]==true){
            revert NotApprovedForDao();
        }
        if(members0fDao[msg.sender]==false){
            revert NotDaoMember();
        }
        if(disapproveEntryCheck[msg.sender][_applicant]==true){
            revert AlreadyApproved();
        }
        disapproveCount[_applicant]+=1;

        disapproveEntryCheck[msg.sender][_applicant]= true;

        if(DaoCount <= 2){
            if(msg.sender == Owner){
                CheckForDisapproval[_applicant]=true;
            }
        }
         uint Percentage = (disapproveCount[_applicant] * 100) / DaoCount;


        if(Percentage >= 70){
            //members0fDao[_applicant]=false;
            //CheckForDisapproval[_memberToRemove]=true;
            disapproveEntryCheck[msg.sender][_applicant]==true;
            CheckForDisapproval[_applicant]=true;
            //DaoCount-=1;
        }
        //chek==CheckStatue.approveEntry;
        //ApplyForDao[_applicant]==false;
        //CheckForDisapproval[_applicant]=true;


    }

    //To remove a member from DAO
    function removeMember(address _memberToRemove) public {
        if(_memberToRemove == msg.sender){
            revert NotAllowed();
        }
        if(members0fDao[_memberToRemove]==false){
            revert NotDaoMember();
        }
        if(members0fDao[msg.sender]==false){
            revert NotDaoMember();
        }
        if(CheckForDisapproval[_memberToRemove]==true){
            revert NotApprovedForDao();
        }
        disapproveCount[_memberToRemove]+=1;

        uint Percentage = (disapproveCount[_memberToRemove] * 100) / (DaoCount-1);


        if(Percentage >= 70){
            members0fDao[_memberToRemove]=false;
            CheckForDisapproval[_memberToRemove]=true;
            disapproveEntryCheck[msg.sender][_memberToRemove]==true;
            DaoCount-=1;
        }
    }

    //To leave DAO
    function leave() public {
        if(members0fDao[msg.sender]==false){
            revert NotDaoMember();
        }
        members0fDao[msg.sender]=false;
        DaoCount-=1;
        CheckForDisapproval[msg.sender]=true;

    }

    //To check membership of DAO
    function isMember(address _user) public view returns (bool) {
        if(members0fDao[msg.sender]==false){
            revert NotDaoMember();
        }
        if(members0fDao[_user]==true){
            return true;
        }
        else{
            return false;
        }
    }

    //To check total number of members of the DAO
    function totalMembers() public view returns (uint256) {
        if(members0fDao[msg.sender]==false){
            revert NotDaoMember();
        }
        return DaoCount;
    }
}

