function VectorAttributes()
    global Vector_Cache;
    disp('To exit type -1');
    v = NaN;
    f = true;
    vec_idx = 0;

    while f
        List_Vector_Cache();
        vec = entervec();
        vec_idx = vec_idx + 1;

        if (isscalar(vec) && vec == -1)
            f = false;
            continue;
        end

        [Original_Vector, Magnitude, Unit_Vector] = attribs(vec);
        Vector_Cache(vec_idx).original(Original_Vector);
        Vector_Cache(vec_idx).mag(Magnitude);
        Vector_Cache(vec_idx).unit(Unit_Vector);

        pick = menuForVec(va);

    end

end

function List_Vector_Cache(Vector_Cache)
    global Vector_Cache;
    fprintf('Stored Vectors:\n');
    len = numel(Vector_Cache);

    if (len == 0)
        fprintf('------|Calculator History Empty!.|------\n');
        return;
    end

    fprintf('\n');

    for idx = 1:len
        fprintf('Vector %d :[\n', idx);
        fprintf('', Vector_Cache(idx).original);
        fprintf(']');
    end

end

function vec = entervec()
    %fprintf('Enter Vector (Ex. [1 2 3]): ');
    vec = input('Enter Vector (Ex. [1 2 3]):');
end

function [Original_Vector, Magnitude, Unit_Vector] = attribs(vec)
    Original_Vector = vec;
    Magnitude = sqrt(sum(vec.^2));
    Unit_Vector = vec ./ Magnitude;
    fprintf('Magnitude: |%f|\nUnit Vector: {%fi %fj %fk}', Magnitude, Unit_Vector);
end
