function searchMember() {
  const uniformNumber = document.querySelectorAll(".input-game-uniform-number");
  const memberGrade = document.querySelectorAll(".input-game-grade");
  const memberId = document.querySelectorAll(".input-member-id");
  const fullName = document.querySelectorAll(".input-game-full-name");
  const uniformNumberLength = uniformNumber.length;

  for(let i=0; i<=uniformNumberLength - 1; i++){
    uniformNumber[i].addEventListener("keyup", (e) => {
      const formResult = uniformNumber[i];
      const formData = Math.floor(formResult.value);
      // const formData = new FormData(formResult);
      const XHR = new XMLHttpRequest();
      XHR.open("GET", '/games/search_member?keyword=' + encodeURIComponent(formData), true);
      XHR.responseType = "json";
      XHR.send(null);
      XHR.onload = () =>{
        if (XHR.status != 200) {
          alert(`Error ${XHR.status}: ${XHR.statusText}`);
          return null;
        }
        const member = XHR.response.member;
        const gradeForm = memberGrade[i];
        const memberIdForm = memberId[i];
        const fullNameForm = fullName[i];
        if(member === undefined || member === null){
          gradeForm.value = "";
          memberIdForm.value = "";
          fullNameForm.value = "";
        }else{
          const grade = member.grade;
          const memberNumber = member.id;
          const name = member.first_name + " " + member.last_name;
          gradeForm.value = grade;
          memberIdForm.value = memberNumber;
          fullNameForm.value = name;
        }
      }
    });
  };
}

window.addEventListener("load", searchMember);