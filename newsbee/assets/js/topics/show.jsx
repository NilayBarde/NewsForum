import React from 'react'
import ReactDom from 'react-dom'
import { connect } from 'react-redux'
import { get } from '../ajax'
import { Form, Container, Button} from 'react-bootstrap'

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
                </Container>
            )
        } else {
            return null
        }
    }
}
