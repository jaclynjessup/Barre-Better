import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App';
import data from './constants/data';

$(function() {
  let reactAppElement = document.getElementById('app');
  if (reactAppElement) {
    ReactDOM.render(
      <App data={data} />,
      reactAppElement
    );
  };
});
