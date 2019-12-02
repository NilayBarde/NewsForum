const set_api = "https://newsapi.org/v2/top-headlines?country=us&apiKey=d3c496691bb54f3b86ccb6f379d0bc9e";

async function getdata(){
// var req = new Request(newsData);

const response  = await fetch(set_api);
const jsonObj = await response.json();
// console.log(jsonObj.articles[0].title);
// return JSON.stringify(jsonObj);
return jsonObj.articles[0].title;



}


export default function getTitle(){
  fetch(set_api)
  .then((res) => res.json())
  .then((data) => {
    let output = '<h1 class="h2title"> Newsbee Daily Feeds</h1>';
    data.articles.forEach(function(articles){
      
     
      output += `
        <ul class="animal">
        <img class="pet-photo" src="${articles.urlToImage}" alt="Not Found" onerror=this.src="https://scontent.fbed1-1.fna.fbcdn.net/v/t1.0-9/20953044_1461745670527406_132831486733253753_n.jpg?_nc_cat=100&_nc_ohc=AmfdCTYo4GMAQlfdng1biYZCV-M8Txe9Y5MMLTKh2JqW0fdJY5lwG-bWA&_nc_ht=scontent.fbed1-1.fna&oh=819e8da11384295e553616730d38857d&oe=5E8A64FD">
        <a class = "title_color" href= ${articles.url} target="_blank" ><h3> ${articles.title}</h3></a>
           <div><i><small>${ifauthornull(articles.author)}</small></i></div>
          
         <br>
          <div class="list-group-item"> ${ifcontentnull(articles.description)}</div>
        </ul>
      `;
    });
    
    //console.log(output);
    // return output;
    
     document.getElementById('news').innerHTML = `${output}
     <p class="footer">scroll up for more news!</p>
     <p class="footer">Powered by <a href="https://newsapi.org/">newsapi.org</a></p>
     `

  })

}



function ifauthornull(content){
  if (content == null){
    return  `by Anonymous`
  }
  else{
    return `${content}`
  }
};
function ifcontentnull(content){
  if (content == null){
    return  `Click the title for more details.`
  }
  else{
    return `${content}`
  }
};






function placedata(){
   let titles = title;
   let authors = author;
   let descriptions = description;
   let urls = url;
   let urlToImages = urlToImage;
    let output = '<h1 class="h2title"> Newsbee Daily Feeds</h1>';
    for(let i = 0; i< titles.length; i++){


      output += `
        <ul class="animal">
        <img class="pet-photo" src="${urlToImages[i]}" alt="Not Found" onerror=this.src="https://scontent.fbed1-1.fna.fbcdn.net/v/t1.0-9/20953044_1461745670527406_132831486733253753_n.jpg?_nc_cat=100&_nc_ohc=AmfdCTYo4GMAQlfdng1biYZCV-M8Txe9Y5MMLTKh2JqW0fdJY5lwG-bWA&_nc_ht=scontent.fbed1-1.fna&oh=819e8da11384295e553616730d38857d&oe=5E8A64FD">
        <a class = "title_color" href= ${urls[i]} target="_blank" ><h3> ${titles[i]}</h3></a>
           <div><i><small>${ifauthornull(authors[i])}</small></i></div>
         <br>
          <div class="list-group-item"> ${ifcontentnull(descriptions[i])}</div>
        </ul>
      `;
    }

    console.log(output);
    // return output;

     document.getElementById('news').innerHTML = `${output}
     <p class="footer">scroll up for more news!</p>;
     `

  }

//getTitle();
