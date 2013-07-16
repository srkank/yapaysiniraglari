function [x,sonuclar]=randtest(testsayisi)
    x=randint(10,testsayisi);
    [R C] = size(x);
    bir_sayisi = 0;
    sonuclar = [];
    for c=1:C
        for r=1:R
            if(x(r,c)==1)
                bir_sayisi = bir_sayisi + 1;
            end
        end
        if(bir_sayisi >=5)
            sonuclar(c) = 1;
        else
            sonuclar(c) = 0;
        end
        bir_sayisi = 0;
    end
end
        