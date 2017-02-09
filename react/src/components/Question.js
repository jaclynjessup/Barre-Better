
import React from 'react';

const Question = props => {
  let conditionalAnswer = "";
  let conditionalButton = "fa fa-question-circle fa-2x";
  if (props.specialClass === "selected") {
    conditionalButton += "fa fa-question-circle-o fa-2x selected";
    conditionalAnswer = <li className="answer">{props.answer}</li>
  }

  return(
    <div className="question_answer">
      <li>
        <i onClick={props.handleButtonClick}
        className={conditionalButton}
        aria-hidden="true"
        key={props.id}
        ></i> <span className="question"><strong>{props.question}</strong></span>
      </li>
      {conditionalAnswer}
    </div>
  );
}


export default Question;
