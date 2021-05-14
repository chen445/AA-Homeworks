document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!
  let submit1 = document.getElementsByClassName('favorite-submit')[0];
    submit1.addEventListener('click',function(e){
      e.preventDefault();
      let input=document.getElementsByClassName('favorite-input')[0];
      const inputValue= input.value;
      input.value='';
      const newEl=document.createElement('li');
      newEl.innerText=inputValue;
      const ul=document.getElementById('restaurants');
      ul.append(newEl);
    })

  
  // adding new photos

  // --- your code here!

  let button=document.getElementsByClassName('photo-show-button')[0];
    button.addEventListener('click',function(e){
      e.preventDefault();
      const target = document.getElementsByClassName('photo-form-container')[0];
      if(target.className==='photo-form-container hidden'){
        target.className='photo-form-container';
      }else{
        target.className='photo-form-container hidden';
      }
    })
  const submit2=document.getElementsByClassName('photo-url-submit')[0];
    submit2.addEventListener('click',function(e){
       e.preventDefault();
       const newImg=document.createElement('img');
       const newList=document.createElement('li');
       const input=document.getElementsByClassName('photo-url-input')[0];
       const inputV=input.value;
       input.value='';
       newImg.setAttribute('src',inputV);
       newList.append(newImg);
       const ul=document.getElementsByClassName('dog-photos')[0];
       ul.append(newList);
    })

});
