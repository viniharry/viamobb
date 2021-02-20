

class Message{
  int id;
  String user;
  String message;


  Message({
    this.id,
    this.user,
    this.message,
    item
  });


}

 final List<Message> messagesList = [
   Message(
     id: 1,
     user : 'Vinicius',
     message: 'Olá, tudo bem?'
   ),
   Message(
     id: 2,
     user : 'Enzo',
     message: 'Olá, mobile ta osso'
   ),
 ];