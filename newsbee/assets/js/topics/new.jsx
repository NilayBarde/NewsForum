import React from 'react'
import ReactDom from 'react-dom'
import { connect } from 'react-redux'
import { Form, Container, Button, Alert } from 'react-bootstrap'
import { Redirect } from 'react-router'
import store from '../store'

import { add_topic } from '../ajax'

class NewTopic extends React.Component {
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
            type: 'CHANGE_NEW_TOPIC', data
        })
    }

    render() {

        if(!store.getState().session) {
            return <Redirect to="/" />
        }

        if(this.state.redirect)
            return <Redirect to={this.state.redirect} />

        let {title, errors, user_id} = this.props
        let error_msg = null
        if(errors) {
            error_msg = <Alert variant="danger">{ errors }</Alert>
        }
	this.changed({ user_id: store.getState().session.user_id })
        return(
            <Container>
                <h1 align="center">New Topic</h1>
                { error_msg }
                <Form.Group controlId="title">
                    <Form.Label>Title</Form.Label>
                    <Form.Control type="text" 
                        onChange={(ev) => {this.changed({title: ev.target.value})}}
                    />
                </Form.Group>
		<Button variant="primary" onClick={() => {add_topic(this)}}>Create</Button>
            </Container>
        )
    }

}

function state2props(state) {
    return state.forms.new_topic;
}

export default connect(state2props)(NewTopic);
