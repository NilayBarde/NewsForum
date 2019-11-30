import React from 'react'
import ReactDom from 'react-dom'
import { connect } from 'react-redux'
import {NavLink} from 'react-router-dom'
import { get_topics } from '../ajax'
import store from '../store'

const topicList = connect(({ topics }) => ({ topics }))(({ topics }) => {
    console.log(topics.size)
    if(topics.size == 0)
        get_topics()

    let renderTopics = Array.from(topics, ([key, topic]) => {
        return(
            <tr key={key}>
                <td>{topic.title}</td>
            </tr>
        )
    })
    return (
        <div className="container">
            <h1>Topics</h1>
            {
                store.getState().session != null ?
                <NavLink className="btn btn-primary ml-auto d-block add-btn" to="/new_topic">Add Topic</NavLink> :
                null
            }
            <table className="table">
                <thead>
                    <tr>
                        <td>Topic</td>
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
