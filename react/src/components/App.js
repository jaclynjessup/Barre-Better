import React, {Component} from 'react';
import Question from './Question.js'

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      clickedButtonId: null,
    }

    this.handleButtonClick = this.handleButtonClick.bind(this)
  }

  handleButtonClick(id) {
    if (this.state.clickedButtonId === id) {
      this.setState({ clickedButtonId: null });
    } else {
      this.setState({ clickedButtonId: id });
    }

  }

  render() {
    let questions = this.props.data.map(question => {
      let specialClass;

      if (question.id === this.state.clickedButtonId) {
        specialClass = "selected"
      }

      let onQuestionClick = () => this.handleButtonClick(question.id)
      return (
        <Question
          key={question.id}
          question={question.question}
          answer={question.answer}
          specialClass={specialClass}
          handleButtonClick={onQuestionClick}
        />
      )
    });

    return (
      <div className="whatis-container">
        <div className="heading text-center"><h2>What is Barre?</h2></div>
        <ul>
          {questions}
        </ul>
      </div>
    )
  }
}
export default App;
