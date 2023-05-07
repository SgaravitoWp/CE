

proc sgplot data=sashelp.citimon;
    series    x=date y=fspcap / name="a" legendlabel="FSPCAP"
                                lineattrs=(color=gray pattern=solid thickness=1);
    series    x=date y=fspcom   / name="b" legendlabel="FSPCOM"
                                lineattrs=(color=red pattern=solid thickness=1);
    series    x=date y=fspcon   / name="c" legendlabel="FSPCON"
                                lineattrs=(color=green pattern=solid thickness=1);
    series    x=date y=lhur   / name="d" y2axis legendlabel="LHUR"
                                lineattrs=(color=blue pattern=solid thickness=1);
    xaxis     label=" " grid valueattrs=(color=black size=10);
    yaxis     label="Valor del índice" labelattrs=(color=blue);
    y2axis    label="Tasa de desempleo" labelattrs=(color=blue);
    keylegend "a" "b" "c" "d" / noborder down=1 location=outside;

run;

