import React from 'react'
import {Navbar, Nav} from 'react-bootstrap'
import {NavLink} from 'react-router-dom'
import { Provider, connect } from 'react-redux';
import { Redirect } from 'react-router'
import { Route } from 'react-router-dom'
import store from './store'
export default function Navigation(props) {
    return(
        <Navbar bg="primary" variant="dark" expand="lg">
            <Navbar.Brand>Newsbee</Navbar.Brand>
            <Navbar.Toggle className="ml-auto" aria-controls="basic-navbar-nav"/>
            <Navbar.Collapse id="basic-navbar-nav" className="justify-content-end">
                <Session />
            </Navbar.Collapse>
        </Navbar>
    )
}


let Session = connect(({ session }) => ({ session }))(({ session, dispatch }) => {
    function logout(ev) {
        ev.preventDefault()
        localStorage.removeItem('session')
        dispatch({
            type: 'LOG_OUT'
        })
        window.location.replace("/")

    }

    if(session) {
        return (
            <Nav className="ml-auto">
          <Nav.Item>
          <p className="text-light py-2">User: {session.user_name}</p>
        </Nav.Item>
	<Nav.Item>
                    <NavLink to="/topics" exact className="nav-link" activeClassName="active">
                        Topics
                    </NavLink>
        </Nav.Item>
        <Nav.Item>
          <a className="nav-link" href="#" onClick={logout}>Logout</a>
        </Nav.Item>
            </Nav>
        )
    } else {
        return (
            <Nav className="ml-auto">
		<Nav.Item>
		    <NavLink to="/" activeClassName="active" exact className="nav-link">Home</NavLink>
		</Nav.Item>
                <Nav.Item>
                    <NavLink to="/register" activeClassName="active" exact className="nav-link">Register</NavLink>
                </Nav.Item>
            </Nav>
        )
    }
})
