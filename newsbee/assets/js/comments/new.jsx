import React from 'react'
import ReactDom from 'react-dom'
import { connect } from 'react-redux'
import { Form, Container, Button, Alert } from 'react-bootstrap'
import { Redirect } from 'react-router'
import store from '../store'

import { add_comment } from '../ajax'

class NewComment extends React.Component {
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
            type: 'CHANGE_NEW_COMMENT', data
        })
    }

    render() {

        if(!store.getState().session) {
            return <Redirect to="/" />
        }

        if(this.state.redirect)
            return <Redirect to={this.state.redirect} />

        let {content, errors, user_id} = this.props
        let error_msg = null
        if(errors) {
            error_msg = <Alert variant="danger">{ errors }</Alert>
       }
       console.log("new_comment", props.location.topicProps)
        this.changed({user_id: store.getState().session.user_id})
        return(
            <Container>
                <h1 align="center">New Comment</h1>
                { error_msg }
                <Form.Group controlId="content">
                    <Form.Label>Content</Form.Label>
                    <Form.Control type="text" 
                        onChange={(ev) => {this.changed({content: ev.target.value})}}
                    />
                </Form.Group>
                <Button variant="primary" onClick={() => {add_comment(this)}}>Create Comment</Button>
            </Container>
        )
    }

}

function state2props(state) {
    return state.forms.new_comment;
}

export default connect(state2props)(NewComment);
