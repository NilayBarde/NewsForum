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

<<<<<<< HEAD
function new_comment(st0 = {content: "",  errors: null, user_id: null, topic_id: null}, action) {
    switch(action.type) {
        case 'CHANGE_NEW_COMMENT':
            return Object.assign({}, st0, action.data)
        default:
            return st0
    }
}

=======
>>>>>>> master
function forms(st0, action) {
    let reducer = combineReducers({
        login,
	new_user,
<<<<<<< HEAD
	new_topic,
	new_comment
=======
	new_topic
>>>>>>> master
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
        case 'SHOW_TOPIC':
            let st2 = action.data
            console.log(st2)
            return st2
        default:
            return st0
    }
}

<<<<<<< HEAD
function comments(st0 = new Map(), action) {
    switch(action.type) {
        case 'GET_COMMENTS':
            let st1 = new Map(st0)
            action.data.forEach((comment) => {
                st1.set(comment.id, comment)
            })
            return st1
        case 'SHOW_COMMENT':
            let st2 = action.data
            return st2  
        default:
            return st0
    }
}

=======
>>>>>>> master
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
<<<<<<< HEAD
	topics,
	comments
=======
	topics
>>>>>>> master
    })
    return deepFreeze(reducer(st0, action))
}

let store = createStore(root_reducer)
export default store
