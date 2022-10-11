# Shapes via Clipper

### Triangle Shape Clipper :

  ``` path.addPolygon([
      Offset(0, size.height),
      Offset(size.width / 2, 0),
      Offset(size.width, size.height)
    ], true); 
 ```   
 
### Diamond or Quadrangle Shape Clipper :

 ```   path.addPolygon([
      Offset(0, size.height / 2),
      Offset(size.width / 2, 0),
      Offset(size.width, size.height / 2),
      Offset(size.width / 2, size.height)
    ], true); 
 ```   
    
### Pentagone Shape Clipper :    
    
   ```  path.addPolygon([
      Offset(0, size.height * 1 / 3),
      Offset(size.width / 2, 0),
      Offset(size.width, size.height * 1 / 3),
      Offset(size.width * 4 / 5, size.height),
      Offset(size.width * 1 / 5, size.height),
    ], true);
   ``` 
   
### Hexagone Shape Clipper :       
  
   ``` path.addPolygon([
      Offset(0, size.height / 2),
      Offset(size.width * 1 / 3, size.height),
      Offset(size.width * 2 / 3, size.height),
      Offset(size.width, size.height / 2),
      Offset(size.width * 2 / 3, 0),
      Offset(size.width * 1 / 3, 0)
    ], true);
  ```    
