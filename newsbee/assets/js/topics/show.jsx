import React from 'react'
import ReactDom from 'react-dom'
import { NavLink } from 'react-router-dom'
import { Redirect } from 'react-router'
import { connect } from 'react-redux'
import { get } from '../ajax'
import { Form, Container, Button} from 'react-bootstrap'
import store from '../store'

export default class ShowTopic extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            topic: null
        }
        this.getTopic = this.getTopic.bind(this)
        this.getTopic(this.props.match.params.id)
    }

    getTopic(id) {
       get('/topics/' + id).then(resp => {
            this.setState({topic: resp})
        })
    }

 render() {
        if(this.state.topic) {
            return(
                <Container>
                    <h1>Topic</h1>
                    <h6>Title: {this.state.topic.title}</h6>
            <NavLink className="btn btn-primary ml-auto d-block" to="/new_comment">Create Comment</NavLink>
              <table className="table">
                <thead>
                    <tr>
                        <th>User</th>
                        <th>Comment</th>
                    </tr>
                </thead>
                <tbody>
                    
                </tbody>
            </table>
                </Container>
            )
        } else {
            return null
        }
    }
}
