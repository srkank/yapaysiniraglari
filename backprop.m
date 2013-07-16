function [dogru, yanlis, yanlislar]=backprop(gizli, cikis, epok, p, t, ptest, ttest)
    fonk='traingda';
    net= newff(minmax(p), [gizli,cikis], {'logsig','purelin'},fonk);
    net.trainParam.epochs =epok;
    net.trainParam.show =250;
    net.trainParam.goal = 0.1;
    net.trainParam.lr = 0.001;
    
    net = init(net);
    net = train(net,p,t);    
    sonuc = sim(net,ptest);
    ncol = size(sonuc);
    
    
    fark = round(sonuc) - ttest;
    dogru = 0;
    yanlis = 0;
    ndx = 0;

    for i=1:ncol(2)
        if fark(i) == 0
            dogru =dogru + 1;
        else 
            yanlis =yanlis +1;
            ndx =ndx +1;
            yanlislar(ndx) = i;
        end
    end
    
end

    
    



