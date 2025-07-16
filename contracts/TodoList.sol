// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TodoList {
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    function getTodo(uint _index) public view returns (string memory, bool) {
        return (todos[_index].text, todos[_index].completed);
    }

    function getTodoCount() public view returns (uint) {
        return todos.length;
    }

    function create(string memory _text) public {
        todos.push(Todo({
            text: _text,
            completed: false
        }));
    }

    function toggleCompleted(uint _index) public {
        todos[_index].completed = !todos[_index].completed;
    }
}
