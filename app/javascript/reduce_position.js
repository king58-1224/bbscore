function reduceOption() {
  const positionSelect = document.querySelectorAll(".input-game-defensive");
  const SelectLength = positionSelect.length;
  const OptionLength = positionSelect[0].children.length;
  
  for(let i=0; i<=SelectLength - 1; i++){
    positionSelect[i].addEventListener("change", (e) => {
      const targetValue = positionSelect[i].value;
      const targetChildren = positionSelect[i].children;
      let preValue = 1;
      for(let c=0; c<=OptionLength-1;c++){
        if(targetChildren[c].classList.contains("pre-value")){
          preValue = targetChildren[c].value;
          targetChildren[c].classList.remove("pre-value");
        }
      }
      targetChildren[targetValue - 1].classList.add("pre-value");
      for(let k=0; k<=SelectLength - 1; k++){
        if(preValue != 1 && k!=i){
          positionSelect[k].children[preValue - 1].removeAttribute("disabled");
        }

        if(targetValue != 1 && k!=i){
          positionSelect[k].children[targetValue - 1].setAttribute("disabled", true);
        }
      }

      
    });
  };
}

window.addEventListener("load", reduceOption);