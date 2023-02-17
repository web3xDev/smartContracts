// SPDX-License-Identifier: MIT

// Web3 Developer resume as a Solidity smart contract

pragma solidity ^0.8.7;

contract Web3DevResume {

    string public name;

    string public summary;

    struct Education {
        string university;
        string degree;
        string graduationDate;
    }

    Education public education;

    struct WorkExperience {
        string company;
        string role;
        string startDate;
        string endDate;
    }

    WorkExperience[] private workExperiences;
    
    string[] private skills_;
    string[] private awards_;
    string[] private certificates_;

    constructor(string memory _name, string memory _university, string memory _degree, string memory _graduationDate) {
        name = _name;
        education = Education(_university, _degree, _graduationDate);
    }

    function skills() public view returns (string[] memory) {
        return skills_;
    }

    function awards() public view returns (string[] memory) {
        return awards_;
    }

    function certificates() public view returns (string[] memory) {
        return certificates_;
    }

    function workExperiences_() public view returns (string[] memory companies, string[] memory roles, string[] memory startDates, string[] memory endDates) {
        companies = new string[](workExperiences.length);
        roles = new string[](workExperiences.length);
        startDates = new string[](workExperiences.length);
        endDates = new string[](workExperiences.length);

            for (uint i = 0; i < workExperiences.length; i++) {
                companies[i] = workExperiences[i].company;
                roles[i] = workExperiences[i].role;
                startDates[i] = workExperiences[i].startDate;
                endDates[i] = workExperiences[i].endDate;
            }
    }

    function addSummary(string memory _summary) public {
        summary = _summary;
    }

    function addWorkExperience(string memory _company, string memory _role, string memory _startDate, string memory _endDate) public {
        workExperiences.push(WorkExperience(_company, _role, _startDate, _endDate));
    }
    
    function addSkill(string memory _skill) public {
        skills_.push(_skill);
    }

    function addAward(string memory _award) public {
        awards_.push(_award);
    }
    
    function addCertificate(string memory _certificate) public {
        certificates_.push(_certificate);
    }
    
}