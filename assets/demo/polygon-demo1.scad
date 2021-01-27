triangle_points =[
  [0,0],[100,0],[0,100],[
  10,10],[80,10],[10,80]
];

triangle_paths =[
  [0,1,2],[3,4,5]
];

polygon(
  points=triangle_points,
  paths=triangle_paths,
  complexity=10
);
