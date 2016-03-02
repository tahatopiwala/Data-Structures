function prefixSearch(name, dict){
  if(name.length == 1){
    var char = name.charAt(0);
    if(dict.hasOwnProperty(char)){
      return true;
    }else{
      return false;
    }
  }else{
    var char = name.charAt(0);
    if(dict.hasOwnProperty(char)){
      return prefixSearch(name.substr(1, name.length-1), dict[char]);
    }else{
      return false;
    }
  }
}
