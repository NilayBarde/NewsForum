import store from './store'

export function post(path, body) {
  let state = store.getState()
  let session = state.session
    return fetch('/ajax' + path, {
        method: 'post',
        credentials: 'same-origin',
        headers: new Headers({
          'x-csrf-token': window.csrf_token,
          'content-type': "application/json; charset=UTF-8",
          'accept': 'application/json',
          'x-auth': session ? session.token : "",
        }),
        body: JSON.stringify(body),
      }).then((resp) => resp.json())
}

export function remove(path) {
  let state = store.getState()
  let session = state.session
    return fetch('/ajax' + path, {
        method: 'delete',
        credentials: 'same-origin',
        headers: new Headers({
          'x-csrf-token': window.csrf_token,
          'content-type': "application/json; charset=UTF-8",
          'accept': 'application/json',
          'x-auth': session ? session.token : "",
        }),
      })
}

export function get(path) {
  let state = store.getState()
  let session = state.session
    return fetch('/ajax' + path, {
        method: 'get',
        credentials: 'same-origin',
        headers: new Headers({
          'x-csrf-token': window.csrf_token,
          'content-type': "application/json; charset=UTF-8",
          'accept': 'application/json',
          'x-auth': session ? session.token : "",
        })
    }).then(resp => resp.json())
}

export function update(path, body) {
  let state = store.getState()
  let session = state.session
  return fetch('/ajax' + path, {
      method: 'put',
      credentials: 'same-origin',
      headers: new Headers({
        'x-csrf-token': window.csrf_token,
        'content-type': "application/json; charset=UTF-8",
        'accept': 'application/json',
        'x-auth': session ? session.token : "",
      }),
      body: JSON.stringify(body),
  }).then(resp => resp.json())
}

export function submit_login(form) {
  let state = store.getState()
  let data = state.forms.login

  post('/sessions', data)
    .then(resp => {
    console.log(resp)
    if(resp.token) {
      localStorage.setItem('session', JSON.stringify(resp))
      store.dispatch({
        type: 'LOG_IN',
        data: resp
      })
      form.redirect('/topics')
    } else {
      store.dispatch({
        type: 'CHANGE_LOGIN',
        data: {errors: JSON.stringify(resp.errors)},
      });
    }
  })
}

export function add_user(form) {
  let state = store.getState()
  let data = state.forms.new_user
  console.log(data)
  post('/users', {user: data}).then(resp => {
    if(resp) {
      store.dispatch({
        type: 'NEW_USER',
        data: resp.data
      })
      form.redirect('/')
      console.log("Reached")
    } else {
      console.log(resp.errors)	    
      store.dispatch({
        type: 'CHANGE_NEW_USER',
        data: {errors: JSON.stringify(resp.errors)},
      });
    }
  })
}

export function get_topics() {
  get('/topics').then(resp => {
    store.dispatch({
      type: 'GET_TOPICS',
      data: resp.data
    })
  })
}

export function get_topic(topic_id) {
  get('/topics/' + topic_id).then(resp => {
    store.dispatch({
      type: 'SHOW_TOPIC',
      data: resp.data
    })
  })
}

export function add_topic(form) {
  let state = store.getState()
  let data = state.forms.new_topic
  console.log(data)
  post('/topics', {topic: data}).then(resp => {
    if(resp.data) {
      store.dispatch({
        type: 'NEW_TOPIC',
        data: resp.data
      })
      form.redirect('/topics')
    } else {
      store.dispatch({
        type: 'CHANGE_NEW_TOPIC',
        data: {errors: JSON.stringify(resp.errors)},
      });
    }
  })
}

export function delete_topic(id) {
  remove('/topics/' + id).then(resp => {
    store.dispatch({
      type: 'DELETE_TOPIC',
      data: id
    })
  })
}

export function add_comment(form) {
  let state = store.getState()
  let data = state.comments
  console.log('new_comment' + data)
  let comments = Array.from(data, ([key, comment]) => {
    return comment
  })
  let add_comment
  comments.forEach((comment) => {
    add_comment = post('/comments', {comment})
  })

  add_comment.then(resp => {
    store.dispatch({
      type: 'GET_TOPICS',
      data: [state.forms.new_topic]
    })
    store.dispatch({
      type: 'CLEAR_TOPIC',
      data: null
    })
    store.dispatch({
      type: 'CLEAR_COMMENT',
      data: null
    })
    store.dispatch({
      type: 'CLEAR_COMMENTS',
      data: null
    })
  })
    form.redirect('/topics')
}

export function get_comments(topic_id) {
  get('/topics/' + topic_id).then(resp => {
    if(resp.data) {
      store.dispatch({
        type: 'GET_COMMENTS',
        data: resp.data.comments
      })
    }
  })
}

export function get_comment(comment_id) {
  get('/comments/' + comment_id).then(resp => {
    store.dispatch({
      type: 'SHOW_COMMENT',
      data: resp.data
    })
  })
}
