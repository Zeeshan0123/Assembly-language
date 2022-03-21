#include<iostream>
#include<conio.h>
#include<windows.h>
#include<fstream>
#include<string>
#include<iomanip>
using namespace std;

class journal
{
private:
	string from;
	string to;
	string date;
	string desc;
	int count;
    long int amount,D_amount,C_amount;
	fstream in,intr,debit;

public:
	journal()
	{	
		
		in.open("journal.txt",ios::out|ios::app);
		intr.open("intro.txt",ios::out);
		debit.open("Debit.txt",ios::out|ios::app);
		from = to = "";
		amount = 0;
	}
	~journal()
	{
	}
		void get_entries();
		void intro_info();
		void debit_cradit();
		void ledgers();
		void trial();
		void Net_income();
		void balance_sheet();

};

int main()
{

//	int second=1000;
//	cout << "\n\n\t --------------------Your Financial Solutions -------------------------\n";
//    for(int i=0;i<5;i++)
//	{
//		cout<<"";
//		Sleep(second);
//	}
//	system("cls");
//    cout<<"\n\t\t\t Loading data please wait ";
//    for(int i=0;i<5;i++)
//	{
//		cout<<" . ";
//		Sleep(second);
//	}
//	system("cls");
	
	string name,date,from,to,D_amount,C_amount;
	int num;
	fstream intr,debit;
	journal j;
	ok:
	system("cls");
	for(int i=240;i>0;i--)
	{
		cout<<"-";
	}
	cout<<"Press 1 for the Intro Information:"<<endl;
	cout<<"Press 2 for the entries:"<<endl;
	cout<<"Press 3 for General jornal:"<<endl;
	cout<<"Press 4 for Ledgers:"<<endl;
	cout<<"Press 5 for the Trial Balance:"<<endl;
	cout<<"Press 6 for the Income Statement:"<<endl;
	cout<<"Press 7 for the Balance Sheet:"<<endl;
	cout<<"Press 8 for Exit:"<<endl;
	
	cout<<"\n\n\n\n\t\t\t\t\t Enter your Choice :: ";
	cin>>num;
	switch(num)
	{
		case 1:
			system("cls");
			j.intro_info();
			break;
		case 2:
			system("cls");
			j.get_entries();
			break;
		case 3:
			system("cls");
			cout<<endl;
		
		intr.open("intro.txt",ios::in);
		intr>>name>>date;
		cout<<"\t\t\t\t\t\t"<<name<<"\n";
		cout<<"\t\t\t\t\t\t"<<"GENERAL JOURNAL"<<"\n";
		cout<<"\t\t\t\t\t\t"<<date<<"\n";
		debit.open("Debit.txt",ios::in);
		debit>>date>>from>>D_amount>>to>>C_amount;
		cout<<"\t\t\tDate"<<"\tAccountTitle"<<"\tDebit"<<"\t\tCradit"<<endl;
		for(int i=120;i>0;i--)
		{
			cout<<"-";
		}
		cout<<endl;
		while(!debit.eof())
		{
			cout<<"\t\t\t"<<date<<"      "<<from<<"\t\t\t"<<D_amount<<"\n";
			cout<<"\t\t\t\t\t"<<to<<"\t\t\t"<<C_amount<<"\n";
			debit>>date>>from>>D_amount>>to>>C_amount;
		}
		break;
		case 4:
			system("cls");
			j.ledgers();
			break;
		case 5:
			system("cls");
			j.trial();
			break;
		case 6:
			system("cls");
			j.Net_income();
			break;
		case 7:
			system("cls");
			j.balance_sheet();
			break;
		case 8:
			system("cls");
		    exit(0.1);
			break;
		default:
			cout<<"\n\tWrong Input";
			break;
	}
	getch();
	goto ok;
	
	
	
}



void journal::balance_sheet()
{
	system("cls");
	string name;
	cout<<endl;
	fstream intr,debit,as1,li1,eq1;
	intr.open("intro.txt",ios::in);
	intr>>name>>date;
	cout<<"\t\t\t\t\t"<<name<<"\n";
	cout<<"\t\t\t\t\t"<<"Balance_Sheet"<<"\n";
	cout<<"\t\t\t\t\t"<<date<<"\n";
	int asset_sum=0,liability_sum=0,equity_sum=0;
    cout<<"\n\t\tAssets\t\t\t\tLiability & OwnersEquity\n";
    for(int i=120;i>0;i--)
	{
		cout<<"-";
	}
	cout<<endl;
	as1.open("Asset.txt",ios::in);
	as1>>from>>D_amount;
	while(!as1.eof())
	{
		cout<<"\n\t"<<from<<"        "<<D_amount;
		asset_sum=asset_sum+D_amount;
		as1>>from>>D_amount;
	}
	cout<<"\n\tTotal = "<<asset_sum;
	as1.close();
	
	li1.open("Liability.txt",ios::in);
	cout<<"\n\t\t\t\t\t\tLiability:";
	cout<<endl;
	li1>>to>>C_amount;
	while(!li1.eof())
	{
		cout<<"\n\t\t\t\t\t\t\t"<<to<<"        "<<C_amount;
		liability_sum=liability_sum+C_amount;
		li1>>to>>C_amount;
	}
	cout<<"\n\t\t\t\t\t\t\tTotal Liability = "<<liability_sum;
	li1.close();
	
	
	
	string Eq;
	int amu;
	eq1.open("Owners_Equity.txt",ios::in);
	cout<<"\n\n\n\n\n\n\n\t\t\t\t\t\tOwners_Equity:";
	cout<<endl;
	eq1>>Eq>>amu;

	while(!eq1.eof())
	{
		cout<<"\n\t\t\t\t\t\t\t"<<Eq<<"        "<<amu;
		equity_sum=equity_sum+amu;
		eq1>>Eq>>amu;
	}
	cout<<"\n\t\t\t\t\t\t\tTotal  = "<<liability_sum+equity_sum;
	eq1.close();
}





void journal::get_entries()
{
	int num;
	
	
	debit_cradit();
}

void journal::intro_info()
{
	system("cls");
	cout<<"\n\n\n"; 
	for(int i=240;i>0;i--)
	{
		cout<<"-";
	}
	cin.ignore();
	string name;
	cout<<"\n\n\n\n\t\t\t\t\tEnter the name of Company: ";
	getline(cin,name);
	cout<<"\n\n\n\n\t\t\t\t\t Enter the Specific Date: ";
	getline(cin,date);
	intr<<" "<<name<<" "<<date;
	intr.close();	
}
void journal:: debit_cradit()
{
  
  fstream exp,rev,ast,lib,equ;
  int chek,chek1;
  int flag=0;
  int num;
  p:
  count++;
  cin.ignore();
  system("cls");
	cout<<"\n\n\n"; 
	for(int i=240;i>0;i--)
	{
		cout<<"-";
	}
  cout<<"\n\n\n\n\t\t\t\t\tEnter the date of Your Entry: ";
  getline(cin,date);
  cout<<"\n\n\n\n\t\t\tFor Debit Entry(if Expense then first Press 1 otherwise Press 2):  ";
  cin>>chek;
  if(chek==1)
  {
  	cin.ignore();
  	system("cls");
	cout<<"\n\n\n"; 
	for(int i=240;i>0;i--)
	{
		cout<<"-";
	}
  	cout<<"\n\n\n\n\t\t\t\t\tEnter your Debit Entry(Expense): ";
  	getline(cin,from);
  	from=from.append("_Expense");
  	cout<<"\n\n\n\n\t\t\t\t\tEnter your Debit amount(Expense): ";
    cin>>D_amount;
  	exp.open("expense.txt",ios::out|ios::app);
  	exp<<" "<<from<<" "<<D_amount<<"\n";
  	exp.close();	
  }
  else
  {
  	int decide2;
  
  	
  	cin.ignore();
  	system("cls");
	cout<<"\n\n\n"; 
	for(int i=240;i>0;i--)
	{
		cout<<"-";
	}
  	cout<<"\n\n\n\n\t\t\t\t\tEnter your Debit Entry: ";
  	getline(cin,from);
  	int fg=0;
  	beg:
  	fg=0;
  	
  	cout<<endl<<"\nPress 1 if it is Asset:"<<endl;
	cout<<"Press 2 if it is liabilty:"<<endl;
	cout<<"Press 3 if it is Owners_Equity:"<<endl;
	cout<<endl<<endl;
	cin>>decide2;
	switch(decide2) 
	{
		case 1:
			ast.open("Asset.txt",ios::out|ios::app);
			cout<<"\n\n\n\n\t\t\t\t\tEnter your Debit amount: ";
            cin>>D_amount;
            ast<<" "<<from<<" "<<D_amount<<"\n";
            ast.close();
            break;
        case 2:
        	lib.open("Liability.txt",ios::out|ios::app);
        	cout<<"\n\n\n\n\t\t\t\t\tEnter your Debit amount: ";
            cin>>D_amount;
            lib<<" "<<from<<" "<<D_amount<<"\n";
            lib.close();
            break;
        case 3:
        	equ.open("Owners_Equity.txt",ios::out|ios::app);
        	cout<<"\n\n\n\n\t\t\t\t\tEnter your Debit amount: ";
            cin>>D_amount;
            equ<<" "<<from<<" "<<D_amount<<"\n";
            equ.close();
			break;
	    default:
	    	cout<<"\n\t You have Entered the Wrong input: ";
	    	 fg=1;
	    	getch();
	    	break;
	    	
    }
    if(fg==1)
	{
	  goto beg;	
	}
  	
  }
  
  
  system("cls");
  cout<<"\n\n\n";
  for(int i=240;i>0;i--)
	{
		cout<<"-";
	}
  cout<<"\n\n\n\n\t\t\tFor Credit Entry(if Revenue then first Press 1 otherwise Press 2):  ";
  cin>>chek1;
  if(chek1==1)
  {
  	cin.ignore();
  
  	system("cls");
  	cout<<"\n\n\n";
  	for(int i=240;i>0;i--)
	{
		cout<<"-";
	}
    cout<<"\n\n\n\n\t\t\t\t\tEnter your Cradit Entry(Revenue): ";
    getline(cin,to);
    to=to.append("_Revenue");
    cout<<"\n\n\n\n\t\t\t\t\tEnter your Cradit Amount(Revenue): ";
    cin>>C_amount;
    rev.open("Revenue.txt",ios::out|ios::app);
  	rev<<" "<<to<<" "<<C_amount<<"\n";
  	rev.close();
  }
  else
  {
  	int decide;
  	cin.ignore();
  	
  	system("cls");
  	cout<<"\n\n\n";
  	for(int i=240;i>0;i--)
	{
		cout<<"-";
	}
    cout<<"\n\n\n\n\t\t\t\t\tEnter your Cradit Entry: ";
    getline(cin,to);
    int fg2=0;
    begn:
    fg2=0;
  	cout<<endl<<"\nPress 1 if it is Asset:"<<endl;
	cout<<"Press 2 if it is liabilty:"<<endl;
	cout<<"Press 3 if it is Owners_Equity:"<<endl;
	cout<<endl<<endl;
	cin>>decide;
	switch(decide) 
	{
		case 1:
			ast.open("Asset.txt",ios::out|ios::app);
			cout<<"\n\n\n\n\t\t\t\t\tEnter your Cradit Amount: ";
            cin>>C_amount;
            ast<<" "<<to<<" "<<C_amount<<"\n";
            ast.close();
            break;
        case 2:
        	lib.open("Liability.txt",ios::out|ios::app);
        	cout<<"\n\n\n\n\t\t\t\t\tEnter your Cradit Amount: ";
            cin>>C_amount;
            lib<<" "<<to<<" "<<C_amount<<"\n";
            lib.close();
            break;
        case 3:
        	equ.open("Owners_Equity.txt",ios::out|ios::app);
        	cout<<"\n\n\n\n\t\t\t\t\tEnter your Cradit Amount: ";
            cin>>C_amount;
            equ<<" "<<to<<" "<<C_amount<<"\n";
            equ.close();
			break;
	    default:
	    	cout<<"\n\t You have Entered the Wrong input: ";
	    	getch();
	    	fg2=1;
	    	break;
	    	
    }
    if(fg2==1)
	{
		goto begn;
	}
  	
  }
  
  
  debit<<" "<<date<<" "<<from<<" "<<D_amount<<" "<<to<<" "<<C_amount<<"\n";                                              
  cout<<"\n\t\tIf you want to Enter more General Entries Press 0 otherwise Press 1 to Continue: ";
  cin>>num;
	if(num==0)
	{
		goto p;
	}
	 debit.close();
	   	
}






void journal::Net_income()
{
	string name;
	system("cls");
		cout<<endl;
		fstream intr,debit;
		intr.open("intro.txt",ios::in);
		
		intr>>name>>date;
		cout<<"\t\t\t\t\t"<<name<<"\n";
		cout<<"\t\t\t\t\t"<<"Income_Statements"<<"\n";
		cout<<"\t\t\t\t\t"<<date<<"\n";
		intr.close();
	
	int exp_sum=0,rev_sum=0,Inc_Tx,Net_inc;
	fstream exp1,rev1;
	cout<<"\n\tRevenue:"<<endl;
	rev1.open("Revenue.txt",ios::in);
	rev1>>to>>amount;
	while(!rev1.eof())
	{
		cout<<"\n\t"<<to<<"\t\t\t\t\t\t"<<amount;
		rev_sum=rev_sum+amount;
		rev1>>to>>amount;
	}
	rev1.close();
	cout<<"\n\n\tExpenses:"<<endl;
	exp1.open("expense.txt",ios::in);
	exp1>>from>>D_amount;
	while(!exp1.eof())
	{
		cout<<"\n\t"<<from<<"\t\t\t"<<D_amount;
		exp_sum=exp_sum+D_amount;
		exp1>>from>>D_amount;	
	}
	exp1.close();
	cout<<"\n\n\tFor Calculating Net_income it is necessory to know the  Total Income_Taxes ";
	cout<<"\n\tEnter total Income_Taxes:";
	cin>>Inc_Tx;
	for(int i=170;i>0;i--)
	{
		cout<<"-";
	}
	cout<<endl;
	Net_inc=(rev_sum-exp_sum)-Inc_Tx;
	cout<<"\n\tNet_Income =  "<<Net_inc;
}




void journal::trial()
{
	string name;
	int debit_sum=0,cradit_sum=0;
	system("cls");
		cout<<endl;
		fstream intr,debit;
		intr.open("intro.txt",ios::in);
		intr>>name>>date;
		cout<<"\t\t\t\t\t"<<name<<"\n";
		cout<<"\t\t\t\t\t"<<"Trial Balance"<<"\n";
		cout<<"\t\t\t\t\t"<<date<<"\n";
		cout<<"\t\tAccount_Names "<<"\t\t Debit"<<"\t\t Cradit"<<endl;
		for(int i=120;i>0;i--)
		{
			cout<<"-";
		}
		cout<<endl;
	debit.open("Debit.txt",ios::in);
	debit>>date>>from>>D_amount>>to>>C_amount;
	while(!debit.eof())
		{
			cout<<"\t\t"<<from<<"\t\t\t"<<D_amount<<"\n";
			cout<<"\t\t"<<to<<"\t\t\t\t\t"<<C_amount<<"\n";
			debit_sum=debit_sum+D_amount;
			cradit_sum=cradit_sum+C_amount;
			debit>>date>>from>>D_amount>>to>>C_amount;
		}
		for(int i=120;i>0;i--)
		{
			cout<<"-";
		}
		cout<<"\n\t\tTotal  =        \t"<<debit_sum<<"          \t"<<cradit_sum;
		getch();
	
	
}





void journal::ledgers()
{
	system("cls");
	cout<<"\t\t\tLedger Accounts.\n\n";

	fstream D_file,D_file1,C_file1,C_file;
	string D_str,D_str1,D_str2,C_str,C_str1,C_str2;
	int D_t=0,C_t=1;
	debit.open("Debit.txt",ios::in);
        
		debit>>date>>from>>D_amount>>to>>C_amount;
		while(!debit.eof())
		{
			
			D_str=from;
			D_str=D_str+".txt";
			D_file.open(D_str.c_str(),ios::out|ios::app);
			D_file<<" "<<date<<" "<<from<<" "<<D_amount<<" "<<D_t<<"\n";
			D_file.close();
			
			C_str=to;
			C_str=C_str+".txt";
			C_file.open(C_str.c_str(),ios::out|ios::app);
			C_file<<" "<<date<<" "<<to<<" "<<C_amount<<" "<<C_t<<"\n";
			C_file.close();
			
			debit>>date>>from>>D_amount>>to>>C_amount;
		}
	 debit.close(); 
	
	int Initial=0,flag=0;
	debit.open("Debit.txt",ios::in);
	debit>>date>>from>>D_amount>>to>>C_amount;
	while(!debit.eof())
	{
		C_str=to;
		C_str=C_str+"_Balance.txt";
		
		D_str=from;
		D_str=D_str+"_Balance.txt";
		
		D_file.open(D_str.c_str(),ios::out);
		D_file<<" "<<Initial;
		D_file.close();
		
		C_file.open(C_str.c_str(),ios::out);
		C_file<<" "<<Initial<<" "<<flag;
		C_file.close();
		
	    debit>>date>>from>>D_amount>>to>>C_amount;
	}
	debit.close();
	
	fstream D_file2,C_file2;
	int D_balance;
	int D_amount1,C_amount1,D_amount2,C_amount2;
	string date1,date2,from1,to1;
	
	debit.open("Debit.txt",ios::in);
	debit>>date>>from>>D_amount>>to>>C_amount;
	while(!debit.eof())
	{
		D_str=from;
    	D_str1=from;
    	D_str2=from;
		D_str=D_str+".txt";
		D_str1=D_str1+"_Balance.txt";
		D_str2=D_str2+"_Balance01.txt";
		
		D_file.open(D_str.c_str(),ios::in);
		D_file>>date1>>from1>>D_amount1>>D_t;
		while(!D_file.eof())
		{
			if(D_t==0)
			{
				D_file1.open(D_str1.c_str(),ios::in);
				D_file1>>C_amount1>>flag;
				D_balance=C_amount1+D_amount1;
				D_file2.open(D_str2.c_str(),ios::out);
				D_file2<<" "<<D_balance<<" "<<flag;
				D_balance=0;
				
				D_file1.close();
				D_file2.close();
				remove(D_str1.c_str());
				rename(D_str2.c_str(),D_str1.c_str());
			}
			D_file>>date1>>from1>>D_amount1>>D_t;
		}
		D_file.close();
	
	    C_str=to;
    	C_str1=to;
    	C_str2=to;
		C_str=C_str+".txt";
		C_str1=C_str1+"_Balance.txt";             
		C_str2=C_str2+"_Balance01.txt";
		
		C_file.open(C_str.c_str(),ios::in);
		C_file>>date2>>to1>>D_amount2>>C_t;
		while(!C_file.eof())
		{
			if(C_t==1)
			{
				C_file1.open(C_str1.c_str(),ios::in);
				C_file1>>C_amount2>>flag;
				D_balance=C_amount2-D_amount2;			
				C_file2.open(C_str2.c_str(),ios::out);
				C_file2<<" "<<D_balance<<" "<<flag;
				D_balance=0;
				
				C_file1.close();
				C_file2.close();
				remove(C_str1.c_str());
				rename(C_str2.c_str(),C_str1.c_str());
			}
			C_file>>date2>>to1>>D_amount2>>C_t;
		}
		C_file.close();            
	
	  debit>>date>>from>>D_amount>>to>>C_amount;	             
	}
	debit.close();
		
	 
	debit.open("Debit.txt",ios::in);            
	debit>>date>>from>>D_amount>>to>>C_amount;
	while(!debit.eof())
	{
		D_str2=from;
		D_str=from;
    	D_str1=from;
    	D_str=D_str+".txt";
    	D_str1=D_str1+"_Balance.txt";
    	D_file1.open(D_str1.c_str(),ios::in);
		D_file1>>D_amount2>>flag;
//		if(flag==1)
//		{
//			debit>>date>>from>>D_amount>>to>>C_amount;
//		}
		                                                                                                  
    	D_file.open(D_str.c_str(),ios::in);
    	
    	cout<<endl;
    	for (int j = 75; j > 0; j--)
		{
			cout << "-";
		}
		D_file>>date1>>from1>>D_amount1>>D_t;
		cout<<"\n\t\t\t"<<from1;
		cout<<"\n\t\tDebit"<<"\t\tCradit";
		while(!D_file.eof())
		{
			
			if(D_t==0)
			{
			  cout<<"\n\t"<<date1<<"\t"<<D_amount1;
			}
			else if(D_t==1)
			{
		    cout<<"\n\t"<<date1<<"\t\t\t\t"<<D_amount1;	
			}
			D_file>>date1>>from1>>D_amount1>>D_t;
		}
		D_file.close();
		
		cout<<"\n\tTotal Balance = "<<D_amount2<<endl;
		flag=1;
		D_str2=D_str2+"_Balance01.txt";
		D_file2.open(D_str2.c_str(),ios::out);
		D_file2<<" "<<D_amount2<<" "<<flag;
		D_file2.close();
		D_file1.close();
		remove(D_str1.c_str());
		rename(D_str2.c_str(),D_str1.c_str());
	    
	    
	 debit>>date>>from>>D_amount>>to>>C_amount;	
	}	 
	debit.close(); 
	 
	debit.open("Debit.txt",ios::in);  
	debit>>date>>from>>D_amount>>to>>C_amount;
	while(!debit.eof())
	{
		D_str2=to;
		D_str=to;
    	D_str1=to;
    	D_str=D_str+".txt";
    	D_str1=D_str1+"_Balance.txt";
    	D_file1.open(D_str1.c_str(),ios::in);
		D_file1>>D_amount2>>flag;
//		if(flag==1)
//		{
//			debit>>date>>from>>D_amount>>to>>C_amount;
//		}
		
    	D_file.open(D_str.c_str(),ios::in);
    	
    	cout<<endl;
    	for (int j = 75; j > 0; j--)
		{
			cout << "-";
		}
		D_file>>date1>>from1>>D_amount1>>D_t;
		cout<<"\n\t\t\t"<<from1;
		cout<<"\n\t\tDebit"<<"\t\tCradit";
		while(!D_file.eof())
		{
			
			if(D_t==0)
			{
			  cout<<"\n\t"<<date1<<"\t"<<D_amount1;
			}
			else if(D_t==1)
			{
		    cout<<"\n\t"<<date1<<"\t\t"<<D_amount1;	
			}
			D_file>>date1>>from1>>D_amount1>>D_t;
		}
		D_file.close();
		
		cout<<"\n\tTotal Balance = "<<D_amount2<<endl;
		flag=1;
		D_str2=D_str2+"_Balance01.txt";
		D_file2.open(D_str2.c_str(),ios::out);
		D_file2<<" "<<D_amount2<<" "<<flag;
		D_file2.close();
		D_file1.close();
		remove(D_str1.c_str());
		rename(D_str2.c_str(),D_str1.c_str());
	    
//	    f:
	 debit>>date>>from>>D_amount>>to>>C_amount;	
	}	
	
		 
	debit.close();   
	getch();
}
