// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract TodoList {
    uint256 public taskCount = 0;

    struct Task {
        uint id;
        string content;
        bool completed;
    }
    // Kinda like a database
    mapping (uint => Task) public tasks;

    constructor(){
        createTask("This is for testing purpose");
    }
    
    function createTask(string memory _content) public {
        taskCount ++;
        tasks[taskCount] = Task(taskCount, _content, false);
    }


}
