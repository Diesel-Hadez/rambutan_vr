
function postData(url = '', data = {}, method_type='POST') {
  // Default options are marked with *
   return fetch(url, {
    method: method_type, // *GET, POST, PUT, DELETE, etc.
    mode: 'cors', // no-cors, cors, *same-origin
    cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
    credentials: 'same-origin', // include, *same-origin, omit
    headers: {
      'Content-Type': 'application/json',
      //'Content-Type': 'application/x-www-form-urlencoded',
    },
    redirect: 'follow', // manual, *follow, error
    referrer: 'no-referrer', // no-referrer, *client
    body: JSON.stringify(data), // body data type must match "Content-Type" header
    }).then(response => response.json()); // parses JSON response into native JavaScript objects 
}

function Borrow(item_type, arg_movie_item_id) {
  postData('/item_transactions.json',
    {movie_item_id: arg_movie_item_id , authenticity_token: document.getElementsByName("csrf-token")[0].getAttribute("content")}
  ).then(data => alert(data.message)).catch(error => alert(error));
}

function AddActor(movie_id) {
  let actor_id = document.getElementById("actor_id").value;
   postData('/actor_movies.json',
         {actor_id: actor_id, movie_id: movie_id , authenticity_token: document.getElementsByName("csrf-token")[0].getAttribute("content")},'POST'
       ).then(data => {if (data.message !== undefined) {alert(data.message);}}).catch(error => alert(error));

}

function RemoveActor(actor_movie_id) {
   postData('/actor_movies/' + actor_movie_id  +'.json',
         {authenticity_token: document.getElementsByName("csrf-token")[0].getAttribute("content")},'DELETE'
       ).then(data => {
       }).catch(error => {});
}
