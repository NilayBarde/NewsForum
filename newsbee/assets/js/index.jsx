import React from 'react'
import ReactDom from 'react-dom'
import {BrowserRouter as Router, Switch, Route, NavLink, Link} from 'react-router-dom'
import { Provider, connect } from 'react-redux';

import Navigation from './navbar'
import Login from './login'

import TopicsDashboard from './topics/topics'
import NewTopic from './topics/new'
import ShowTopic from './topics/show'
import store from './store'

import NewUser from './user/new'

export default function init(root) {
    let tree = (
        <Provider store={store}>
            <Index />
        </Provider>
    )
    ReactDom.render(tree, root)
}

function Index(props) {
    return (
        <Router>
            <Navigation />
            <Switch>
                <Route exact path="/">
                    <Login />
                </Route>
                <Route exact path="/register">
                    <NewUser />
                </Route>
	        <Route exact path="/new_topic">
	            <NewTopic />
	        </Route>
	        <Route exact path="/topics/">
	            <TopicsDashboard />
	        </Route>
	        <Route path="/show_topic/:id" component={ShowTopic}>
                </Route>
            </Switch>
        </Router>
    )
}
