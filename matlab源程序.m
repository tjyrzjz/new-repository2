whole_image=imread('head.jpg'); 
figure,imshow(whole_image);
title('´ý¼ì²âÍ¼Æ¬');
[x,y]=size(whole_image);
y=y/3;
whole_r=double(whole_image(:,:,1));
whole_g=double(whole_image(:,:,2));
whole_b=double(whole_image(:,:,3));

mini_image=imread('eye.jpg');
figure,imshow(mini_image);
title('Ö¸¶¨ÇøÓò');
[m,n]=size(mini_image);
n=n/3;
mini_r=double(mini_image(:,:,1));
mini_g=double(mini_image(:,:,2));
mini_b=double(mini_image(:,:,3));

flag=0;
num=0;
for i=1:x-m+1
    for j=1:y-n+1
        for x0=0:m-1
            for y0=0:n-1
%                 if whole_r(x0+i,y0+j)==mini_r(x0+1,y0+1)&&whole_g(x0+i,y0+j)==mini_g(x0+1,y0+1)&&whole_b(x0+i,y0+j)==mini_b(x0+1,y0+1)
                if abs(whole_r(x0+i,y0+j)+whole_g(x0+i,y0+j)+whole_b(x0+i,y0+j)-(mini_r(x0+1,y0+1)+mini_g(x0+1,y0+1)+mini_b(x0+1,y0+1)))<=80
                    num=num+1;
                else num=0;
                    flag=1;
                    break;
                end
                if num==m*n;
                    for print_x=0:m-1
                        for print_y=0:n-1
                            fprintf('(%d,%d) ',i+print_x,j+print_y);
                        end
                        fprintf('\n');
                    end
                    num=0;
                end
            end
            if flag==1
                flag=0;
                break;
            end
        end
    end
end