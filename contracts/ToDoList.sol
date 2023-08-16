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

    function getTaskCount() public view returns (uint256) {
        return s_taskCount;
    }

    function getTask(uint256 _id) public view returns (Task memory) {
        require(_id <= s_taskCount, "Task not found");
        return tasks[_id - 1];
    }

    // The Task memory in the function's return type means that the function will return a Task struct that is stored in memory. The use of memory here indicates that the returned Task struct is temporary and only exists for the duration of the function call.
    // This is a good practice because it prevents unnecessary modification of the contract's state when retrieving data. Since you're only reading data from the tasks array, using memory helps optimize gas costs and ensures that the contract's state remains unchanged.
}
