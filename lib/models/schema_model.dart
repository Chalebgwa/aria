///
///  {
///    field_name:{
///       value:"",
///       type:"",
///       options:[],
///       validation:"".
///       error:"",
///    }
///  }
///

class SchemaModel {
  final String formName;
  final Map<String, dynamic> fields;

  SchemaModel(this.formName, this.fields);
}
