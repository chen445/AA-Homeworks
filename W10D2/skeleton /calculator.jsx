import React from 'react';

class Calculator extends React.Component{
  constructor(){
    super();
    this.state={num1:"", num2:"", result:0};
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.add = this.add.bind(this);
    this.subtract = this.subtract.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);
    this.clear = this.clear.bind(this);
  }

  setNum1(e) {
    let num1=""
    if (e.target.value!==undefined){
      num1=parseInt(e.target.value)
    }
    this.setState({num1})
  }

  setNum2(e){
     let num2=""
    if (e.target.value!==undefined){
      num2=parseInt(e.target.value)
    }
    this.setState({num2})
  }
  add(e){
    e.preventDefault();
    const result = this.state.num1 + this.state.num2;
    this.setState({ result });
  }

  subtract(e){
    e.preventDefault();
    const result = this.state.num1 - this.state.num2;
    this.setState({result});
  }
  
  multiply(e){
    e.preventDefault();
    const result = this.state.num1 * this.state.num2;
    this.setState({result});
  }
  divide(e){
    e.preventDefault();
    const result = this.state.num1 / this.state.num2;
    this.setState({result});
  }
  
  clear(e){
    e.preventDefault();
    this.state={num1:"", num2:"", result:0};
  }

  render(){
      const{num1,num2,result}=this.state;
    return (
      <div>
        <h1>{result}</h1>
         <input onChange={this.setNum1} value={num1}/>
          <input onChange={this.setNum2} value={num2}/>
          <button onClick={this.add}>+</button>
          <button onClick={this.suntract}>-</button>
          <button onClick={this.multiply}>*</button>
          <button onClick={this.divide}>/</button>
          <button onClick={this.clear}>Clear</button>
      </div>
    );
  }
}

export default Calculator;
