pragma solidity > 0.7.0;
// SPDX-License-Identifier: UvA-DPP2023

contract SensorDataBasis{
    //   Define a data structure to store sensor data
    struct dataSeries {

        // Other sensor infomation
        uint[] sensorValue;

        // Unix time stamp
        uint[] timeStamp;
    }
    struct SensorData {
        // Name of the sensor
        string sensorName;
        // Type of the sensor
        string sensorType;
        // Other sensor infomation
        dataSeries sensorDataSeries;
        // Gateway ID of the sensor
        uint gatewayID;
        // Sensor deposit
        uint deposit; 
    } 

    // Sensor data mapping
    mapping(uint => SensorData) sensorDataArray;

    //   Define an add sensor data function
    function addSensorData (uint _sensorId, string memory _sensorName, string memory _sensorType, uint  _sensorValue, uint  _gatewayID) 
        public
        payable
        virtual
        returns(bool setupAuctionSuccess)
    {
        sensorDataArray[_sensorId].sensorName = _sensorName;
        sensorDataArray[_sensorId].sensorType = _sensorType;
        sensorDataArray[_sensorId].gatewayID = _gatewayID;
        sensorDataArray[_sensorId].deposit = msg.value;
        sensorDataArray[_sensorId].sensorDataSeries.timeStamp.push(block.timestamp);
        sensorDataArray[_sensorId].sensorDataSeries.sensorValue.push(_sensorValue);

        return true;        
    }

}

// Assignment 2.2.1.b
// Student should fill in the following smart contract, add a new function of getSensorData
contract SensorDataQuery is SensorDataBasis{
    // Students should implement the follow function
    // It will allow a user to obtain a historical data point of sensor ID
    // the timebefore variable here is defined as seconds before the current time;
 
    function getSensorData (uint _sensorId, uint timebefore)
       public
       view
       returns(uint)
    {
      return 0;
    }
}


// Assignment 2.2.1.c
// Student should fill in the following smart contract, add a new function of register sensor
// if possible, override any function from the high level smart contract
contract SensorDataRegister is SensorDataQuery{
    // add your new additional structure here


    // add code of the following function
    function registerSensor (uint _sensorId, string memory _sensorName, string memory _sensorType, uint  _gatewayID)
       public
       payable
       returns(bool)
    {
        return true;
    }


    // update the addSensorData function
    // Question, do we really need all those parameters? Why? Please discuss them also in the report!
    function addSensorData (uint _sensorId, string memory _sensorName, string memory _sensorType, uint  _sensorValue, uint  _gatewayID) 
        public
        virtual
        override
        payable
        returns(bool)
    {
        return true;
    }

}

// Assignment 2.2.2.b
// Student should overid the addSensorData in the SensorDataRegister contract, and 
// try to optimize the gas consumption of the contract. 
// Hints, a smart contract will consume less gas if it changes less variables, executes less code, storess less volumne data;
contract SensorDataRegisterWithStorageOptimization is SensorDataRegister{

     // add code of the following function;
    function addSensorData (uint _sensorId, string memory _sensorName, string memory _sensorType, uint  _sensorValue, uint  _gatewayID) 
        public
        override
        virtual
        payable
        returns(bool)
    {
        return true;
    } 
}


// Optional Assignment 2.2.3.
// Student should fill in the following smart contract, update the addSensorData function, and to optimize the change of storage
// if possible, override any function from the high level smart contract
contract SensorDataRegisterForLargeDataSet is SensorDataRegisterWithStorageOptimization{

 
}
