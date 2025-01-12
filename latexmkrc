$clean_ext = 'acn acr alg bbl cpt glg glo gls ist run.xml';
$out_dir = "out";
$pdf_mode = 1;
$pdflatex = 'pdflatex -shell-escape -interaction=nonstopmode %O %S -file-line-error -synctex=1';

add_cus_dep('glo', 'gls', 0, 'makeglo2gls');
add_cus_dep('acn', 'acr', 0, 'makeacn2acr');
sub makeglo2gls {
    system("makeindex -s '$_[0]'.ist -t '$_[0]'.glg -o '$_[0]'.gls '$_[0]'.glo");
}
sub makeacn2acr {
    system("makeindex -s '$_[0]'.ist -t '$_[0]'.alg -o '$_[0]'.acr '$_[0]'.acn");
}
