#include <bits/stdc++.h>
using namespace std;
 
map<string,int> op;
map<string,int> reg;
map<string,int> func;
 
void init_mapping()
{
	op["add"] = 32;	
	op["comp"] = 32;
	op["and"] = 32;
	op["xor"] = 32;
	op["shll"] = 32;
	op["shrl"] = 32;
	op["shllv"] = 32;
	op["shrlv"] = 32;
	op["shra"] = 32;
	op["shrav"] = 32;
 
	op["addi"] = 0;
	op["compi"] = 1;
	op["lw"] = 2;
	op["sw"] = 3;
 
	op["bz"] = 4;
	op["bnz"] = 5;
	op["bcy"] = 6;
	op["bncy"] = 7;
	op["bs"] = 8;
	op["bns"] = 9;
	op["bv"] = 10;
	op["bnv"] = 11;
 
	op["b"] = 12;
	op["br"] = 13;
	op["call"] = 14;
	op["ret"] = 15;
 
 
	func["add"] = 0;	
	func["comp"] = 1;
	func["and"] = 2;
	func["xor"] = 3;
	func["shll"] = 4;
	func["shrl"] = 5;
	func["shllv"] = 12;
	func["shrlv"] = 13;
	func["shra"] = 7;
	func["shrav"] = 15;
 
 
	reg["$zero"] = 0;
 
	reg["$v0"] = 1;
	reg["$v1"] = 2;
 
	reg["$a0"] = 3;
	reg["$a1"] = 4;
	reg["$a2"] = 5;
	reg["$a3"] = 6;
 
	reg["$t0"] = 7;
	reg["$t1"] = 8;
	reg["$t2"] = 9;
	reg["$t3"] = 10;
	reg["$t4"] = 11;
	reg["$t5"] = 12;
	reg["$t6"] = 13;
	reg["$t7"] = 14;
 
	reg["$s0"] = 15;
	reg["$s1"] = 16;
	reg["$s2"] = 17;
	reg["$s3"] = 18;
	reg["$s4"] = 19;
	reg["$s5"] = 20;
	reg["$s6"] = 21;
	reg["$s7"] = 22;
 
	reg["$sp"] = 30;
	reg["$ra"] = 31;
}

void perror()
{
	cout<<"SYNTAX ERROR!";
	exit(0);
} 

void parse(string opr)
{
	int rs, rt, sh, imm;
 
	string arg1, arg2;
	if(!op.count(opr))
		perror();
 
	if(op[opr]==32)
	{
		cin>>arg1>>arg2;
		if(!reg.count(arg1))
			perror();
		rs = reg[arg1];
		imm = 0;
		if(opr!="shll" and opr!="shrl" and opr!="shra")
		{
			if(!reg.count(arg2))
				perror();
			rt = reg[arg2];
			sh = 0;
		}
		else
		{
			rt = 0;
			sh = stoi(arg2);
		}
		cout<<bitset<6>(op[opr])<<bitset<5>(rs)<<bitset<5>(rt)<<bitset<5>(sh)<<"0000000"<<bitset<4>(func[opr]);
	}
	else
	{
		if(opr=="addi"||opr=="compi")
		{
			cin>>arg1>>imm;
			if(!reg.count(arg1))
				perror();
			rs = reg[arg1];
			rt = 0, sh=0;
		}
		else if(opr=="lw"||opr=="sw")
		{
			cin>>arg2>>imm>>arg1;
			if(!reg.count(arg1)||!reg.count(arg2))
				perror();
			rs = reg[arg1], rt = reg[arg2];
			sh = 0;
		}
		else if(opr=="br")
		{
			cin>>arg1;
			if(!reg.count(arg1))
				perror();
			rs = reg[arg1];
			rt = 0, sh=0, imm = 0;
		}
		else if(opr=="ret")
		{
			rs = 31;
			rt = 0, sh=0, imm = 0;
		}
		else
		{
			cin>>imm;
			rs = rt = sh = 0;
		}
		if(imm<0)
			imm = (~abs(imm)) + 1;
 
		cout<<bitset<6>(op[opr])<<bitset<5>(rs)<<bitset<5>(rt)<<bitset<16>(imm);
	}
}
 
int main()
{
	string opr, arg1, arg2;
 
	init_mapping();
 
	cin>>opr;
	while(opr!="end")
	{
		parse(opr);
		cout<<","<<endl;
		cin>>opr;
	}
	return 0;
}

/*
	compi $t1 -5
	comp $t1 $t1
	compi $t2 1
	xor $t2 $t2
	addi $t2 7
	add $t1 $t2
	and $t1 $t2
	shll $t1 4
	shrl $t1 2
	shllv $t1 $t2
	shrlv $t1 $t2
	shra $t1 1
	shrav $t1 $t2
	sw $t1 1 $t2
	lw $t2 1 $t2
	compi $t4 10
	add $t1 $t4
	bns 2
	addi $t4 1
	b 1
	addi $t4 -1
	call 1
	b 2
	addi $t1 10
	ret
	end
*/