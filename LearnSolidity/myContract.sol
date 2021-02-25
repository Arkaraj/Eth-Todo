// Version
pragma solidity >=0.4.22 <0.9.0;

// Kindda like a class
contract MyContract {
    
    // For constant variables => string public const xyz;
    
    string public value;
    bool public myBool = true;
    int public myInt = 1;
    // Unsigned Integer (Negetive Number)
    //uint public myUnInt = -5;
    // uint8 public myUint8 = 8;
    
    enum State { New, Ready, Run, Terminate }
    State public state;
    
    // Arrays
    Person[] public people;
    
    // Structures
    struct Person {
        uint _id;
        string _firstName;
        int _age;
    }
    
    address Owner;
    
    // Modifiers => Ex. internal
    modifier onlyOwner() {
        // global data msg, meta data
        // require throws err if not true, used for error handling
        require(msg.sender == Owner);
        _;
    }
    
    // # TimeStamps
    // ## Epic Time(seconds)
    // https://www.epochconverter.com/ => Epoch & Unix Timestamp Conversion Tools
    uint256 openingTime = 1614261374;
    
     modifier onlyWhileOpen() {
        
        require(block.timestamp >= openingTime);
        _;
    }
    
    constructor() public {
        value = "Arkaraj";
        state = State.Run;
        Owner = msg.sender;
    }
    uint public PersonCount = 0;
    
    // Maps -- Key Value pair
    mapping(uint => Person) public peolle;
    
    // public is visibility mode 
    //function getValue() public returns(string){
      //  return value;
    //}
    
    function ready() public {
        state = State.Ready;
    }
    
    // Only for viewing 
     function isReady() public view returns(bool) {
        return state == State.Ready;
    }
    
    function addPerson(string memory _firstName, int _age) public onlyOwner onlyWhileOpen{
        increment();
        people.push(Person(PersonCount,_firstName,_age));
        peolle[PersonCount] = Person(PersonCount,_firstName,_age);
    }
    
    function increment() internal {
        PersonCount += 1;
    }

    //function setValue(string _value) public {
        //value = _value;
    //}
    
}