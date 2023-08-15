//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ToDoList {
    struct Task {
        uint256 id;
        string content;
        bool completed;
    }

    Task[] public tasks;
    uint256 private s_taskCount;

    // declare events to be emmitted when task are created and completed
    event TaskCreated(uint256 id, string content);
    event TaskCompleted(uint256 id);

    function createTask(string memory _content) public {
        s_taskCount++;
        tasks.push(Task(s_taskCount, _content, false));
        emit TaskCreated(s_taskCount, _content);
    }

    function completedTask(uint256 _id) public {
        require(_id <= s_taskCount, "Task not found");
        Task storage task = tasks[_id - 1];
        task.completed = true;
        emit TaskCompleted(_id);
    }
}
