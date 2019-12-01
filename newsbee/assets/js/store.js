import { createStore, combineReducers } from 'redux'
import deepFreeze from 'deep-freeze-strict'

function login(st0 = {email: "", password: "", errors: null}, action) {
    switch(action.type) {
        case 'CHANGE_LOGIN':
            return Object.assign({}, st0, action.data)
        default:
            return st0
    }
}

function new_user(st0 = {email: "", name: "",  password: "", errors: null}, action) {
    switch(action.type) {
        case 'CHANGE_NEW_USER':
            return Object.assign({}, st0, action.data)
        default:
            return st0
    }
}

function new_topic(st0 = {title: "", error: null, user_id: null}, action) {
    switch(action.type) {
        case 'CHANGE_NEW_TOPIC':
            return Object.assign({}, st0, action.data)
        default:
            return st0
    }
}

function forms(st0, action) {
    let reducer = combineReducers({
        login,
	new_user,
	new_topic
    })
    return reducer(st0, action)
}

function topics(st0 = new Map(), action) {
    switch(action.type) {
        case 'GET_TOPICS':
            let st1 = new Map(st0)
            action.data.forEach((job) => {
                st1.set(job.id, job)
            })
            return st1
        case 'NEW_TOPIC':
            st1 = new Map(st0)
            st1.set(action.data.id, action.data)
            return st1
        default:
            return st0
    }
}

let session0 = localStorage.getItem('session')
if(session0) {
    session0 = JSON.parse(session0)
}

function session(st0 = session0, action) {
    switch(action.type) {
        case 'LOG_IN':
            return action.data
        case 'LOG_OUT':
            return null
        default:
            return st0
    }
}

function root_reducer(st0, action) {
    let reducer = combineReducers({
        forms,
        session,
	topics
    })
    return deepFreeze(reducer(st0, action))
}

let store = createStore(root_reducer)
export default store
