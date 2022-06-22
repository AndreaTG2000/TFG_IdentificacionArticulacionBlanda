function [tf_mean] = tf_mean(tf_in)

num(1:length(tf_in(1).Numerator))=0;
den(1:length(tf_in(1).Denominator))=0;
tf_in(round(length(tf_in)/2))=[]; % No incluye el CERO

n_tf=length(tf_in);
for i=1:n_tf
    num=num+tf_in(i).Numerator;
    den=den+tf_in(i).Denominator;
end

mean_num=num/n_tf;
mean_den=den/n_tf;

tf_mean=tf(mean_num,mean_den);
end
