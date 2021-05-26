import React from 'react';
import { Provider } from 'react-redux';
import GiphysSearchContainer from './giphys_search_container';
import{fetchSearchGiphys} from '../util/api_util';
import configureStore from '../store/store';
import receiveSearchGiphys from '../actions/giphy_actions';



document.addEventListener('DOMContentLoaded', () => {
	const store = configureStore();
    window.store = store
    window.receiveSearchGiphys = receiveSearchGiphys;
	const root = document.getElementById('root');
	ReactDOM.render(<Root store={store} />, root);
});