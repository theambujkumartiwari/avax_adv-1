// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface IERC20 {
    function totalSupply() external view returns (uint);
    function balanceOf(address account) external view returns (uint);
    function transfer(address recipient, uint amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint);
    function approve(address spender, uint amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint amount) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
}

contract Vault {
    IERC20 public immutable token;

    uint public totalSupply;
    mapping(address => uint) public balanceOf;

    event Deposit(address indexed user, uint amount, uint shares);
    event Withdraw(address indexed user, uint shares, uint amount);

    constructor(address _token) {
        token = IERC20(_token);
    }

    function _mint(address _to, uint _shares) private {
        totalSupply += _shares;
        balanceOf[_to] += _shares;
    }

    function _burn(address _from, uint _shares) private {
        totalSupply -= _shares;
        balanceOf[_from] -= _shares;
    }

    function deposit(uint _amount) external {
        require(_amount > 0, "Vault: deposit amount must be greater than zero");
        uint shares;
        uint balance = token.balanceOf(address(this));
        if (totalSupply == 0) {
            shares = _amount;
        } else {
            shares = (_amount * totalSupply) / balance;
        }
        require(shares > 0, "Vault: shares must be greater than zero");

        _mint(msg.sender, shares);
        token.transferFrom(msg.sender, address(this), _amount);
        emit Deposit(msg.sender, _amount, shares);
    }

    function withdraw(uint _shares) external {
        require(_shares > 0, "Vault: withdraw shares must be greater than zero");
        require(balanceOf[msg.sender] >= _shares, "Vault: insufficient shares");

        uint amount = (_shares * token.balanceOf(address(this))) / totalSupply;
        _burn(msg.sender, _shares);
        token.transfer(msg.sender, amount);
        emit Withdraw(msg.sender, _shares, amount);
    }
}
