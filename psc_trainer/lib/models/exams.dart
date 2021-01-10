class Exams{
  String id;
  String title;
  int code;



  Exams({this.title,this.id,this.code});
}


List<Exams> exam =[
  Exams(id: '0001',title: 'LDC',code: 1,),
  Exams(id: '000',title: 'Peon',code: 2,),
  Exams(id: '0003',title: 'Constable',code: 3,),
  Exams(id: '0004',title: 'Staff Nurse',code: 4,),
  Exams(id: '0005',title: 'VEO',code: 5,),
  Exams(id: '0006',title: 'Teacher',code: 6,),

];


final CODE={1:'General Knowledge ',
  2:'Simple Arithmetic  And Mental Ability',
  3:'General Science',
  4:'General English',
  5:'Language'
};
final examtopic=[
 ['General Knowledge','Simple Arithmetic','English'],
 ['General Knowledge','Simple Arithmetic',],
 ['General Knowledge','Simple Arithmetic','English'],
 ['General Knowledge','Simple Arithmetic','English','Science',],
 ['General Knowledge','Simple Arithmetic','English','Science',],
 ['General Knowledge','Simple Arithmetic','English',],
];