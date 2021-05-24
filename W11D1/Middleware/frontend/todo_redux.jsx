import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  let store = configureStore(preloadedState);
  // store= applyMiddlewares(store,addLoggingToDispatch);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});

// function addLoggingToDispatch(store){
//   let dispatch=store.dispatch;
//   return function(action){
//     console.log(store.getState());
//     console.log(action);
//     dispatch(action);
//     console.log(store.getState())
//   }
// }

// function applyMiddlewares(store,...middlewares){
//   let dispatch=store.dispatch;
//   middlewares.forEach(middleware=>{
//     dispatch = middleware(store)(dispatch);
//   })
//   return Object.assign({}, store, { dispatch })
// }

