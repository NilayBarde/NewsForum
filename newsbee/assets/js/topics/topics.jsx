import React from 'react'
import ReactDom from 'react-dom'
import { connect } from 'react-redux'
import {NavLink} from 'react-router-dom'
import { get_topics } from '../ajax'
import { delete_topic } from '../ajax'
import store from '../store'

const topicList = connect(({ topics }) => ({ topics }))(({ topics }) => {
    if(topics.size == 0)
        get_topics()

    let renderTopics = Array.from(topics, ([key, topic]) => {
        return(
            <tr key={key}>
                <td>{topic.title}</td>
		<td>{topic.user.name}</td>
                <td><NavLink to={'/show_topic/' + topic.id}>Show Topic</NavLink></td>
		{
		store.getState().session.user_id == topic.user.id ?
                 <td><button className="btn btn-danger" onClick={() => delete_topic(topic.id)}>Delete</button></td>:null
		}
            </tr>
        )
    })
    return (
        <div className="container">
            <h1>Topics</h1>
            <NavLink className="btn btn-primary ml-auto d-block add-btn" to="/new_topic">Create Topic</NavLink>
            <table className="table">
                <thead>
                    <tr>
                        <td>Title</td>
	                <td>User</td>
                    </tr>
                </thead>
                <tbody>
                    {renderTopics}
                </tbody>
            </table>
        </div>
    )
})

export default topicList
