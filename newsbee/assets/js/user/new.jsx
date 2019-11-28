import React from 'react'
import ReactDom from 'react-dom'
import { connect } from 'react-redux'
import { Form, Container, Button, Alert } from 'react-bootstrap'
import { Redirect } from 'react-router'
import { add_user } from '../ajax'
import store from '../store'

class NewUser extends React.Component {
    constructor(props) {
        super(props)

        this.state = {
            redirect: null
        }
    }

    redirect(path) {
        this.setState({ redirect: path })
    }

    changed(data) {
        this.props.dispatch({
            type: 'CHANGE_NEW_USER', data
        })
    }

    render() {
	if(store.getState().session) {
            return <Redirect to="/" />
        }
	    
        if(this.state.redirect)
            return <Redirect to={this.state.redirect} />

        let {email, name, password, errors} = this.props
        let error_msg = null
        if(errors) {
            error_msg = <Alert variant="danger">{ errors }</Alert>
        }
        return(
            <Container>
                <h1 align="center">Registration</h1>
                { error_msg }
                <Form.Group controlId="name">
                    <Form.Label>Name</Form.Label>
                    <Form.Control type="name" 
                        onChange={(ev) => {this.changed({name: ev.target.value})}}
                    />
                </Form.Group>
                <Form.Group controlId="email">
                    <Form.Label>Email</Form.Label>
                    <Form.Control type="email" 
                        onChange={(ev) => {this.changed({email: ev.target.value})}}
                    />
                </Form.Group>
                <Form.Group controlId="password">
                    <Form.Label>Password</Form.Label>
                    <Form.Control type="password" 
                        onChange={(ev) => {this.changed({password: ev.target.value})}}
                    />
                </Form.Group>
                <Button variant="primary" onClick={() => {add_user(this)}}>Register</Button>
            </Container>
        )
    }

}

function state2props(state) {
    return state.forms.new_user;;
}

export default connect(state2props)(NewUser);

