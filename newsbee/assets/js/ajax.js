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
  return fetch('/ajax' + path, {
    method: 'get',
    credentials: 'same-origin',
    headers: new Headers({
      'x-csrf-token': window.csrf_token,
      'content-type': "application/json; charset=UTF-8",
      'accept': 'application/json',
    }),
  }).then((resp) => resp.json());
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
      form.redirect('/')
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
