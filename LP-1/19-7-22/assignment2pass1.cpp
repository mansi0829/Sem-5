//============================================================================
// Name        : 31231_pass1.cpp
// Author      : 
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================


#include <bits/stdc++.h>
using namespace std;

struct OPtab
{
    string opcode;
    string mclass;
    string mnemonic;
};
struct OPtab Optab[18] = {
    {"STOP", "IS", "00"},
    {"ADD", "IS", "01"},
    {"SUB", "IS", "02"},
    {"MULT", "IS", "03"},
    {"MOVER", "IS", "04"},
    {"MOVEM", "IS", "05"},
    {"COMP", "IS", "06"},
    {"BC", "IS", "07"},
    {"DIV", "IS", "08"},
    {"READ", "IS", "09"},
    {"PRINT", "IS", "10"},
    {"START", "AD", "01"},
    {"END", "AD", "02"},
    {"ORIGIN", "AD", "03"},
    {"EQU", "AD", "04"},
    {"LTORG", "AD", "05"},
    {"DC", "DL", "01"},
    {"DS", "DL", "02"}};
int get_OP(string s)
{
    for (int i = 0; i < 18; ++i)
    {
        if (Optab[i].opcode == s)
            return i;
    }
    return -1;
}
int get_regid(string s)
{
    if (s == "AREG")
        return 1;
    else if (s == "BREG")
        return 2;
    else if (s == "CREG")
        return 3;
    else if (s == "DREG")
        return 4;
    else
        return (-1);
}

int getConditionCode(string s)
{
    if (s == "LT")
        return 1;
    else if (s == "LE")
        return 2;
    else if (s == "EQ")
        return 3;
    else if (s == "GT")
        return 4;
    else if (s == "GE")
        return 5;
    else if (s == "ANY")
        return 6;
    else
        return (-1);
}
struct symbol_table
{
    int no;
    string sname;
    string addr;
};

struct symbol_table ST[10];
bool presentST(string s)
{
    for (int i = 0; i < 10; ++i)
    {
        if (ST[i].sname == s)
            return true;
    }
    return false;
}
int getSymID(string s)
{
    for (int i = 0; i < 10; ++i)
    {
        if (ST[i].sname == s)
            return i;
    }
    return (-1);
}
struct literal_table
{
    int no;
    string lname;
    string addr;
};
struct literal_table LT[10];

int getLitID(string s)
{
    for (int i = 0; i < 10; ++i)
    {
        if (LT[i].lname == s)
            return i;
    }
    return (-1);
}

int main()
{
    ifstream fin;
    fin.open("code.txt");

    ofstream ic, st, lt;
    const char *path1 = "ic.txt";
    const char *path2 = "symtable.txt";
    const char *path3 = "littable.txt";
    ic.open(path1);
    st.open(path2);
    lt.open(path3);
    string label, opcode, op1, op2;
    int scnt = 0, lcnt = 0, nlcnt = 0, LC = 0;

    cout << "\nPass 1 output" << endl;
    cout << "\n Label\tOpcode\tOp1\tOp2\tLc\tIntermediate code" << endl;

    while (!fin.eof())
    {
        fin >> label >> opcode >> op1 >> op2;
        int id;
        string IC, lc;

        id = get_OP(opcode);
        IC = "(" + Optab[id].mclass + "," + Optab[id].mnemonic + ") ";
        if (opcode == "START")
        {
            lc = "---";
            if (op1 != "NAN")
            {
                LC = stoi(op1);
                IC += "(C," + op1 + ")  NAN";
            }
        }

        if (opcode == "EQU")
        {
            lc = "---";
            IC += " NAN     NAN";
            if (presentST(label))
            {
                ST[getSymID(label)].addr = ST[getSymID(op1)].addr;
            }
            else
            {
                ST[scnt].no = scnt + 1;
                ST[scnt].sname = label;
                ST[scnt].addr = ST[getSymID(op1)].addr;
                scnt++;
            }
        }

        else if (label != "NAN")
        {
            if (presentST(label))
            {
                ST[getSymID(label)].addr = to_string(LC);
            }
            else
            {
                ST[scnt].no = scnt + 1;
                ST[scnt].sname = label;
                ST[scnt].addr = to_string(LC);
                scnt++;
            }
        }

        if (opcode == "ORIGIN")
        {
            string token1, token2;
            char op;
            stringstream ss(op1);
            size_t found = op1.find('+');
            if (found != string::npos)
                op = '+';
            else
                op = '-';
            getline(ss, token1, op);
            getline(ss, token2, op);
            lc = "---";
            if (op == '+')
            {
                LC = stoi(ST[getSymID(token1)].addr) + stoi(token2);
                IC += "(S,0" + to_string(ST[getSymID(token1)].no) + ")+" + token2 + " NAN";
            }
            else
            {
                LC = stoi(ST[getSymID(token1)].addr) - stoi(token2);
                IC += "(S,0" + to_string(ST[getSymID(token1)].no) + ")-" + token2 + " NAN";
            }
        }

        if (opcode == "LTORG")
        {
            cout << "  " << label << "\t" << opcode << "\t" << op1 << "\t" << op2 << "\t";
            for (int i = lcnt - nlcnt; i < lcnt; ++i)
            {
                lc = to_string(LC);
                IC = "(DL,01) (C,";
                string c(1, LT[i].lname[2]);
                IC += c + ")    NAN";
                LT[i].addr = to_string(LC);
                LC++;
                if (i < lcnt - 1)
                    cout << lc << "\t" << IC << "\n\t\t\t\t";
                else
                    cout << lc << "\t" << IC << endl;
                ic << lc << "\t" << IC << endl;
            }
            continue;
        }

        if (opcode == "END")
        {
            lc = "---";
            IC += " NAN     NAN";
            cout << "  " << label << "\t" << opcode << "\t" << op1 << "\t" << op2 << "\t" << lc << "\t" << IC << endl;
            ic << lc << "\t" << IC << endl;
            if (nlcnt)
            {
                for (int i = lcnt - nlcnt; i < lcnt; ++i)
                {
                    lc = to_string(LC);
                    IC = "(DL,01) (C,";
                    string c(1, LT[i].lname[2]);
                    IC += c + ")    NAN";
                    LT[i].addr = to_string(LC);
                    LC++;
                    cout << "\t\t\t\t" << lc << "\t" << IC << endl;
                    ic << lc << "\t" << IC << endl;
                }
            }
            break;
        }
        if (opcode == "DC" || opcode == "DS")
        {
            lc = to_string(LC);
            if (opcode == "DS")
            {
                IC += "(C," + op1 + ")    NAN";
                LC += stoi(op1);
            }
            else
            {
                string c(1, op1[1]);
                IC += "(C," + c + ")";
                LC++;
            }
        }

        if (opcode != "START" && opcode != "END" && opcode != "ORIGIN" && opcode != "EQU" && opcode != "LTORG" && opcode != "DC" && opcode != "DS")
        {
            if (op2 == "NAN")
            {
                if (op1 == "NAN")
                {
                    lc = to_string(LC);
                    LC++;
                    IC += " NAN     NAN";
                }
                else
                {
                    if (presentST(op1))
                    {
                        IC += "(S,0" + to_string(ST[getSymID(op1)].no) + ")";
                        lc = to_string(LC);
                        LC++;
                    }
                    else
                    {
                        ST[scnt].no = scnt + 1;
                        ST[scnt].sname = op1;
                        scnt++;
                        IC += "(S,0" + to_string(ST[getSymID(op1)].no) + ")";
                        lc = to_string(LC);
                        LC++;
                    }
                }
            }
            else
            {
                if (opcode == "BC")
                    IC += "(" + to_string(getConditionCode(op1)) + ")     ";
                else
                    IC += "(" + to_string(get_regid(op1)) + ")     ";

                if (op2[0] == '=') // operand2 is a literal
                {
                    LT[lcnt].no = lcnt + 1;
                    LT[lcnt].lname = op2;
                    lcnt++;
                    nlcnt++;
                    IC += "(L,0" + to_string(LT[getLitID(op2)].no) + ")";
                }
                else // operand2 is a symbol
                {
                    if (presentST(op2))
                    {
                        IC += "(S,0" + to_string(ST[getSymID(op2)].no) + ")";
                    }
                    else
                    {
                        ST[scnt].no = scnt + 1;
                        ST[scnt].sname = op2;
                        scnt++;
                        IC += "(S,0" + to_string(ST[getSymID(op2)].no) + ")";
                    }
                }
                lc = to_string(LC);
                LC++;
            }
        }
        cout << "  " << label << "\t" << opcode << "\t" << op1 << "\t" << op2 << "\t" << lc << "\t" << IC << endl;
        ic << lc << "\t" << IC << endl;
    }
    cout << " \nSymbol table" << endl;
    cout << "\n No.\tSymbol\tAddress" << endl;
    for (int i = 0; i < scnt; ++i)
    {
        cout << "  " << ST[i].no << "\t " << ST[i].sname << "\t  " << ST[i].addr << endl;
        st << ST[i].no << "\t " << ST[i].sname << "\t  " << ST[i].addr << endl;
    }
    cout << "\nLiteral table" << endl;
    cout << "\n No.\tLiteral\tAddress" << endl;
    for (int i = 0; i < lcnt; ++i)
    {
        cout << "  " << LT[i].no << "\t " << LT[i].lname << "\t  " << LT[i].addr << endl;
        lt << LT[i].no << "\t " << LT[i].lname << "\t  " << LT[i].addr << endl;
    }
    return 0;
}
