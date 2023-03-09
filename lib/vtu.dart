class  vtu_class extends StatelessWidget {

const API_URL = 'https://haykaytelecoms.com.ng/api/';

   int token = tokenController.text;
  int plan_id =plan_idController.text;
  int network_id=network_idController.text; 
  int phonenumber=phonenumberController.text; 
  Future<List> buy async {



    Map<String, String> data = {
      'token': token,
      'plan_id': plan_id,
      'network_id':network_id,
      'phonenumber':phonenumber,
    };

    var response = await http.post(
      Uri.parse('https://haykaytelecoms.com.ng/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'method':'Post',
      },
      body: jsonEncode(data),
    );
 
}
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Haykaytelecoms'),
      ), 
      body: Container(
          color: Colors.#307D7E,
          padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[]
        
          ),
      ),
           
    )
 },

