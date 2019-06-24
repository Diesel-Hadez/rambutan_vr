function AddNewActorOption() {
  let actor_list = document.getElementById("actor_list");
  if (actor_list.firstChild.hidden !== true) actor_list.firstChild.hidden = true;
  
  let addedNode = actor_list.firstChild.cloneNode(true);
  addedNode.id += "_" + (actor_list.childElementCount-1);
  addedNode.name = "movie[actor_list]" + "[" + (actor_list.childElementCount-1) + "]";
  addedNode.hidden = false;

  actor_list.appendChild(addedNode);
}
