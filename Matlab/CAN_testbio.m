function bio=CAN_testbio
bio = [];
bio(1).blkName='CAN Pack';
bio(1).sigName='';
bio(1).portIdx=0;
bio(1).dim=[1,1];
bio(1).sigWidth=1;
bio(1).sigAddress='&CAN_test_B.CANPack';
bio(1).ndims=2;
bio(1).size=[];
bio(1).isStruct=false;
bio(getlenBIO) = bio(1);

bio(2).blkName='CAN Unpack/p1';
bio(2).sigName='';
bio(2).portIdx=0;
bio(2).dim=[1,1];
bio(2).sigWidth=1;
bio(2).sigAddress='&CAN_test_B.CANUnpack_o1';
bio(2).ndims=2;
bio(2).size=[];
bio(2).isStruct=false;

bio(3).blkName='CAN Unpack/p2';
bio(3).sigName='';
bio(3).portIdx=1;
bio(3).dim=[1,1];
bio(3).sigWidth=1;
bio(3).sigAddress='&CAN_test_B.CANUnpack_o2';
bio(3).ndims=2;
bio(3).size=[];
bio(3).isStruct=false;

bio(4).blkName='Receive position ';
bio(4).sigName='';
bio(4).portIdx=0;
bio(4).dim=[1,1];
bio(4).sigWidth=1;
bio(4).sigAddress='&CAN_test_B.Receiveposition';
bio(4).ndims=2;
bio(4).size=[];
bio(4).isStruct=false;

bio(5).blkName='Sine Wave Function';
bio(5).sigName='';
bio(5).portIdx=0;
bio(5).dim=[1,1];
bio(5).sigWidth=1;
bio(5).sigAddress='&CAN_test_B.SineWaveFunction';
bio(5).ndims=2;
bio(5).size=[];
bio(5).isStruct=false;

function len = getlenBIO
len = 5;

