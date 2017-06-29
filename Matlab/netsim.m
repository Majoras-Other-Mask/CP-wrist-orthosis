function [out] = netsim(in,net)

n=1;
ps=net.inputs{1}.processSettings{1};
ts=net.outputs{2}.processSettings{1};


for j=5:length(in)
  inew=mapminmax('apply',in(:,j-4:j),ps);
  i=[inew(1,5);inew(2,5);inew(3,5);inew(4,5);inew(5,5);inew(1,4);inew(2,4); ...
     inew(3,4);inew(4,4);inew(5,4);inew(1,3);inew(2,3);inew(3,3); ...
     inew(4,3);inew(5,3);inew(1,2);inew(2,2);inew(3,2);inew(4,2); ...
     inew(5,2);inew(1,1);inew(2,1);inew(3,1);inew(4,1);inew(5,1)];
  m=purelin(net.IW{1}*i+net.b{1});
  onew=purelin(net.LW{2}*m+net.b{2});
  o=mapminmax('reverse',onew,ts);
  out(:,n)=o;
  n=n+1;
end



end